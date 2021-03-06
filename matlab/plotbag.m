clear 
close all

filename = '../data/myturtle.bag';
msgname = 'turtlesim/Pose';
% filename = '../data/remapped_turtle.bag';
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
t = ts.time;
x = ts.data(:,1);
y = ts.data(:,2);
theta = ts.data(:,3);
vel = ts.data(:,4);

u = vel.*cos(theta);
v = vel.*sin(theta);
ii = 1:10:length(x);  % Decimate the data so that it plot only every Nth point.

figure
quiver(x(ii),y(ii),u(ii),v(ii))
axis square
title('Quiver Plot of turtle1/pose')
xlabel('x pos')
ylabel('y pos')
print('pose_quiver','-dpng')

figure
plot(t-t(1), theta)
title('Angular Position of turtle1/pose')
xlabel('time [s]')
ylabel('theta [rad]')
print('pose_theta','-dpng')

figure
plot(x(ii),y(ii))
axis square
title('Postion Plot of turtle1/pose')
xlabel('x pos')
ylabel('y pos')
print('pose_xy','-dpng')