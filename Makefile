.PHONY: all eda regression session tests report clean data 

# all	
all: eda regression report

# data downloads Credit dataset
data: 
	 curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

# Runs data prprocessing script
preproc: data code/scripts
	Rscript -e 'source("code/scripts/data-preprocess.R")'

# Runs principal components regression script
pcr: preproc
	Rscript -e 'source("code/scripts/pca_regression.R")'





	
# Clean output file
clean:
	rm -f report/report.pdf