clear all
fich = fopen('pastor.txt');
n = fscanf(fich, '%d')
V = zeros(1,n)
V = fscanf(fich, '%s', 10)
m = fscanf(fich, '%d')
A = zeros(1,m)
A = fscanf(fich, '%s', 20)
incidencia = zeros(n,m)
adyacencia = zeros(n,m)
for i = 1:10
    for j = 1:10
        if A(i) == V(j) && mod(i,2)==0
            incidencia (j,i) = 1
        end
    end
end
for i = 1:2:20
    for j = 1:10
        if V(j) == A(i)
            for k = 1:10
                if A(i+1) == V(k)
                    adyacencia(j,k) = 1
                    adyacencia(k,j) = 1
                end
            end
        end
    end
end
%Metodo matricial    
B =eye(10)+ adyacencia
dimension = 0
for k = 1:10
    C = B^k
    if C(1,n) ~= 0
        dimension = dimension + k
        break
    end
end  
cadena (dimension + 1) = V(n)
i = 1
k = 1
while i < 10
    for j = i:n
        if B(i,j) ~= 0
             cadena(k) = V(j)
             i=j
             k = k + 1
        end
    end
end
Texto = 'Donde A = PHCL, B = PL, C = PLH, D = L,  F = HCL, H = C, I = CH, J = vacío'
Texto2 = ' siendo H = hombre, P = perro, L = lehuga y C = conejo'
ficherosal = fopen('cadena.txt', 'w')
fprintf(ficherosal, '%s', cadena)
fprintf(ficherosal, '%s', Texto)
fprintf(ficherosal, '%s', Texto2)

fclose(fich)
