cmake_minimum_required(VERSION 2.8.3)
project(universal_msgs)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  std_msgs
  message_generation
)

# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

#Generate services in the 'srv' folder
add_service_files(
  FILES
   RobotMove.srv
 )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   geometry_msgs
   std_msgs
 )

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES universal_msgs
  CATKIN_DEPENDS geometry_msgs roscpp std_msgs message_runtime
#  DEPENDS system_lib
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}_node src/test.cpp)
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS} ${PROJECT_NAME}_generate_messages_cpp)
target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})

