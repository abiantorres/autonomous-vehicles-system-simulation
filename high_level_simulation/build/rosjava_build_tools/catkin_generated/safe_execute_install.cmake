execute_process(COMMAND "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/build/rosjava_build_tools/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/build/rosjava_build_tools/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
