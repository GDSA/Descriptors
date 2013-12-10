%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martín Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy 

%%Realitza histograma per bloc d'imatge en nivell de gris, Està pensat per
%%imatges quadrades de 612x612 com les d'instagram

%Entrada
%I......................................................Imatge en escala de
%gris

%So

function vector=HistogramaBlocs(I)

[m n]=size(I);
vector=[];
nwin_x=4;
nwin_y=4;
step_x=floor(m/(nwin_x+1));
step_y=floor(n/(nwin_y+1));

for n=0:nwin_y-1
    for m=0:nwin_x-1
     
        bloc=I(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x); 
      
       H=histograma(bloc);
       aux=vector;
       vector =[aux H];
       
    end
end
