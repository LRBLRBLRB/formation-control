cmake_minimum_required(VERSION 2.8.3)
project(swarm_robot_control)
add_definitions(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
        roscpp std_msgs tf serial universal_msgs
)

include_directories(
        include
        ${catkin_INCLUDE_DIRS}
)


include_directories(/usr/local/include)

#add_message_files(FILES
#        )

#generate_messages(DEPENDENCIES
#        std_msgs
#        geometry_msgs)

catkin_package(
        CATKIN_DEPENDS roscpp std_msgs tf serial message_runtime universal_msgs
)

add_executable(${PROJECT_NAME}_node src/main.cpp src/swarm_robot_control.cpp src/vel_trans.cpp
         include/vel_trans.h include/swarm_robot_control.h include/cmds.h include/agents.h)
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})

