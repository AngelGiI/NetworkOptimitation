clear all

fichero=fopen('kruskal.txt'); 
n_vertices=fscanf(fichero,'%d',1);
V=fscanf(fichero,'%d',n_vertices)'
n_aristas=fscanf(fichero,'%d',1);
E=fscanf(fichero,'%d',2*n_aristas)' %Aristas ordenadas
d=[fscanf(fichero,'%d',2*n_aristas+1)]' %Pesos de cada arista

for i=1:n_vertices
    dep(i)=0;
end

nro_dep=0
T=zeros(1:1)
[n,m]=size(T);
ei=E(1:2:18); %V�rtice del que sale la arista
ef=E(2:2:18); %V�rtice al que llega la arista
j=1
    while j<=n_aristas && m<2*(n_vertices-1)
        if dep(ei(j))==dep(ef(j)) && dep(ei(j))==0   %Nuevo dep�sito con los v�rtices de 'ei' y 'ef'.
            T(2*j-1)=ei(j);   %A�ado los v�rtices de donde salen las aristas que van a formar el �rbol soporte.
            T(2*j)=ef(j);     %A�ado los v�rtices finales de las aristas del �rbol soporte.
            nro_dep=nro_dep+1
            dep(ei(j))=nro_dep;
            dep(ef(j))=nro_dep
            peso_total(j)=d(j); %Vector que almacena los pesos de las aristas del �rbol soporte. 
            T=nonzeros(T)';
        end
        if dep(ei(j))~=dep(ef(j)) && dep(ef(j))==0   %El v�rtice proveniente de 'ef' se a�ade al v�rtice de 'ei'.
            T(2*j-1)=ei(j);
            T(2*j)=ef(j);
            dep(ef(j))=dep(ei(j))
            peso_total(j)=d(j);
            T=nonzeros(T)';
        end
        if dep(ei(j))==dep(ef(j)) && dep(ei(j))~=0    %En este caso ambos v�rtices pertenecen al mismo dep�sito
            T=nonzeros(T)'
        end
        if dep(ei(j))~=dep(ef(j)) && dep(ei(j))~=0 && dep(ef(j))~=0  %Se funden los dep�sitos de ambos v�rtices
            T(2*j-1)=ei(j)';
            T(2*j)=ef(j)';
            dmin=min(dep(ei(j)),dep(ef(j)))
            dmax=max(dep(ei(j)),dep(ef(j)))
            for i=1:n_vertices
                z=V(i)
                if dep(z)==dmin
                    dep(z)=dep(z)-1
                end
                if dep(z)==dmax
                    dep(z)>dmax
                end
            end
        end
        j=j+1
    end
    
    %Escribimos la solucion en un fichero
    TEXTO1 = 'El arbol soporte de m�nimo peso es: ';
    TEXTO2 = 'Y su peso es: ';
    A='{';
    B=',';
    C='}';
    
    ficherosal = fopen('sol_kruskal.txt', 'w');
    fprintf(ficherosal, '%s', TEXTO1);
    fprintf(ficherosal, '%s', A);
    for i=1:length(T)-1
        if mod(i,2)~=0
            fprintf(ficherosal, '%s', A);
            fprintf(ficherosal, '%d', T(i));
            fprintf(ficherosal, '%s', B);
   
        else
            fprintf(ficherosal, '%d', T(i));
            fprintf(ficherosal, '%s', C);  
            fprintf(ficherosal, '%s', B);
        end
    end    
    
    fprintf(ficherosal, '%d', T(length(T)));
    fprintf(ficherosal, '%s', C);
    fprintf(ficherosal, '%s\n', C);
    fprintf(ficherosal, '%s', TEXTO2);
    fprintf(ficherosal, '%d\n', sum(peso_total));
    fclose(ficherosal);
   
    
    