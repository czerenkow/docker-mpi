# docker-mpi

Setup Docker Swarm
TBD

Set up registry ("ingress" network will be used):
```
docker service create --name registry --publish published=5000,target=5000 registry:2
```

Build and push to the registry
```
docker-compose build
docker-compose push
```

Start services
```
docker stack deploy --compose-file docker-compose.yml stackmpi
```
By default it will create network "stackmpi_default".

And now you can ssh to master
```
ssh -p 2222 -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@localhost
```
TODO: Better to attach to container "normally"

Now, inside master container generate list of worker nodes:
```
dig +nocmd +nocomments +noquestion +nostats "tasks.worker" | awk '{print $5}' > machinefile
```

Start MPI program:
```
mpiexec -f machinefile -n 2 hostname
```

Stop stack:
docker stack rm stackmpi



