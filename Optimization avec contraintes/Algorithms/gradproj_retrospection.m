function [x,fun_val]=gradient_method_retrospec(f1,g1,x0,s,alpha,beta,epsilon) 
    
% M�thode du gradient par r�trospection
% Input
% =======================================
% f .........  fonction objective
% g ......... gradient de la fonction objective
% x0 ......... point initial
% s ......... choix initial du pas pas
%Param�tre de tol�rance
% alpha ..... pour la s�lection de pas
% beta ...... la constante dans laquelle le pas est multipli�
% � chaque �tape de retour en arri�re (O <beta <l)
% epsilon ... param�tre pour la r�gle d'arr�t
% Output
% =======================================
% x ......... solution optimale (jusqu'� la tol�rance)
% de min f (x)
% fun_val ... valeur de la fonction optimale

x=x0;
d=[1;0;0];
grad=g1(x);
fun_val=f1(x);
iter=0 ;
   while (norm(d)>epsilon);
      iter=iter+1; 
      t=s; 
      M= 1/t; 
      gradmap= M*(x-objproj(x-(1/M)*grad));
      while (fun_val-f1(objproj(x-t*grad))<alpha*t*norm(gradmap)^2); 
          t=beta*t;
          gradmap= M*(x-objproj(x-(1/M)*grad));
      end
      x1=objproj(x-t*grad);
      d= x-x1;
      x=x1;
      fun_val=f1(x);
      grad=g1(x);
      fprintf('iter_number = %3d norm_d = %2.6f fun_val = %2.6f \n',iter,norm(d),fun_val)
   end

end 