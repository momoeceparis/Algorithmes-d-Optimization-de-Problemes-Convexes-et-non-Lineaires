function [x,fun_val]=gradient_dim_backtracking(f,g,h,x0,s,alpha,beta,epsilon) 
    
%Méthode du Gradient avec retrospection
% input
% =======================================
% f ......... fonction objective
% g ......... gradient de la fonction objective
% x0 ......... point initial
% s ......... choix initial de la taille de pas
% alpha ..... pour la sélection de pas
% beta ...... la constante dans laquelle le pas est multiplié
% à chaque étape de retour en arrière (O <beta <l)
% epsilon ... paramètre de tolérance pour la règle d'arrêt
%output
% =======================================
% x ......... solution optimale (jusqu'à une tolérance)
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