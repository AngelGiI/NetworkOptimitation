PROGRAM tremaux_tarjan_angel_gil
IMPLICIT NONE 

INTEGER n, m
INTEGER, ALLOCATABLE :: A(:,:)

OPEN (17, FILE='tremaux.txt')
OPEN (18, FILE='tremaux.RESULT')

READ (17, '(/I5/I5)') n, m
WRITE (18, '(A/)') 'Algoritmo de Tremaux-Tarjan, por Angel Gil.'
WRITE (18, '(3X,A,I5,A,I5,A/)') 'El grafo consta de', n, ' nodos y', m, ' aristas.'
ALLOCATE (A(m,2))

DO i = 1, m
  READ (17, '(I2,I2)') A(i,1), A(i,2)
ENDDO

h = 1

DEALLOCATE (A)
ENDPROGRAM tremaux_tarjan_angel_gil