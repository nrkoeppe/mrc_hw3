clear 
close all

filename = '../data/myturtle.bag';
msgname = 'turtlesim/Pose';
filename = '../data/remapped_turtle.bag';
% msgname = 'geometry_msg/Twist';
topicnum = 1;

% Create a bag file object with the file name
bag = rosbag(filename);
topic_table = bag.AvailableTopics;
topics = topic_table.Properties.RowNames;
 
% Since the messages on topic turtle1/pose are of type Twist,
% let's see some of the attributes of the Twist message
message = rosmessage(msgname);
showdetails(message)
 
% Get just the topic we are interested in
bagselect = select(bag,'Topic',topics{topicnum});
 
% Create a time series object based on the fields of the turtlesim/Pose
% message we are interested in
ts = timeseries(bagselect,'X','Y','Theta','LinearVelocity','AngularVelocity');

% x is the x position of the turtle
% y is the y position of the turtle
% vel is the LinearVelocity of the turtle
% th is the heading angle of the turtle in radians
 
u = vel.*cos(th);
v = vel.*sin(th);
ii = 1:10:length(x);  % Decimate the data so that it plot only every Nth point.
quiver(x(ii),y(ii),u(ii),v(ii))