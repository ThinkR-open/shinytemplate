FROM rocker/r-ver:3.5.1
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "97bbf81")'
RUN Rscript -e 'remotes::install_version("attempt", version = "0.3.0")'
RUN Rscript -e 'remotes::install_version("cli", version = "1.1.0")'
RUN Rscript -e 'remotes::install_version("crayon", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version("dockerfiler", version = "0.1.3")'
RUN Rscript -e 'remotes::install_version("glue", version = "1.3.1")'
RUN Rscript -e 'remotes::install_version("htmltools", version = "0.4.0")'
RUN Rscript -e 'remotes::install_version("jsonlite", version = "1.6")'
RUN Rscript -e 'remotes::install_version("magrittr", version = "1.5")'
RUN Rscript -e 'remotes::install_version("pkgload", version = "1.0.2")'
RUN Rscript -e 'remotes::install_version("remotes", version = "2.1.0")'
RUN Rscript -e 'remotes::install_version("rlang", version = "0.4.0")'
RUN Rscript -e 'remotes::install_version("roxygen2", version = "6.1.1")'
RUN Rscript -e 'remotes::install_version("rsconnect", version = "0.8.15")'
RUN Rscript -e 'remotes::install_version("rstudioapi", version = "0.10")'
RUN Rscript -e 'remotes::install_version("shiny", version = "1.4.0")'
RUN Rscript -e 'remotes::install_version("testthat", version = "2.2.1")'
RUN Rscript -e 'remotes::install_version("usethis", version = "1.5.1")'
RUN Rscript -e 'remotes::install_version("yesno", version = "0.1.0")'
RUN Rscript -e 'remotes::install_version("purrr", version = "0.3.3")'
RUN Rscript -e 'remotes::install_version("covr", version = "3.3.2")'
RUN Rscript -e 'remotes::install_version("devtools", version = "2.2.1")'
RUN Rscript -e 'remotes::install_version("DT", version = "0.9")'
RUN Rscript -e 'remotes::install_version("knitr", version = "1.25")'
RUN Rscript -e 'remotes::install_version("pkgdown", version = "1.4.1")'
RUN Rscript -e 'remotes::install_version("rcmdcheck", version = "1.3.3")'
RUN Rscript -e 'remotes::install_version("rmarkdown", version = "1.16")'
RUN Rscript -e 'remotes::install_version("spelling", version = "2.1")'
RUN Rscript -e 'remotes::install_version("stringr", version = "1.4.0")'
RUN Rscript -e 'remotes::install_version("withr", version = "2.1.2")'
RUN Rscript -e 'remotes::install_github("r-lib/desc@42b9578f374bf685610b1efb05315927ae236d5b")'
RUN Rscript -e 'remotes::install_github("rstudio/packrat@c0a67564df0bff16c952117050f510f2c8eace0a")'
COPY golem_*.tar.gz /app.tar.gz
RUN R -e 'remotes::install_local("/app.tar.gz")'
CMD R -e "options('shiny.port'=$PORT,shiny.host='0.0.0.0');golem::run_app()"
