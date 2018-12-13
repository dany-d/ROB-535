function [J, dJ] = costfun_segmt(z)
    if size(z,2) > size(z,1)
        z = z' ;
    end
    nsteps = (size(z,1)+2)/8 ;

    zx = z(1:6*nsteps) ;
    zu = z(6*nsteps+1:end) ;
%     R=eye(2*nsteps-2);
    R = zeros(2*nsteps-2);

    nom=zeros(6*nsteps,1) ;
    nom(1:6:6*nsteps) =  245.3695 ;
    nom(3:6:6*nsteps+2) = -56.4002 ;
    nom(5:6:6*nsteps+4) = 1.8900 ;
    %Q=eye(6*nsteps);
    Q = diag(repmat([1/10,0,1/10,0,1,0],1,nsteps));

    J = zu'*R*zu+(zx-nom)'*Q*(zx-nom) ;
    dJ = [2*Q*zx-2*Q*nom;...
          2*R*zu]' ;
end

%{
z = [x y p x y p]
nom = [0 0 0 0 0 ]
nom = [7 0 0 7 0..]
z - nom =

%}