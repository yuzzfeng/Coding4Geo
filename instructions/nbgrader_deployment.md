# Coding4Geo
An open-access and interactive coding platform to facilitate E-Teaching in Geospatial Data Analysis (Coding4Geo)

## Docker implementation of the nbgrader+jupyterhub

### Step1:

Get the [dockerfile](https://github.com/yuzzfeng/Coding4Geo/blob/main/instructions/nfdi_jupyterhub.dockerfile) and [makefile](https://github.com/yuzzfeng/Coding4Geo/blob/main/instructions/makefile) from the Coding4Geo github.

### Step2:

Run the "make" command, there are three command in the [makefile](https://github.com/yuzzfeng/Coding4Geo/blob/main/instructions/makefile)

* build command for the docker image: 

`docker build -f nfdi_jupyterhub.dockerfile -t nfdi_jupyterhub/lab .`

* start_bash command for the instructor instance (by mapping default jupyterhub port 8000 to 8763): 

`docker run --rm -it -v ${PWD}/work:/home/instructor/work -w /home/instructor --name nfdi4earth_hub -p 8763:8000 nfdi_jupyterhub/lab bash`

* start_student command for the student instance (simillarly mapping port 8000 to 8770)

`docker run --rm -it -v ${PWD}/work:/home/instructor/work -w /home/instructor --name nfdi4earth_hub_student -p 8770:8000 nfdi_jupyterhub/lab bash`

### Step3:

Inside the container, especially for student instance, diable the formgrader extension:


´jupyter nbextension disable --section=tree assignment_list/main --sys-prefix

jupyter nbextension disable --section=tree formgrader/main --sys-prefix

jupyter nbextension disable --section=tree course_list/main --sys-prefix´

then run `jupyterhub --allow-root`

