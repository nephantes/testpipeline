# Don't upgrade nfcore/base, it creates "Kernel too old" error for singularity (because of the debian image)
FROM nfcore/base:1.7 
LABEL author="onur.yukselen@umassmed.edu" description="Docker image containing all requirements for the dolphinnext/rnaseq pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nephantes-mytest-1.0/bin:$PATH
