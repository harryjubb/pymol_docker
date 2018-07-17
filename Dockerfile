FROM debian:jessie-slim
LABEL maintainer="Harry Jubb<hj4@sanger.ac.uk>"

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential python-dev python-pmw libglew-dev \
  freeglut3-dev libpng-dev libfreetype6-dev libxml2-dev \
  libmsgpack-dev python-pyqt5.qtopengl libglm-dev git ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /pymol

RUN git clone https://github.com/harryjubb/pymol-open-source.git
WORKDIR pymol-open-source
# BRANCH WITH COMPILATION FIX (schrodinger/pymol-open-source#2)
RUN git checkout temp_compile_fix
RUN python setup.py install --prefix=/pymol
ENV PATH="/pymol/bin:${PATH}"

# SAVE SPACE BY DELETING THE REPO
WORKDIR ..
RUN rm -rf pymol-open-source
