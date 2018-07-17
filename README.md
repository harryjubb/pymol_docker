# PyMOL Docker

Docker build for PyMOL. Based on PyMOL(TM) technology. PyMOL is a trademark of Schrodinger,
 LLC. This repository is not affiliated with Schrodinger, LLC.

## Running PyMOL

    docker run --rm -it harryjubb/pymol pymol --help

- `--rm`: clean up the Docker container when the run is finished
- `-it`: interactive run with a pseudo-TTY terminal

Well suited to running PyMOL commands in batch/command-line only mode
(see the relevant PyMOL command line options, i.e. `-c`, `-d` etc).

If you want to access files from the host machine, the most straightforward way is to (bind-) mount them into the container:

    docker run --rm -it -v "$(pwd)":/run -u `id -u`:`id -g` harryjubb/pymol pymol [arguments]

- `-v`: bind-mount a host machine directory in the container (with your input files, and where your output files will appear). In this case, the current working directory will be mounted to `/run` in the container
- - ``-u `id -u`:`id -g` ``: Set the user and group in the Docker container to match the host user and group running the container, so that any files written are written as the correct user

To run with the GUI, you'd need to attach a display in the Docker command. This appears to be [possible](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/), but is untested here.
