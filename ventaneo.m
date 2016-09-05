function [y, ventanas, elementos] = ventaneo(varargin)
%Funcion ventaneo 
%La funcion recibe un archivo de audio en forma de vector y un numero entero
%Ejemplo: [y,ventanas,elementos] = ventaneo(vector, 128);
%regresando una matriz con un numero de ventanas (renglones) acorde a la duracion del archivo
%ingresado y con un numero de elementos (columnas) por ventana igual al numero entero ingresado
%y dos numeros enteros, correspondientes al numero de ventanas y elementos de esa matriz respectivamente 

x = varargin{1}; %vector con filtro fir
elementos = varargin{2}; %numero de ventanas
t = length(x); %tamaño del vector x

res = rem(t, (elementos)); 
if res(1, 1) > 0
ven = floor(t/(elementos)) + 1;
else
    ven = floor(t/(elementos));
end
ventanas = ven(1, 1);
y = zeros(ventanas, elementos);

%i = 1;
i=0;
%while i <= t
while i < t
    for j = 1: 1: ventanas
        for k = 1: 1: elementos
            if i == 0;
                %y(j,k) = x(i);
                y(j,k) = x(1);
                i=i+1;
            elseif i==t    
                y(j, k) = x(t);
            else
                y(j,k) = x(i);
                i = i + 1;
            end
             %else    
              %  y(j, k) = x(i);
               % i = i + 1;
            %end
        end
    end
end

end
%Julio:
%El codigo de esta funcion tenia un error con el manejo de los indices
%las lineas comentadas son las que elimine y debajo de ellas escribi las
%nuevas. Despues de estos cambios, la funcion iniciofinp trabaja 
%correctamente. 