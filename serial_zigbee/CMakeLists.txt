cmake_minimum_required(VERSION 2.8.3)
project(serial_zigbee)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp serial std_msgs  message_generation universal_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES serial_send
 CATKIN_DEPENDS roscpp serial std_msgs message_runtime universal_msgs
#  DEPENDS system_lib
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(send_node src/send.cpp)
add_dependencies(send_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(send_node ${catkin_LIBRARIES})

add_executable(receive_node src/receive.cpp)
add_dependencies(receive_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(receive_node ${catkin_LIBRARIES})

add_executable(${PROJECT_NAME}_node src/main.cpp src/serial_zigbee.cpp include/serial_zigbee.h)
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})