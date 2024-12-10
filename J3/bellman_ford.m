clear all

fichero=fopen('red con circuito negativo1.txt'); 
n_vertices=fscanf(fichero,'%d',1);
V=fscanf(fichero,'%d',n_vertices);
n_aristas=fscanf(fichero,'%d',1);
E=fscanf(fichero,'%d',2*n_aristas); %Aristas                                                                     
pesos=[fscanf(fichero,'%d',2*n_aristas+1)]; %Pesos
ei=E(1:2:2*n_aristas); %Vértice del que sale la arista
ef=E(2:2:2*n_aristas); %Vértice al que llega la arista
Ady=zeros(n_vertices,n_vertices);
t=1

%este bucle sirve para calcular la matriz P
for j=1:n_vertices 
        P(j)=1;
end

%Aquí se calcula la matriz de adyacencia
for i=1:n_aristas
    Ady(ei(i),ef(i))=1;
end

%Con este bucle calculo la matriz de pesos
for i=1:n_vertices     
    for j=1:n_vertices
        if i==j
            d(i,j)=0;
        end
        if Ady(i,j)==1
            for h=1:n_aristas
                d(ei(h),ef(h))=pesos(h);
            end
            
        end
        if Ady(i,j)==0 && i~=j
            d(i,j)=Inf;
        end
    end
end

%Aqui calculamos u
for j=1:n_vertices
    if j==1
        u(t,j)=0;
    end
    if j~=1
        u(t,j)=d(1,j);
    end
end


%Comienza el algoritmo de Bellman-Ford
for t=1:n_vertices-2    
        for j=1:n_vertices
            k=1
            for l=1:n_vertices
                if l~=j
                   x(k)=u(t,l)+d(l,j);
                end
                k=k+1
            end
            [y,k]=min(x);
            u(t+1,j)=min([y, u(t,k)+d(k,j)]);            
            if u(t,j)> (u(t,k)+d(k,j))
                P(j)=k;
            end
        end   
end

%Escribimos la solucion en un fichero
[m,n]=size(u);
z=length(P);
TEXTO1= 'u = ';
TEXTO2= ' ';
TEXTO3= 'P = ';

if min(u(m,:))<0
    ficherosal = fopen('sol_bellman-ford_circuito-negativo.txt', 'w');
else
    ficherosal = fopen('sol_bellman-ford.txt', 'w');
end   

fprintf(ficherosal, '%s', TEXTO1);
for i=1:n
    fprintf(ficherosal, '%d', u(m,i));  
    fprintf(ficherosal, '%s', TEXTO2);
end

fprintf(ficherosal, '%s\n', TEXTO2);
fprintf(ficherosal, '%s', TEXTO3);
for i=1:z
    fprintf(ficherosal, '%d', P(i));  
    fprintf(ficherosal, '%s', TEXTO2);
end

fclose(ficherosal);







            


    
