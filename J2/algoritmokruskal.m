clear all
clc
fichero=fopen('algoritmo kruskal.txt'); 
numero_vertices=fscanf(fichero,'%d',1);
V=zeros(1,numero_vertices);
V=fscanf(fichero,'%d',numero_vertices)'
numero_aristas=fscanf(fichero,'%d',1);
E=zeros(1,numero_aristas);
E=fscanf(fichero,'%d',2*numero_aristas)'%Aristas ordenadas
p=zeros(1,numero_aristas); 
p=[fscanf(fichero,'%d',2*numero_aristas+1)]' %Pesos de cada arista ordenados
for i=1:numero_vertices
    dep(i)=0;
end
nro_dep=0
T=zeros(1:1)
[n,m]=size(T);
ei=E(1:2:16);
ef=E(2:2:16);
j=1
    while j<=numero_aristas && m<2*(numero_vertices-1)
        if dep(ei(j))==dep(ef(j)) && dep(ei(j))==0    %Nuevo dep�sito con los v�rtices de 'ei' y 'ef'
            T(2*j-1)=ei(j);  %Aqu� estoy a�adiendo los v�rtices de donde salen las aristas que van a formar el �rbol soporte
            T(2*j)=ef(j);   %aqu� a�ado los v�rtices finales de las aristas del �rbol soporte
            nro_dep=nro_dep+1
            dep(ei(j))=nro_dep;
            dep(ef(j))=nro_dep
            peso_total(j)=p(j); %Creo otro vector que almacene los pesos de las aristas del �rbol soporte(T) 
            T=nonzeros(T)';
        end
        if dep(ei(j))~=dep(ef(j)) && dep(ef(j))==0            %El v�rtice proveniente de 'ef' se a�ade al v�rtice de 'ei'
            T(2*j-1)=ei(j);
            T(2*j)=ef(j);
            dep(ef(j))=dep(ei(j))
            peso_total(j)=p(j);
            T=nonzeros(T)';
        end
        if dep(ei(j))==dep(ef(j)) && dep(ei(j))~=0             %En este caso ambos v�rtices pertenecen al mismo dep�sito
            T=nonzeros(T)'
        end
        if dep(ei(j))~=dep(ef(j)) && dep(ei(j))~=0 && dep(ef(j))~=0  %Se funden los dep�sitos de ambos v�rtices
            T(2*j-1)=ei(j)';
            T(2*j)=ef(j)';
            dmin=min(dep(ei(j)),dep(ef(j)))
            dmax=max(dep(ei(j)),dep(ef(j)))
            for i=1:numero_vertices
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
    disp('El arbol soporte de m�nimo peso es:')
    T
    disp('Y su peso es:')
    sum(peso_total)
    
    
    