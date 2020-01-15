function [x,fun_val]=gradient_dim_backtracking(f,g,h,x0,s,alpha,beta,epsilon) 
    
%M�thode du Gradient avec retrospection
% input
% =======================================
% f ......... fonction objective
% g ......... gradient de la fonction objective
% x0 ......... point initial
% s ......... choix initial de la taille de pas
% alpha ..... pour la s�lection de pas
% beta ...... la constante dans laquelle le pas est multipli�
% � chaque �tape de retour en arri�re (O <beta <l)
% epsilon ... param�tre de tol�rance pour la r�gle d'arr�t
%output
% =======================================
% x ......... solution optimale (jusqu'� une tol�rance)
% de min f (x)
% fun_val ... valeur de fonction optimale

x=x0;
grad=g(x); 
fun_val=f(x); 
D= inv(h(x))
iter=0; 
   while (norm(grad)>epsilon) 
      iter=iter+1; 
      t=s; 
      while (fun_val-f(x-t*D*grad)<alpha*t*grad'*D*grad);
          t=beta*t;
      end
      x=x-t*D*grad; 
      fun_val=f(x); 
      grad=g(x);
      fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val)
   end 
   
end 