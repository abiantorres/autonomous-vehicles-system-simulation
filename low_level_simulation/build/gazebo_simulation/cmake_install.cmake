# Install script for directory: /home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/gazebo_simulation

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/gazebo_simulation/catkin_generated/installspace/gazebo_simulation.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_simulation/cmake" TYPE FILE FILES
    "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/gazebo_simulation/catkin_generated/installspace/gazebo_simulationConfig.cmake"
    "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/gazebo_simulation/catkin_generated/installspace/gazebo_simulationConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_simulation" TYPE FILE FILES "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/gazebo_simulation/package.xml")
endif()

