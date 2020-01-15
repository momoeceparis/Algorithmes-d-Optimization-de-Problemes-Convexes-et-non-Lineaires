function [x,fun_val]=gradient_dim_quadratic(A,b,D,x0,epsilon)

% INPUT% ====================== �
% A ....... la matrice d�finie positive associ�e � la
% fonction objective
% b ....... un vecteur de colonne associ� � la partie lin�aire de la
% fonction objective
% xO ...... point de d�part de la m�thode
% epsilon. param�tre de tol�rance
%Matrice de mise � l'�chelle
% D
% OUTPUT% =======================
% x ....... une solution optimale (jusqu'� une tol�rance) de
% min (xAT A x + 2 bAT x)
% fun_val. la valeur de fonction optimale jusqu'� une tol�rance

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