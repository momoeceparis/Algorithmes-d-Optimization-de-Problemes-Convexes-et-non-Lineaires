function [y] = objproj(x)

x1=x(1,1);
x2=x(2,1);
x3=x(3,1);
objprojx=@(y1,y2,y3)(y1-x1)^2+(y2-x2)^2+(y3-x3)^2;

y1 = optimvar('y1');
y2 = optimvar('y2');
y3 = optimvar('y3');

obj= fcn2optimexpr(objprojx,y1,y2,y3);

prob = optimproblem('Objective',obj);

constraint1 = ((2*y1^2+y1*y2+4*y2+4)+((y1-y2+y3+1)^2)/(y1+y2))^.5<=6;
constraint2= y1>=1;
constraint3= y2>=1;
constraint4= y3>=1;

prob.Constraints.constr1= constraint1;
prob.Constraints.constr2= constraint2;
prob.Constraints.constr3= constraint3;
prob.Constraints.constr4= constraint4;

 x0.y1 = 2;
 x0.y2 = 2;
 x0.y3 = 5;
 
 %showproblem(prob);
 
 [sol] = solve(prob,x0);
 
y1=double(sol.y1);
y2=double(sol.y2);
y3=double(sol.y3);

y=[y1;y2;y3];
end

