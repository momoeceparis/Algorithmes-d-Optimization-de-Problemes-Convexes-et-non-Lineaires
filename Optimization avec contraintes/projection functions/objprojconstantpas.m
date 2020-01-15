function [y] = objproj2(x)

x1=x(1,1);
x2=x(2,1);
x3=x(3,1);
x4=x(4,1);
objproj2x=@(y1,y2,y3,y4)(y1-x1)^2+(y2-x2)^2+(y3-x3)^2+(y4-x4)^2;

y1 = optimvar('y1');
y2 = optimvar('y2');
y3 = optimvar('y3');
y4 = optimvar('y4');


obj= fcn2optimexpr(objproj2x,y1,y2,y3,y4);

prob = optimproblem('Objective',obj);

constraint1=(y1-y2)^2+(y3+2*y4)^4<=5;
constraint2=y1+2*y2+3*y3+4*y4<=6
constraint3= y1>=0;
constraint4= y2>=0;
constraint5= y3>=0;
constraint6= y4>=0;

prob.Constraints.constr1= constraint1;
prob.Constraints.constr2= constraint2;
prob.Constraints.constr3= constraint3;
prob.Constraints.constr4= constraint4;
prob.Constraints.constr5= constraint5;
prob.Constraints.constr6= constraint6;

 x0.y1 = 2;
 x0.y2 = 2;
 x0.y3 = 5;
 x0.y4= 1;
 
 showproblem(prob);
 
 [sol] = solve(prob,x0);
 
y1=double(sol.y1);
y2=double(sol.y2);
y3=double(sol.y3);
y4=double(sol.y4);

y=[y1;y2;y3;y4];
end