.PHONY: all eda regression session tests report clean data 

# all	
all: eda regression report

# data downloads Advertising dataset
data: 
	 curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

data/preproc: data code/scripts
	Rscript -e 'source("code/scripts/data-preprocess.R")'

pca: data/preproc
	Rscript -e 'source("code/scripts/pca_regression.R")'

# sourcing scripts for eda, regression, session info
eda: data
	Rscript -e 'source("code/scripts/eda-script.R")'

regression: data
	Rscript -e 'source("code/scripts/regression-script.R")'

session:
	Rscript -e 'source("code/scripts/session-info-script.R")'


# test regression function
tests: 
	Rscript -e 'source("code/test-that.R")'





	
# Clean output file
clean:
	rm -f report/report.pdf