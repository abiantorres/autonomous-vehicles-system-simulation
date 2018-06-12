#!/usr/bin/env python

from Tkinter import *
import Tkinter, Tkconstants, tkFileDialog, rospkg, subprocess, re, threading, psutil, os, signal
from multiprocessing import Process, Queue
from tkMessageBox import *
import ntpath, time, atexit

class Gui():

    def __init__(self):

        self.server_running = False
        self.server_process = None

        self.simulation_running = False
        self.simulation_process = None
        self.simulation_thread = None

        self.map_running = False
        self.map_process = None
        self.map_thread = None

        self.plan_running = False
        self.plan_process = None
        self.plan_thread = None

        self.online_conf_running = False
        self.online_conf_process = None
        self.online_conf_thread = None

        self.plan_path = None
        self.new_plan_path = None
        self.world_path = None
        self.map_path = None
        self.mapping_path = None

        self.rospack = rospkg.RosPack()
        self.navigation_pkg_path = str(self.rospack.get_path('navigation'))
        self.gazebo_pkg_path = str(self.rospack.get_path('gazebo_simulation'))
        self.maps_path = self.navigation_pkg_path + "/maps"
        self.worlds_path = self.gazebo_pkg_path + "/worlds"
        self.plans_path = "~/.ros/"
        self.sh_path = re.sub("navigation","",self.navigation_pkg_path)
        self.sh_path = re.sub("/src/","/sh/",self.sh_path)
        self.root = Tk()
        self.root.title("Robotic Simulation")

        self.parametersLabelFrame = LabelFrame(self.root, text="Simulation parameters")
        self.parametersLabelFrame.grid(column=0, row=0, padx=20, pady=20)

        self.filesLabelFrame = LabelFrame(self.root, text="Simulation files")
        self.filesLabelFrame.grid(column=0, row=2, padx=20, pady=20)

        self.actionsLabelFrame = LabelFrame(self.root, text="Simulation actions")
        self.actionsLabelFrame.grid(column=0, row=3, padx=20, pady=20)

        self.n_iterations_label = Label(self.parametersLabelFrame, text="Number of simulation iterations", font=("Arial Bold", 12))
        self.n_iterations_label.grid(column=0, row=0, padx=20, pady=20)
        self.n_iterations_slider = Scale(self.parametersLabelFrame, from_= 2, to=100, orient=HORIZONTAL, font=("Arial Bold", 12))
        self.n_iterations_slider.grid(column=1, row=0, padx=20, pady=20)

        self.timeout_factor_label = Label(self.parametersLabelFrame, text="Time out robot factor", font=("Arial Bold", 12))
        self.timeout_factor_label.grid(column=0, row=1, padx=20, pady=20)
        self.timeout_factor_slider = Scale(self.parametersLabelFrame, from_= 1, to=20, orient=HORIZONTAL, font=("Arial Bold", 12))
        self.timeout_factor_slider.set(10)
        self.timeout_factor_slider.grid(column=1, row=1, padx=20, pady=20)

        self.distance_between_obstacles_label = Label(self.parametersLabelFrame, text="Distance between obstacles (m)", font=("Arial Bold", 12))
        self.distance_between_obstacles_label.grid(column=0, row=2, padx=20, pady=20)
        self.distance_between_obstacles_slider = Scale(self.parametersLabelFrame, from_= 1, to=50, orient=HORIZONTAL, font=("Arial Bold", 12))
        self.distance_between_obstacles_slider.set(3)
        self.distance_between_obstacles_slider.grid(column=1, row=2, padx=20, pady=20)

        self.world_file_label = Label(self.filesLabelFrame, text="World file", font=("Arial Bold", 12))
        self.world_file_label.grid(column=0, row=0, padx=20, pady=20)
        self.world_file_button = Button(self.filesLabelFrame, text='search world file', font=("Arial Bold", 12), command=self.open_world_file_dialog)
        self.world_file_button.grid(column=1, row=0, padx=20, pady=20)
        self.world_file_loaded_label = Label(self.filesLabelFrame, text="No world file selected", font=("Arial Bold", 8))
        self.world_file_loaded_label.grid(column=2, row=0, padx=20, pady=20)

        self.map_file_label = Label(self.filesLabelFrame, text="Map file", font=("Arial Bold", 12))
        self.map_file_label.grid(column=0, row=1, padx=20, pady=20)
        self.map_file_button = Button(self.filesLabelFrame, text='search map file', font=("Arial Bold", 12), command=self.open_maps_file_dialog)
        self.map_file_button.grid(column=1, row=1, padx=20, pady=20)
        self.map_file_loaded_label = Label(self.filesLabelFrame, text="No map file selected", font=("Arial Bold", 8))
        self.map_file_loaded_label.grid(column=2, row=1, padx    =20, pady=20)

        self.plan_file_label = Label(self.filesLabelFrame, text="Plan file", font=("Arial Bold", 12))
        self.plan_file_label.grid(column=0, row=3, padx=20, pady=20)
        self.plan_file_button = Button(self.filesLabelFrame, text='search plan file', font=("Arial Bold", 12), command=self.open_plans_file_dialog)
        self.plan_file_button.grid(column=1, row=3, padx=20, pady=20)
        self.plan_file_loaded_label = Label(self.filesLabelFrame, text="No plan file selected", font=("Arial Bold", 8))
        self.plan_file_loaded_label.grid(column=2, row=3, padx=20, pady=20)

        self.simulation_button = Button(self.actionsLabelFrame, text='Run simulation', font=("Arial Bold", 12), command=self.simulation_event)
        self.simulation_button.grid(column=0, row=0, padx=20, pady=20)

        self.plan_button = Button(self.actionsLabelFrame, text='Build plan', font=("Arial Bold", 12), command=self.plan_event)
        self.plan_button.grid(column=1, row=0, padx=20, pady=20)

        self.server_button = Button(self.actionsLabelFrame, text='Start server', font=("Arial Bold", 12), command=self.server_event)
        self.server_button.grid(column=2, row=0, padx=20, pady=20)

        self.map_button = Button(self.actionsLabelFrame, text='Build map', font=("Arial Bold", 12), command=self.map_event)
        self.map_button.grid(column=3, row=0, padx=20, pady=20)

        self.online_conf_button = Button(self.actionsLabelFrame, text='Open Online Configuration', font=("Arial Bold", 12), command=self.online_conf_event)
        self.online_conf_button.grid(column=4, row=0, padx=20, pady=20)

        self.root.grid_columnconfigure(index=0, weight=1)
        self.root.grid_rowconfigure(index=0, weight=1)

        #atexit.register(self.exit_hantkMessageBoxdler)

        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)

    def on_closing(self):
        if askokcancel("Quit", "Do you want to quit?"):
            self.root.destroy()
            threading.Thread(target=self.close_simulation_method).start()

    def exit_handler(self):
        threading.Thread(target=self.close_simulation_method).start()

    def kill(self, proc_pid):
        process = psutil.Process(proc_pid)
        for proc in process.children(recursive=True):
            proc.kill()
        process.kill()

    def path_leaf(self, path):
        head, tail = ntpath.split(path)
        return tail or ntpath.basename(head)

    def online_conf_event(self):
        pass

    def simulation_event(self):
        if(not self.plan_running and not self.map_running):
            if(self.world_path != None and self.map_path != None \
                and self.plan_path != None):
                if(not self.simulation_running):
                    self.simulation_running = True
                    self.simulation_button["text"] = "Close simulation"
                    self.simulation_thread = threading.Thread(target=self.simulation_method).start()
                elif (self.simulation_running and self.simulation_process != None):
                    self.simulation_running = False
                    self.simulation_button["text"] = "Start simulation"
                    self.kill(self.simulation_process.pid)
                    #self.simulation_thread.daemon = True
                    threading.Thread(target=self.close_simulation_method).start()
                    self.simulation_process = None
                else:
                    self.simulation_running = False
                    self.simulation_process = None
            else:
                showinfo('Simulation files', 'Make sure you have selected all the simulation files (map, world and plan)')
        else:
            showinfo('Actions', 'There is another action in execution. Make sure you have closed it.')

    def plan_event(self):
        if(not self.simulation_running and not self.map_running):
            if(self.world_path != None and self.map_path != None):
                if(not self.plan_running):
                    self.plan_running = True
                    self.plan_button["text"] = "Save plan"
                    self.open_plan_file_dialog()
                    self.plan_thread = threading.Thread(target=self.plan_method).start()
                elif (self.plan_running and self.plan_process != None):
                    self.plan_running = False
                    self.plan_button["text"] = "Build plan"
                    threading.Thread(target=self.save_plan_method).start()
                    time.sleep(5)
                    self.kill(self.plan_process.pid)
                    #self.simulation_thread.daemon = True
                    threading.Thread(target=self.close_simulation_method).start()
                    self.plan_process = None
                else:
                    self.plan_running = False
                    self.plan_process = None
            else:
                showinfo('Simulation files', 'Make sure you have selected all the simulation files (world and map)')
        else:
            showinfo('Actions', 'There is another action in execution. Make sure you have closed it.')


    def server_event(self):
        if(not self.server_running):
            self.server_running = True
            self.server_button["text"] = "Close server"
            threading.Thread(target=self.server_method).start()
        elif (self.server_running and self.server_process != None):
            self.server_running = False
            self.server_button["text"] = "Start server"
            self.kill(self.server_process.pid)
            self.server_process = None
        else:
            self.server_running = False
            self.server_process = None

    def online_conf_event(self):
        if(self.simulation_running or self.map_running or self.plan_running):
            self.online_conf_running = True
            self.online_conf_button["text"] = "Open Online Configuration"
            threading.Thread(target=self.online_conf_method).start()
        else:
            showinfo('Actions', 'Run a configurable action.')

    def map_event(self):
        if(not self.simulation_running and not self.plan_running):
            if(self.world_path != None):
                if(not self.map_running):
                    self.map_running = True
                    self.map_button["text"] = "Stop mapping"
                    self.map_thread = threading.Thread(target=self.map_method).start()
                elif (self.map_running and self.map_process != None):
                    self.map_running = False
                    self.open_mapping_file_dialog()
                    self.map_button["text"] = "Build map"
                    time.sleep(5)
                    self.kill(self.map_process.pid)
                    #self.simulation_thread.daemon = True
                    threading.Thread(target=self.close_simulation_method).start()
                    self.map_process = None
                else:
                    self.map_running = False
                    self.map_process = None
            else:
                showinfo('Simulation files', 'Make sure you have selected all the simulation files. (world)')
        else:
            showinfo('Actions', 'There is another action in execution. Make sure you have closed it.')

    def server_method(self):
        self.server_process = subprocess.Popen(self.sh_path + "ros_server.sh",   shell=True)

    def online_conf_method(self):
        self.server_process = subprocess.Popen(self.sh_path + "online_parameters_reconfiguration.sh",   shell=True)

    def simulation_method(self):
        self.simulation_process = subprocess.Popen(self.sh_path + "full_simulation.sh "\
            + self.plan_path + " " + str(self.n_iterations_slider.get()) \
            + " " + str(self.distance_between_obstacles_slider.get()) \
            + " " + self.world_path + " " + self.map_path + " " + str(self.timeout_factor_slider.get()) + ".0", shell=True)

    def map_method(self):
        self.map_process = subprocess.Popen(self.sh_path + "full_mapping.sh "\
            +  self.world_path,   shell=True)
        showinfo('Mapping', 'Move the robot with the teleop node opened in the xterm window.')

    def plan_method(self):
        self.plan_process = subprocess.Popen(self.sh_path + "full_plan.sh "\
            +  self.world_path + " " + self.map_path + " " + self.new_plan_path ,   shell=True)
        showinfo('Plan', 'Select the goals in the world by pressing the 2D Pose Estimate button in the Rviz window first.' + \
            ' IMPORTANT: First, move the robot to the initial position you want in Gazebo')

    def save_plan_method(self):
        self.plan_process = subprocess.Popen(self.sh_path + "path_to_file.sh",   shell=True)

    def save_map_method(self):
        subprocess.Popen(self.sh_path + "save_map.sh " +  self.mapping_path,   shell=True)

    def close_simulation_method(self):
        subprocess.Popen(self.sh_path + "close_simulation.sh",   shell=True)

    def open_plan_file_dialog(self):
        filename = tkFileDialog.asksaveasfilename(initialdir = self.plans_path,title = "Select a plan file name",filetypes = [])
        self.new_plan_path = self.path_leaf(filename) + ".bag"

    def open_world_file_dialog(self):
        filename = tkFileDialog.askopenfilename(initialdir = self.worlds_path,title = "Select the world file",filetypes = (("sdf or world files","*.sdf *.world"),("all files","*.*")))
        self.world_path = filename
        self.world_file_loaded_label["text"] = self.path_leaf(filename)
    def open_maps_file_dialog(self):
        filename = tkFileDialog.askopenfilename(initialdir = self.maps_path,title = "Select the map file",filetypes = (("yaml files","*.yaml"),("all files","*.*")))
        self.map_path = filename
        self.map_file_loaded_label["text"] = self.path_leaf(filename)
    def open_plans_file_dialog(self):
        filename = tkFileDialog.askopenfilename(initialdir = self.plans_path,title = "Select the map file",filetypes = (("bag files","*.bag"),("all files","*.*")))
        self.plan_path = filename
        self.plan_file_loaded_label["text"] = self.path_leaf(filename)
    def open_mapping_file_dialog(self):
        filename = tkFileDialog.asksaveasfilename(initialdir = self.maps_path,title = "Select a map file name",filetypes = [])
        self.mapping_path = filename
        threading.Thread(target=self.save_map_method).start()

    def mainloop(self):
        self.root.mainloop()


if __name__ == '__main__':
    gui = Gui()
    gui.mainloop()
