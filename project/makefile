.PHONY: clean
MPICC?=mpicc

test-mpi: test-mpi.c
	${MPICC} -o test-mpi test-mpi.c

clean:
	rm -f test-mpi
