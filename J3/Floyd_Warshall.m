clear all

fichero=fopen('floyd_warshall.txt'); 
n_vertices=fscanf(fichero,'%d',1);
V=fscanf(fichero,'%d',n_vertices)'
n_aristas=fscanf(fichero,'%d',1);
E=fscanf(fichero,'%d',2*n_aristas)'  %Aristas ordenadas                                                                   
pesos=[fscanf(fichero,'%d',2*n_aristas+1)]' %Pesos de cada arista
ei=E(1:2:2*n_aristas); %Vértice del que sale la arista
ef=E(2:2:2*n_aristas); %Vértice al que llega la arista
Ady=zeros(n_vertices,n_vertices);
P=zeros(n_vertices,n_vertices);

%Este bucle calcula la matriz P
for i=1:n_vertices
    for j=1:n_vertices 
        P(i,j)=i;
    end
end

%Aquí se calcula la matriz de adyacencia
for i=1:n_aristas
    Ady(ei(i),ef(i))=1;
end

%Este bucle calcula la matriz de pesos
for i=1:n_vertices     
    for j=1:n_vertices
        if i==j
            u(i,j)=0;
        end
        if Ady(i,j)==1
            for h=1:n_aristas
                u(ei(h),ef(h))=pesos(h);
            end
            
        end
        if Ady(i,j)==0 && i~=j
            u(i,j)=Inf;
        end
    end
end

%Comenzamos el algoritmo de Floyd-Warshall
for k=1:n_vertices
    for i=1:n_vertices
        for j=1:n_vertices
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

%Escribimos los resultados en un fichero
TEXTO1= '    '
TEXTO2= ' '
TEXTO3= 'u ='
TEXTO4= 'P ='
ficherosal = fopen('sol_Floyd-Warshall.txt', 'w');
[m,n]=size(u)

fprintf(ficherosal, '%s\n', TEXTO3);
for i=1:m
    for j=1:n
        if j==n
            fprintf(ficherosal, '%d\n', u(i,j));
        else
        fprintf(ficherosal, '%d', u(i,j));
        fprintf(ficherosal, '%s', TEXTO2);
        end
    end
end

fprintf(ficherosal, '%s\n', TEXTO2);
fprintf(ficherosal, '%s\n', TEXTO4);
for i=1:m
    for j=1:n
        if j==n
            fprintf(ficherosal, '%d\n', P(i,j));
        else
        fprintf(ficherosal, '%d', P(i,j));
        fprintf(ficherosal, '%s', TEXTO2);
        end
    end
end

fclose(ficherosal);