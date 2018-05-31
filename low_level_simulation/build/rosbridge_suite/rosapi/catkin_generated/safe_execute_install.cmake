execute_process(COMMAND "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/rosbridge_suite/rosapi/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/build/rosbridge_suite/rosapi/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
