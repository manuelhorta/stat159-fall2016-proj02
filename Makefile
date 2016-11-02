.PHONY: all eda regression session tests report clean data 

# all	
all: eda regression report preproc pcr pls ridge lasso 

# data downloads Credit dataset
data: 
	 curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

# Runs data prprocessing script
preproc: data code/scripts
	Rscript -e 'source("code/scripts/data-preprocess.R")'

# Runs principal components regression script
pcr: preproc
	Rscript -e 'source("code/scripts/pca_regression.R")'

pls: preproc
	Rscript -e 'source("code/scripts/pls_regression.R")'

lasso: preproc
	Rscript -e 'source("code/scripts/lasso_regression.R")'

ridge: preproc
	Rscript -e 'source("code/scripts/ridge_regression.R")'




	
# Clean output file
clean:
	rm -f report/report.pdf