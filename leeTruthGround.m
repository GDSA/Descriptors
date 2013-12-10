%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martín Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy 

function out=leeTruthGround(filename,dirname)

% recibe un fichero csv separado por tabuladores document_id y event_type, y el
% directorio donde están las imágenes de entrenamiento  


%ej out= trustMyFakingGround('sed2013_task2_dataset_train_gs.csv','SED2013_task2_photos')


%separa las imágenes en carpetas automáticamente según su anotación.

out=tdfread(filename);%%out es una struct que contiene matrices de char con la información necesaria. Tendremos que unir los char para formar strings que comparar.
D = dir(strcat(dirname,'\*.jpg')); %%todas las id de las fotos de prueba accesibles como D(i).name


mkdir('concert');
mkdir('conference');
mkdir('fashion');
mkdir('non_event');
mkdir('sports');
mkdir('protest');
mkdir('other');
mkdir('theater_dance');
mkdir('exhibition');
display('Directorios creados.');
display('Moviendo archivos. Progreso...');


[m n]=size(out.document_id);%% sacar el numero de anotaciones para recorrerlas.
for k=1:m   %% recorro las 27000 anotaciones
    name=[];
    event_type=[];
    
    if(mod(k,300)==0) %progreso
        x=num2str(floor(k*100/m));
        display(strcat(x,'%'));
    end;
  
    for i=1:28          %%acumulo id char a char
        a=out.document_id(k,i); 
        if(a ~= ' ')%% esto es  para deshacernos de caracteres vacios conflictivos al final del campo
        name=strcat(name,a);
        end;
    
    end;
    
    for i=1:13                  %% acumulo tipo char a char
         a=out.event_type(k,i);
         if(a ~= ' ')%% para deshacernos de caracteres vacios conflictivos al final del campo
         event_type=strcat(event_type,a);
         end;
        
    end;
    
    
    [m2 n2]=size(name); %%nos interesa cual es el tamaño final despues de deshacernos de los espacios en blanco al final de cada campo.
     if(out.document_id(k,n2)=='1' ||out.document_id(k,n2)=='2') %% si acaba en 1 o 2 (imagen dadas de prueba) Esto ahorrará bastante tiempo computacional      
         for i=1:length(D) %%recorremos todas las id de la carpeta de entrenamiento, para comprobar que esté, 
             %ya que hay fotos de train2 que acaban en 1 y 2 también. 
            if(strcmp(strcat(name,'.jpg'),D(i).name)) %% si está en la carpeta de fotos de entrenamiento
                
                %movefile o copyfile para copiar en vez de mover a la carpeta event_type 
                copyfile(strcat(dirname,'\',D(i).name),event_type);
            
            end;                        
         end;    
     end; 
    
   
end;
    
    
        
