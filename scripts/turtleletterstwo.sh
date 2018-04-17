rosrun turtlesim turtlesim_node &
rosservice call /turtle1/set_pen 0 0 0 2 1
rosservice call /turtle1/teleport_absolute -- 2 5 1.5708 
rosservice call spawn 6 5 1.5708 turtle2
rosservice call /turtle1/set_pen 0 0 0 2 0
rosservice call /turtle2/set_pen 255 0 0 2 0
rosservice call /turtle1/teleport_absolute -- 2 7 1.5708 
rosservice call /turtle1/teleport_absolute -- 4 5 1.5708 
rosservice call /turtle1/teleport_absolute -- 4 7 1.5708
rosservice call /turtle2/teleport_absolute -- 6 7 1.5708 
