clear all 
close all %Closes all previously drawn figures
clc

n=input('Enter number of control points for the first curve and second curve :  ');
%Accepts control points for both the curves
w=input('Press 1 for entry through pointer on a graph or 2 for keyboard(first curve):  ');
%Accepts the control points for the first curve 
n1=n-1;
if w==1
    axis([0 100 0 100]) %Selecting the control points on the graph
    [p]=ginput(n);  %Storing the selected points
end
if w==2
    [p]=input('Enter co-odinates of control points within brackets [x1 y1;x2 y2;...;xn yn] ');
end
    
for    i=0:1:n1
sigma(i+1)=factorial(n1)/(factorial(i)*factorial(n1-i));  % for calculating number of combinations 
end
l=[];
U=[];
for u=0:0.002:1
for d=1:n
U(d)=sigma(d)*((1-u)^(n-d))*(u^(d-1));
end
l=cat(1,l,U);                                
end
P=l*p;

h = figure;
%filename=input('Enter a name for the plot to be saved as  ');

figure(1)
plot(P(:,1),P(:,2),'k'); title('First Curve');hold on;
plot(p(:,1),p(:,2),'-.r*');hold off;

temp=['fig',num2str(1),'.png'];    %saving figure name as Fig1.png
saveas(gca,temp);


 %Second Curve (Side View Curve)
 
N=n;
W=input('Press 1 for entry through pointer on a graph or 2 for entry through keyboard :  ');
N1=N-1;
if W==1
    axis([0 100 0 100])
    [p2]=ginput(N);
end
if W==2
    [p2]=input('Enter co-odinates of control points within brackets [x1 y1;x2 y2;...;xn yn] ');
end
    
for    I=0:1:N1
sigma(I+1)=factorial(N1)/(factorial(I)*factorial(N1-I));  % for calculating number of combinations 
end
l=[];
U=[];
for v=0:0.002:1
for D=1:N
U(D)=sigma(D)*((1-v)^(N-D))*(v^(D-1));
end
l=cat(1,l,U);                                   
end
P2=l*p2;
figure(2)
plot(P2(:,1),P2(:,2)); title('Second Curve');hold on;
plot(p2(:,1),p2(:,2),'-.r*'); hold off;


temp=['fig',num2str(2),'.png'];    %saving figure name as Fig1.png
saveas(gca,temp);


%3D Plot function surface development

%Extracting the first point of the side surface determining curve and using
%that point as the startying point for the first curve, by transforming all
%the control points 
for o=1:1:501
   O= zeros(501, 2);
   K= zeros(n, 2);
    
    for q=1:1:n
K(q,:)= P2(o,:) - p(q,:); %We find the distance between control points of the first curve and the points on the second curve
    end
    for    I=0:1:N1
sigma(I+1)=factorial(N1)/(factorial(I)*factorial(N1-I));  % for calculating number of combinations 
    end
l=[];
U=[];
    for v=0:0.002:1
        for D=1:N
U(D)=sigma(D)*((1-v)^(N-D))*(v^(D-1));
        end
l=cat(1,l,U);                                     
    end
O=l*K;
figure(3)
plot3(O(:,1),O(:,2),P2(:,2)); title('3D Surface development using two bezier curves');hold on;

%fill3(O(:,1),O(:,2),P2(:,2),'y'); 
%Remove the comment parenthesis for fill to make a solid
end

%surf(O(:,1),O(:,2),P2);   %Experimental

temp=['fig',num2str(3),'.png'];    %saving figure name as Fig1.png
saveas(gca,temp);

%Akshat Maheshwari 
%BML Munjal University
%Submitted as a part of CAD Mathematical Modelling Project
