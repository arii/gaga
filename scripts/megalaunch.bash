#!/bin/bash

#this is like robot start, but brings up things separately.

#when developing the RT controllers for the PR2, it's often simpler to bring-up the robot again as opposed to reloading the controllers (in fact I haven't gotten this to work yet).
#however, if you robot stop robot start, you get a new roscore and any existing nodes (including rviz) get borked, and you need to restart them.
#with this, you can keep the roscore running and bring down and up the robot.
#this is just a script which automates opening a bunch of terminal windows and running commands in those windows.

interactive="shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'
[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'"
source ~/.bashrc

#tmux new -d -s pr2mux 'echo "roscore"; $interactive; roscore; bash' \; \
tmux new -d -s pr2mux 'echo "roscore"; roscore; bash' \; \
    new-window -d -n rosout 'echo "debugmsgs"; sleep 1; rostopic echo \rosout'\; \
    new-window -d -n sim 'echo "sim"; sleep 2; roslaunch gaga_utils sim_gaga.launch'\; \
    new-window -d -n rviz 'echo "rviz"; sleep 30; roslaunch gaga_utils rviz_gaga.launch'\; \
    new-window -d -n rviz 'echo "armcontroller"; sleep 35; roslaunch path_follower jt_default_controller.launch'\; \
	new-window -d  -n robot_dash 'echo "dashboard"; sleep 30; rosrun rqt_pr2_dashboard rqt_pr2_dashboard; bash' \; \
		attach \;

