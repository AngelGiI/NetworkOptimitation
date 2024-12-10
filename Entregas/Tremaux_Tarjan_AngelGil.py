# -*- coding: utf-8 -*-
"""
Created on Tue Mar  9 10:15:20 2021

@author: Angel
"""

f = open('grafo28.txt','r')
contenido = f.readlines()

n = int(contenido[1])
m = int(contenido[2])
del contenido[0:3]

# Creamos un vector con todas las aristas
lista=[]
for par in contenido:
    lista.append(par.split())
for par in lista:
    for i in range(len(par)):
        par[i]=int(par[i])

# Creamos el vector gamma
gamma=[]
for i in range(n):
    gamma.append([])

for i in range(n):
    for par in lista:
        if par[0]==i+1:
            gamma[i].append(par[1])
           
# Lo ordenamos
for i in range(n):
    gamma[i].sort()

# Creamos el vetor grado d, de cada vertice 
grado = []
for j in range(n):
    grado.append(len(gamma[j]))

# Inicializamos
p=[1]
nson=[0]
nvis=1
for i in range(n-1):
    p.append(0)
    nson.append(0)

# Ejecutamos el algoritmo principal
i = 0
while i != 99999:
    if nson[i] < grado[i]:
        j=gamma[i][nson[i]] - 1
        nson[i] = nson[i] + 1
        if p[j] == 0:
            p[j]= i + 1
            i = j
            nvis = nvis + 1
    else:
        if i == 0:
            if nvis == n:
                salida = 'El grafo es conexo. '
                i = 99999
            else:
                salida = 'El grafo no es conexo. '
                i = 99999
        else:
            i = p[i]-1

# Escribimos los resultados                    
fsal = open('SalidaTremaux.txt','w')
escribo = 'El grafo consta de '+str(n)+' nodos y '+str(m)+' aristas.\n'
fsal.write(escribo)
fsal.write('\n\t'+salida+'P(i) = '+str(p))
f.close()