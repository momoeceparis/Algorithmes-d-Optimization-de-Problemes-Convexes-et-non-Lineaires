function [x,fun_val]=gradient_dim_quadratic(A,b,D,x0,epsilon)

% INPUT% ====================== ·
% A ....... la matrice définie positive associée à la
% fonction objective
% b ....... un vecteur de colonne associé à la partie linéaire de la
% fonction objective
% xO ...... point de départ de la méthode
% epsilon. paramètre de tolérance
%Matrice de mise à l'échelle
% D
% OUTPUT% =======================
% x ....... une solution optimale (jusqu'à une tolérance) de
% min (xAT A x + 2 bAT x)
% fun_val. la valeur de fonction optimale jusqu'à une tolérance

x=x0; 
iter=0; 
grad=2* (A*x+b); 
while (norm(grad)>epsilon)
    iter=iter+1; 
    t=grad'*D*grad/(2*(grad'*D')*A*(D*grad));
    x=x-t*D*grad; 
    grad=2* (A*x+b); 
    fun_val=x'*A*x+2*b'*x;
end
    fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n', iter,norm(grad),fun_val); 
end 