# autonomous-vehicles-system-simulation

## Description:

In the development of an autonomous transport system, its advisable to carry out a battery of
tests or simulations before checking their operation in a real environment. For this
purpose, we have at our disposal certain software tools that allow, among others
things, simulate the environment and the behavior of a robot on it. For the development of this
project at this level of abstraction, we will use ROS (Robot Operating System). This "operative
system" is a free and open source framework for the development of software for robots
that provides the functionality of an operating system in a heterogeneous cluster. It provides the
standard services of an operating system such as hardware abstraction, control of
low level devices, implementation of commonly used functionalities, message passing
between processes and package maintenance. It is based on a graph architecture where the
processing takes place in nodes that can receive, send and multiplex messages from
sensors, control, states, schedules and actuators, among others.

However, this is only one aspect of the problem. In any type of study, it is also interesting
simulate the impact that the implementation of a system would have, in our case of transport
autonomous, in certain scenarios. Consequently, it would be necessary to carry out a
simulation at a higher level of abstraction. For example, to simulate an autonomous system of
public transportation, such as a fleet of taxis or buses, we would have, on the one hand,
simulate the behavior of each of the vehicles within the environment and, on the other hand, simulate
certain elements of the urban environment, such as the density of vehicles by sections, for
analyze the proposed solution in terms of its cost / effectiveness. In the latter case, the
tool to use will be PSIGHOS. This library implements a discrete event simulator
process oriented The internal simulator works on Java and has the purpose of
implementation of our models. Being designed primarily by researchers from the
University of La Laguna, one of the main advantages offered by PSIGHOS is its great
versatility and the functionalities that it contributes in tasks of "redistribution of resources" and
"process reengineering". Therefore, this project intends to work on these two
levels of simulation and in the integration of them.

## Status:

> Still in development phase.

## Dependencies:

* This proyect should be build correctly in a [Ubuntu Xenial Xerus (16.04)](http://releases.ubuntu.com/16.04/) system.

* For getting [rosjava](http://wiki.ros.org/rosjava) working execute the followig command in a new terminal (note that it must be installed for ROS kinetic):

```
sudo apt-get install ros-kinetic-catkin ros-kinetic-rospack python-wstool openjdk-8-jdk
```

* Intall ROS Kinetic following [this tutorial](http://wiki.ros.org/kinetic/Installation/Ubuntu).

## Authors:

|Name | Email |
|:-----:|:-------:|
|Abián Torres Torres|abiantorres.generic@gmail.com|
