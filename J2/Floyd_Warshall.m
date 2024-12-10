clear all
clc
fichero=fopen('bellman ford.txt'); 
numero_vertices=fscanf(fichero,'%d',1);
V=fscanf(fichero,'%d',numero_vertices)'
numero_aristas=fscanf(fichero,'%d',1);
E=fscanf(fichero,'%d',2*numero_aristas)'%Aristas                                                                     
pesos=[fscanf(fichero,'%d',2*numero_aristas+1)]' %Pesos
ei=E(1:2:2*numero_aristas); %Vértice del que sale la arista
ef=E(2:2:2*numero_aristas); %Vértice al que llega la arista
Ady=zeros(numero_vertices,numero_vertices);
P=zeros(numero_vertices,numero_vertices);
%este bucle sirve para calcular la matriz P
for i=1:numero_vertices
    for j=1:numero_vertices 
        P(i,j)=i;
    end
end
%Aquí se calcula la matriz de adyacencia
for i=1:numero_aristas
    Ady(ei(i),ef(i))=1;
end
for i=1:numero_vertices     %con este bucle calculo la matriz de pesos
    for j=1:numero_vertices
        if i==j
            u(i,j)=0;
        end
        if Ady(i,j)==1
            for h=1:numero_aristas
                u(ei(h),ef(h))=pesos(h);
            end
            
        end
        if Ady(i,j)==0 && i~=j
            u(i,j)=Inf;
        end
    end
end
%Aquí es donde comienza el algoritmo de Floyd-Warshall
for k=1:numero_vertices
    for i=1:numero_vertices
        for j=1:numero_vertices
            if i~=k && j~=k
                l=min(u(i,j),u(i,k)+u(k,j));
                if l<u(i,j)
                    h=j;
                    while h~=k
                        P(i,h)=P(k,h);
                        h=P(i,h);
                    end
                end
                u(i,j)=l;
            end
        end
    end
end
u
P