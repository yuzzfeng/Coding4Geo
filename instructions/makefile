build:
	docker build -f nfdi_jupyterhub.dockerfile -t nfdi_jupyterhub/lab .

start:
	docker run --rm -it -v ${PWD}/:/home/instructor/work -w /home/instructor/work --name nfdi4earth_hub -p 8763:8000 nfdi_jupyterhub/lab 
	
	
start_bash:
	docker run --rm -it -v ${PWD}/work:/home/instructor/work -w /home/instructor --name nfdi4earth_hub -p 8763:8000 nfdi_jupyterhub/lab bash

start_student:
	docker run --rm -it -v ${PWD}/work:/home/instructor/work -w /home/instructor --name nfdi4earth_hub_student -p 8770:8000 nfdi_jupyterhub/lab bash

# docker run --rm -it --gpus all --user=$(id -u):$(id -g) -v <path in host os>:<dir in container> -w <dir in container> --name <any name> -p <a free port in host os>:8888 nfdi/lab 
