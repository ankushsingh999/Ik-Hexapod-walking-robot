%% Inverse Kinematics of a Hexapod Walking Robot

%% Robot Parameters
% Given in the problem
%Pose
P = [0 10 100 5 5 0]';
% Home configuration of the hexapod 
% P = [0 0 100 0 0 0]';
% Radiusu of the mobile and fixed frame
Rm = 300/2;
Rf = 480/2;
%Angle between the legs
A = 60*pi/180;
% Parameters
L1i = 20;
L2i = 70;
L3i = 100; 
% Extracting the translation of the origin
O = P(1:3,:);

%% Rotation Matrix
% XYZ Euler Angles
%extracting it from the position
a = (P(4,:))*pi/180;
b = (P(5,:))*pi/180;
c = (P(6,:))*pi/180;
Rx = [ 1 0 0 
       0 cos(a) -sin(a)
       0 sin(a) cos(a)];

Ry = [ cos(b) 0 sin(b)
         0    1   0   
       -sin(b) 0 cos(b)];
Rz = [ cos(c) -sin(c) 0 
       sin(c) cos(c)  0
       0        0     1];
R = Rx*Ry*Rz;
%% Calculating link 1 positions of legs 
% wrt. the upper coordinate frame
%calculating si1
s11=[-Rm*cos(A) , Rm*sin(A), 0]';
s21=[Rm*cos(A) , Rm*sin(A), 0]';
s31=[-Rm, 0, 0]';
s41=[Rm, 0, 0]';
s51=[-Rm*cos(A) , -Rm*sin(A), 0]';
s61=[Rm*cos(A) , -Rm*sin(A), 0]';

si1 = [s11 , s21 , s31 , s41 , s51 , s61];
%% Calculating Lower Joint positions
% wrt. to lower coordinate frame

u1=[-Rf*cos(A) , Rf*sin(A), 0]';
u2=[Rf*cos(A) , Rf*sin(A), 0]';
u3=[-Rf, 0, 0]';
u4=[Rf, 0, 0]';
u5=[-Rf*cos(A) , -Rf*sin(A), 0]';
u6=[Rf*cos(A) , -Rf*sin(A), 0]';

u = [u1 , u2 , u3 , u4 , u5 , u6];
%% Hip Joint Angle Calculation 
% Calculating li (L) using inverse kinematics

for i = 1:6
    L(: , i) = O + R * si1(: , i) - u (: , i);
    alpha(:,i) = atan((L(2,i))/(L(1,i)));
end


%% Knee Angle Calculation
% Calculating Knee leg vector li'(Lid) and Si2

for i = 1:6
    l1i(:,i) = [((-1)^i)*L1i*cos(alpha(i)); ((-1)^i)*L1i*sin(alpha(i));0];
    si2(:,i) = (si1(:,i) + l1i (:,i));
    Lid(:,i) = O + R * si2 (:,i) - u (:,i);
    lid (i) = norm(Lid(:,i));
    F(i) = ((L2i.^2)+(L3i.^2)-(lid(i).^2))/(2*L2i*L3i);
    gamma(i) = pi- (acos(F(i)));
end


%% Ankle Angle Calculation 
% Calculating roh, sih and beta 

for i = 1:6

    suma(:,i) = acos(((L2i^2)+(lid(i)^2)-(L3i^2))/(2*L2i*lid(i)));
    sih(:,i) = asin((Lid(3,i)-L(3,i))/L1i);
    roh(:,i) = atan(Lid(3,i)/(sqrt((Lid(1,i)^2)+(Lid(2,i)^2))));
    %roh(:,i) = asin((Lid(3,i))/lid(i));
    Beta(:,i) = suma(:,i)-roh(:,i)-sih(:,i);
end
Hip_Angle = alpha
Knee_angle = Beta
Ankle_angle = gamma
