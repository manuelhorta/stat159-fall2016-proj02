D = data
CS = code/scripts

.PHONY: all eda regression session tests report clean data 

# all	
all: eda regression report preproc pcr plsr ridge lasso 

# data downloads Credit dataset
data: 
	 curl -o $@/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

# Runs data prprocessing script
preproc: $(D) code/scripts
	Rscript -e 'source("code/scripts/data-preprocess.R")'

ols:
	Rscript -e 'source("code/scripts/ols-regression.R")'

pcr: preproc
	Rscript -e 'source("code/scripts/pca_regression.R")'

plsr: preproc
	Rscript -e 'source("code/scripts/pls_regression.R")'

lasso: preproc
	Rscript -e 'source("code/scripts/lasso_regression.R")'

ridge: preproc
	Rscript -e 'source("code/scripts/ridge_regression.R")'

eda:
	Rscript -e 'source("code/scripts/eda.R")'

regression:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

tests:
	Rscript -e 'source("code/tests/test-regressions.R")'

session:
	bash $@.sh

report: report/report.Rmd
	Rscript -e 'rmarkdown::render("report/report.Rmd")'

slides: slides/slides.Rmd
	Rscript -e 'rmarkdown::render("slides/slides.Rmd")'

clean:
	rm -f report/report.pdf