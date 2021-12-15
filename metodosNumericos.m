
opcion=0;
while opcion~=5
    clc;
    disp('----------------------> E S P E <---------------------');
    disp('--> 1)RAICES DE ECUACIONES');
    disp('--> 2)METODOS PARA RESOLVER SISTEMAS LINEALES');
    disp('--> 3)AJUSTE DE CURVAS');
    disp('--> 4)DERIVACI�N INTEGRACI�N Y ECUACIONES DIFERENCIALES ');
    disp('--> 5)SALIR');
    opcion=input('--> SELECCIONE LA OPCION: ');
    
    %%%%%%%%%%%%%%%%% SUB MENU RAICES DE ECUACIONES %%%%%%%%%%%%%%%%%%%%
    if opcion==1
        
        opcion2=0;
        while opcion2~=5
            clc;
            disp('----------------------> RAICES DE ECUACIONES <---------------------');
            disp('--> 1)m�todo de la bisecci�n');
            disp('--> 2)m�todo de la secante');
            disp('--> 3)m�todo de Newton');
            disp('--> 4)m�todo de Muller ');
            disp('--> 5)salir al menu');
            opcion2=input('--> Seleccione la opcion: ');
            
            if(opcion2==1)
               biseccion(); 
               input('! presione una tecla para continuar !');
            end
            
            if(opcion2==2)
               Secante(); 
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==3)
               Newton(); 
                input('! presione una tecla para continuar !');
            end
            
            
            if(opcion2==4)
               Muller(); 
                input('! presione una tecla para continuar !');
            end
            
            
            
        end
    end
     %%%%%%%%%%%%%%%%% SUB MENU METODOS PARA RESOLVER SISTEMAS LINEALES  %%
     if opcion==2
        
        opcion2=0;
        while opcion2~=6
            clc;
            disp('--------> METODOS PARA RESOLVER SISTEMAS LINEALES<------');
            disp('--> 1)Eliminaci�n de Gauss');
            disp('--> 2)Eliminaci�n de Gauss- Jordan');
            disp('--> 3)Descomposici�n LU');
            disp('--> 4)El m�todo de la inversa ');
            disp('--> 5)M�todo de Gauss-Seidel ');
            disp('--> 6)salir al menu');
            opcion2=input('--> Seleccione la opcion: ');
            
          
            if(opcion2==1)
               Gaussf();
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==2)
               GaussJordan();
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==3)
               LU(); 
                input('! presione una tecla para continuar !');
            end
            
            
            if(opcion2==4)
               inversa(); 
                input('! presione una tecla para continuar !');
            end
            
             if(opcion2==5)
              seidel1(); 
               input('! presione una tecla para continuar !');
            end
            
            
            
        end
     end
    
      %%%%%%%%%%%%%%%%% SUB MENU AJUSTE DE CURVAS  %%
     if opcion==3
        
        opcion2=0;
        while opcion2~=4
            clc;
            disp('-------------> AJUSTE DE CURVAS <------------');
            disp('--> 1)Interpolaci�n de Lagrange');
            disp('--> 2)Interpolaci�n de Newton');
            disp('--> 3)Interpolaci�n de Spline');
            disp('--> 4)salir al menu');
            opcion2=input('--> Seleccione la opcion: ');
            
          
            if(opcion2==1)
               interpolagrange();
               input('! presione una tecla para continuar !');
            end
            
            if(opcion2==2)
               interpolaNewton();
               input('! presione una tecla para continuar !');
            end
            
            if(opcion2==3)
               interpolacionSpline(); 
               input('! presione una tecla para continuar !');
            end
            
            
             
         
            
            
        end
     end
     
     %%%%%%%%%%%%%%%%% DERIVACI�N INTEGRACI�N Y ECUACIONES DIFERENCIALES  %%
     if opcion==4
        
        opcion2=0;
        while opcion2~=7
            clc;
            disp('----> DERIVACI�N INTEGRACI�N Y ECUACIONES DIFERENCIALES <----');
            disp('--> 1)Derivaci�n num�rica ');
            disp('--> 2)M�todo del trapecio');
            disp('--> 3)M�todo del Simpson 1/3');
            disp('--> 4)M�todo del Simpson 3/8');
            disp('--> 5)M�todo de Euler');
            disp('--> 6)M�todo de Euler Corregido');
            disp('--> 7)salir al menu');
            opcion2=input('--> Seleccione la opcion: ');
            
          
            if(opcion2==1)
               f=input('Ingrese la funcion:  ');
               x=input('Ingrese el valor de x: ');
               h=input('Ingrese el valor de h: ');
               M=input('Ingrese el valor de M: ');
               ade(f,x,h,M);
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==2)
               metodoTrapecio();
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==3)
               simpson(); 
                input('! presione una tecla para continuar !');
            end
            
            if(opcion2==4)
               simpsontresoctavos(); 
                input('! presione una tecla para continuar !');
            end
            
            
            
            if(opcion2==5)
               euler(); 
                input('! presione una tecla para continuar !');
            end
            
             if(opcion2==6)
               eulerMejorado(); 
                input('! presione una tecla para continuar !');
            end
            
         
            
            
        end
    end
     
end