disp("Interpolation Tests");
p1 = [0; 1; 0];
p2 = [0.5; 0.25; 0];
p3 = [1; 0; 0];

p1t = [0;-1;0];
p2t = [1;0;0];
p3t = [1;0;0];

dir1 = p2 - p1;
dir2 = p3 - p2;

length = abs(dir1(1,:)) + abs(dir2(1,:));
peak_x_normalized = p2(1,:) / length;

interval = 0.01;

% linear
i = 0:interval:peak_x_normalized;
a = p1 + dir1 * i * (1/peak_x_normalized);

j = 0+interval:interval:(1-peak_x_normalized);
b = p2 + dir2 * j * (1/(1-peak_x_normalized));

y = [a,b];
%scatter(0:interval:1, y(2,:));




%hermite
M = [2, -2, 1, 1;
	-3, 3, -2, -1; 
	0, 0, 1, 0; 
	1, 0, 0, 0];
B1 = [p1(1,:), p2(1,:), p1t(1,:), p2t(1,:);
	p1(2,:), p2(2,:), p1t(2,:), p2t(2,:);
	p1(3,:), p2(3,:), p1t(3,:), p2t(3,:);
	0, 0, 0, 0];
B2 = [p2(1,:), p3(1,:), p2t(1,:), p3t(1,:);
	p2(2,:), p3(2,:), p2t(2,:), p3t(2,:);
	p2(3,:), p3(3,:), p2t(3,:), p3t(3,:);
	0, 0, 0, 0];
	
i = 0:interval:1;
U_T = [i.^3; i.^2; i; i-i+1]';

a = (U_T * M *transpose(B1))';

j = 0:interval:1;
U_T = [i.^3; i.^2; i; i-i+1]';

b = (U_T * M *transpose(B2))';

disp(a);
y = [a,b];
scatter(y(1,:), y(2,:));


