%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martín Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy

function H=histograma(I)
    [m n]= size(I);
    H=zeros(1,256);
        for i=1:m
             for j=1:n
                aux=I(i,j)+1;
                 H(aux)= H(aux)+1;
            end;
        end;
        
        [m n]=size(I);
        numpix=m*n;%normalizado de histograma
       H=H/numpix;
        
