# autonomous-vehicles-system-simulation

## Description:

In the development of an autonomous transport system, its advisable to carry out a battery of tests or simulations before checking their operation in a real environment. For this purpose, we have at our disposal certain software tools that allow, among others things, simulate the environment and the behavior of a robot on it. For the development of this project at this level of abstraction, we will use ROS (Robot Operating System). This "operative system" is a free and open source framework for the development of software for robots that provides the functionality of an operating system in a heterogeneous cluster. It provides the standard services of an operating system such as hardware abstraction, control of low level devices, implementation of commonly used functionalities, message passing between processes and package maintenance. It is based on a graph architecture where the processing takes place in nodes that can receive, send and multiplex messages from sensors, control, states, schedulePs and actuators, among others.

However, this is only one aspect of the problem. In any type of study, it is also interesting simulate the impact that the implementation of a system would have, in our case of transport autonomous, in certain scenarios. Consequently, it would be necessary to carry out a simulation at a higher level of abstraction. For example, to simulate an autonomous system of public transportation, such as a fleet of taxis or buses, we would have, on the one hand, simulate the behavior of each of the vehicles within the environment and, on the other hand, simulate certain elements of the urban environment, such as the density of vehicles by sections, for analyze the proposed solution in terms of its cost / effectiveness. In the latter case, the tool to use will be PSIGHOS. This library implements a discrete event simulator process oriented The internal simulator works on Java and has the purpose of implementation of our models. Being designed primarily by researchers from the
University of La Laguna, one of the main advantages offered by PSIGHOS is its great versatility and the functionalities that it contributes in tasks of "redistribution of resources" and "process reengineering". Therefore, this project intends to work on these two levels of simulation and in the integration of them.

## Status:

> Still in development phase.

* 27/03/2018: A basic simulation of the PR2 robot model using a Hokuyo laser sensor. The graphics simulations will be launch using Blender, which is setting by default in MORSE, and the physics simulations using the Bullet library. (Finally discard MORSE)
* 02/04/2018: Improving the configuration of the navigation stack to get a better autonomous behavior, especially move_base node parameters. The robot model used is a differential drive formed by two wheels and one caster wheel anchored to a rectangular base next to a hokuyo laser sensor.
* 16/04/2018: Adding save and load (from file) path nodes in the low level simulation and importing PSIGHOS library dependencies.

## Dependencies:

* This proyect should be build correctly in a [Ubuntu Xenial Xerus (16.04)](http://releases.ubuntu.com/16.04/) system.

* For getting [rosjava](http://wiki.ros.org/rosjava) working, execute the followig command in a new terminal (note that it must be installed for ROS kinetic):

```
sudo apt-get install ros-kinetic-catkin ros-kinetic-rospack python-wstool openjdk-8-jdk
```

* Install ROS Kinetic following [this tutorial](http://wiki.ros.org/kinetic/Installation/Ubuntu).

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
apt-cache search ros-kinetic
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source /opt/ros/kinetic/setup.bash
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt-get install ros-kinetic-teb-local-planner
```

* ~~Install the MORSE simulator following [this tutorial](https://www.openrobots.org/morse/doc/stable/user/installation.html).~~ **NO USING MORSE ANY MORE, SO NO INSTALLATION NEEDED**

```
# Cmake:
sudo apt-get install cmake
# Python:
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip
python3 -V
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
sudo pip3 install numpy
# Blender:
sudo add-apt-repository ppa:thomas-schiex/blender
sudo apt-get update
sudo apt-get install blender
# Morse:
sudo apt-get install python3-morse-simulator
```

* Install the following python dependencies to get rosbridge_server working from source:
	* [Rosbridge source code](https://github.com/RobotWebTools/rosbridge_suite)

```
# install pip if you have not done it yet:
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
# Other dependencies:
sudo pip install tornado
sudo apt-get install ros-kinetic-rosauth
# Get the rosbridge_suite package:
git clone https://github.com/RobotWebTools/rosbridge_suite.git
cd ~/your_work_space
catkin_make
source devel/setup.bash
```

* If you prefer to get rosbridge_server working via apt-get:

```
sudo apt-get install ros-kinetic-rosbridge-suite
source /opt/ros/kinetic/setup.bash
# To launch rosbridge_sever, execute the following launch file:
roslaunch rosbridge_server rosbridge_websocket.launch
```

* Install obstacles algorithm generation dependencies:

```
# Install sympy for geometry operations:
sudo pip install sympy
# Install pyproj for points generation:
sudo pip install pyproj
```

* Install **MongoDB** to provide persistence to our simulation system. This will help us to manipulate the data and draw conclusions:

Install mongodb **package** via apt-get:

```
sudo apt-get install mongodb
```

To **start** the mongdb service:

```
sudo service mongodb start
```

To **stop** the mongdb service:

```
sudo service mongodb stop
```

The high level simulation needs the following dependencies for the proper functioning of MongoDB with **Java**:

1. mongodb-driver-3.0.2.jar ([mongodb-driver](https://oss.sonatype.org/content/repositories/releases/org/mongodb/mongodb-driver/3.0.2/))

2. bson-3.0.2.jar ([bson](https://oss.sonatype.org/content/repositories/releases/org/mongodb/bson/3.0.2/))

3. mongodb-driver-core-3.0.2.jar ([mongodb-driver-core](https://oss.sonatype.org/content/repositories/releases/org/mongodb/mongodb-driver-core/3.0.2/))

Configure your mongodb database typing the following commands in two differents terminal windows:
```
# 1. Setup the database server
mongod --dbpath data
# 2. Setup the database client 
mongo
> use avss
```

## Authors:

|Name | Email |
|:-----:|:-------:|
|Abián Torres Torres|abiantorres.generic@gmail.com
