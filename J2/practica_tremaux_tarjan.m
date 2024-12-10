clear all
clc
fichero=fopen('ored.txt');
n=fscanf(fichero,'%d')
v=zeros(1,n)
v=fscanf(fichero,'%s',10) 
m=fscanf(fichero,'%d')
a=zeros(1,m)
a=fscanf(fichero,'%s',20)
A=zeros(n,m)
for i=1:20
    for j=1:10
        if a(i)==v(j)
            C(j,i)=1
        end
    end
end
for i=1:10
    A(:,i)=C(:,2*i-1)+C(:,2*i)
end
for i=1:2:19
    for j=1:10
        if a(i)==v(j)
            for k=1:10
                if a(i+1)==v(k)
                    B(j,k)=1
                    B(k,j)=1
                end
            end
        end
    end
end
Ady=B
Inc=A
K=(eye(n)+B')^n-1;
for i=1:n
    for j=1:n
        if K(i,j)~=0
            fprintf('Existen cadenas desde A hasta J,y son:')
            break
        else
            fprintf('No existe ninguna cadena,luego no es conexo')
            break
        end
    end
    break
end
for i=1:n
    for j=1:n
            if B(i,j)==1 && j>i
                    H=[v(i) v(j)]
                    i=j; 
            end
    end
end