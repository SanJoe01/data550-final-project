FROM rocker/r-ver:4.5.3

RUN apt-get update && apt-get install -y \
    make \
    pandoc \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libicu-dev \
    libpng-dev \
    libnode-dev \
    zlib1g-dev \
    && apt-get clean

WORKDIR /home/project

COPY . .

ENV RENV_CONFIG_REPOS_OVERRIDE=https://cloud.r-project.org

RUN Rscript -e "options(download.file.method='libcurl'); install.packages('renv', repos='https://cloud.r-project.org')"

RUN rm -rf /root/.cache/R/renv

RUN Rscript -e "options(download.file.method='libcurl'); renv::restore()"

CMD ["make", "all"]