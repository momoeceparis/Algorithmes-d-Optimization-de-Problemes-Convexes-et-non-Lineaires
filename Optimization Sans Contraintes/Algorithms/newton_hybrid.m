function x=newton_hybrid(f,g,h,x0,alpha,beta,epsilon)
% Méthode hybride de Newton
%
% Input
% =======================================
% f ......... fonction objectif
% g ......... gradient de la fonction objective
% h ......... matrix hessiane de la fonction objectif
% x0 ......... point initial
% alpha ..... paramètre de tolérance pour la stratégie de sélection de pas
% beta ...... la proportion dans laquelle le pas est multiplié
% à chaque étape de retour en arrière (O <beta <l)
% epsilon ... paramètre de tolérance pour la règle d'arrêt
%output
% =======================================
% x ......... solution optimale (jusqu'à une tolérance)
% de min f(x)% fun_val valeur de fonction optimale
x=x0;
gval=g(x); 
hval=h(x); 
[L,p]=chol(hval,'lower'); 
if (p==0) 
    d=L'\(L\gval);
else
    d=gval;
end
iter=0; 
 while ((norm(gval)>epsilon)&&(iter<10000)) 
    iter=iter+1;
    t=1; 
    while(f(x-t*d)>f(x)-alpha*t*gval'*d) 
       t=beta*t;
    end 
   x=x-t*d;
   gval=g(x);
   hval=h(x); 
   [L,p]=chol(hval, 'lower'); 
    if (p==0) 
      d=L'\(L\gval); 
    else
      d=gval;
    end
fprintf('iter= %2d norm_grad=%10.10f\n fun_val=%10.10f\n ',iter,norm(gval),f(x))
 end
   
if (iter==10000) 
    fprintf('did not converge\n')
end 
