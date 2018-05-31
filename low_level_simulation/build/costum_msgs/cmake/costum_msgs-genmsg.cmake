# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "costum_msgs: 9 messages, 0 services")

set(MSG_I_FLAGS "-Icostum_msgs:/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(costum_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" ""
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" "costum_msgs/IndividualSegmentResultsMsg"
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" "costum_msgs/GoalInfo"
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" ""
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" ""
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" "costum_msgs/IndividualSegmentResultsMsg:costum_msgs/IndividualIterationResultsMsg:costum_msgs/GlobalSimulationResultsMsg:costum_msgs/GlobalSegmentResultsMsg:costum_msgs/SimulationMetadataMsg"
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" ""
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" ""
)

get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_custom_target(_costum_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "costum_msgs" "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)
_generate_msg_cpp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(costum_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(costum_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(costum_msgs_generate_messages costum_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_cpp _costum_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(costum_msgs_gencpp)
add_dependencies(costum_msgs_gencpp costum_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS costum_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)
_generate_msg_eus(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(costum_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(costum_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(costum_msgs_generate_messages costum_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_eus _costum_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(costum_msgs_geneus)
add_dependencies(costum_msgs_geneus costum_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS costum_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)
_generate_msg_lisp(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(costum_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(costum_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(costum_msgs_generate_messages costum_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_lisp _costum_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(costum_msgs_genlisp)
add_dependencies(costum_msgs_genlisp costum_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS costum_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)
_generate_msg_nodejs(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(costum_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(costum_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(costum_msgs_generate_messages costum_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_nodejs _costum_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(costum_msgs_gennodejs)
add_dependencies(costum_msgs_gennodejs costum_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS costum_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg;/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)
_generate_msg_py(costum_msgs
  "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(costum_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(costum_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(costum_msgs_generate_messages costum_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMetadataMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualIterationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/PathInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/RouteTimes.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/SimulationMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/IndividualSegmentResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GoalInfo.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg/GlobalSimulationResultsMsg.msg" NAME_WE)
add_dependencies(costum_msgs_generate_messages_py _costum_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(costum_msgs_genpy)
add_dependencies(costum_msgs_genpy costum_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS costum_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/costum_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(costum_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/costum_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(costum_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/costum_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(costum_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/costum_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(costum_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/costum_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(costum_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
