function [x,fun_val]=gradient_method_constant5(f5,g5,x0,t,epsilon) 
    
% Method du gradient a pas constant
%input
% =======================================
% f ......... fonction objective
% g ......... gradient de la fonction objective
% x0 ......... point initial
% s ......... choix initial de la taille de pas
% alpha ..... pour la s�lection de pas
% beta ...... la constante par laquelle le pas est multipli�
% � chaque �tape de retour en arri�re (O <beta <l)
% epsilon ... param�tre de tol�rance pour la r�gle d'arr�t
% output
% =======================================
% x ......... solution optimale (jusqu'� une tol�rance)
% de min f (x)
% fun_val ... valeur de fonction optimale

x=x0;
d=[1;0];
grad=g5(x);
fun_val=f5(x);
iter=0;
   while (norm(d)>epsilon) ;
      iter=iter+1; 
      t=1; 
      M= 1/t; 
      gradmap= M*(x-objproj5(x-(1/M)*grad));
      x2=objproj5(x-t*grad);
      d= x-x2;
      x=x2;
      fun_val=f5(x);
      grad=g5(x);
      fprintf('iter_number = %3d norm_d = %2.6f fun_val = %2.6f \n',iter,norm(d),fun_val)
   end

end 