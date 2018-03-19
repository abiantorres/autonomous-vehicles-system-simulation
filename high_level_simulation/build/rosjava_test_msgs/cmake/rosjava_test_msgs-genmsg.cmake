# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosjava_test_msgs: 7 messages, 1 services")

set(MSG_I_FLAGS "-Irosjava_test_msgs:/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genjava REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosjava_test_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" ""
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" ""
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" "rosjava_test_msgs/CompositeB:rosjava_test_msgs/CompositeA"
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" ""
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" ""
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" "rosjava_test_msgs/TestString"
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_rosjava_test_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosjava_test_msgs" "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genjava;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_cpp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_cpp(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosjava_test_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_cpp _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_gencpp)
add_dependencies(rosjava_test_msgs_gencpp rosjava_test_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_eus(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_eus(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rosjava_test_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_eus _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_geneus)
add_dependencies(rosjava_test_msgs_geneus rosjava_test_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_eus)

### Section generating for lang: genjava
### Generating Messages
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_java(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_java(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_java}"
)

add_custom_target(rosjava_test_msgs_generate_messages_java
  DEPENDS ${ALL_GEN_OUTPUT_FILES_java}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_java)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_java _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_genjava)
add_dependencies(rosjava_test_msgs_genjava rosjava_test_msgs_generate_messages_java)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_java)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_lisp(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_lisp(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosjava_test_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_lisp _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_genlisp)
add_dependencies(rosjava_test_msgs_genlisp rosjava_test_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_nodejs(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_nodejs(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rosjava_test_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_nodejs _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_gennodejs)
add_dependencies(rosjava_test_msgs_gennodejs rosjava_test_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg;/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg"
  "${MSG_I_FLAGS}"
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)
_generate_msg_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Services
_generate_srv_py(rosjava_test_msgs
  "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
)

### Generating Module File
_generate_module_py(rosjava_test_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosjava_test_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosjava_test_msgs_generate_messages rosjava_test_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestPrimitives.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestString.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/Composite.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeA.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/CompositeB.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestArrays.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_test_msgs/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosjava_test_msgs_generate_messages_py _rosjava_test_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosjava_test_msgs_genpy)
add_dependencies(rosjava_test_msgs_genpy rosjava_test_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosjava_test_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rosjava_test_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rosjava_test_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genjava_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${genjava_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_java)
  add_dependencies(rosjava_test_msgs_generate_messages_java std_msgs_generate_messages_java)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rosjava_test_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rosjava_test_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosjava_test_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rosjava_test_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
