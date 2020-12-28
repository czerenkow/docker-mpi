#include <mpich/mpi.h>
#include <stdio.h>
#include <sys/sysinfo.h> // number of cpu


int main(int argc, char **argv) {

    MPI_Init(NULL, NULL);

    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;
    MPI_Get_processor_name(processor_name, &name_len);

    printf("Processor %s, rank %d out of %d processors. CPUs: %d   CPUs available: %d\n",
           processor_name, world_rank, world_size, get_nprocs_conf(), get_nprocs());

    MPI_Finalize();
    return 0;
}

