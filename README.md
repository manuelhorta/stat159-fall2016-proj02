# Project 2 Stat 159

This project implements 5 regression models 

## File Structure  

stat159-fall2016-project2/  
+   README.md  
+   Makefile  
+   LICENSE  
+   session-info.txt  
+   .gitignore  
+   code/  
	+ README.md  
	+ functions/  
	+ scripts/  
		+ data-preprocess.R  	
		+ eda.R	  
		+ lasso_regression.R  	
		+ ols-regression.R	  
		+ pca_regression.R	  
		+ pls_regression.R	  
		+ ridge_regression.R	  
		+ session-info.R  
	+ tests/  
		+ test-regressions.R
+   data/  
	+ README.md  
	+ model-results/    
		+ lasso-results.txt  
		+ ols-results.txt  
		+ pcr-results.txt  
		+ pls-results.txt  
		+ ridge-results.txt  
	+ Credit.csv  
	+ scaled-credit.csv  
	+ eda.txt  
	+ train-test-indices.Rdata  
	+ lasso-saved-objects.Rdata  
	+ pcr-saved-objects.Rdata  
	+ pls-saved-objects.Rdata  
	+ ridge-saved-objects.Rdata  
	+ ols-saved-objects.Rdata   
+   images/  
	+ README.md  
	+ barcharts/
		+ ethnicity_barchart.pdf
		+ gender_barchart.pdf
		+ married_barchart.pdf
		+ student_barchart.pdf
	+ boxplots/ 
		+ age_boxplot.pdf
		+ balance_boxplot.pdf
		+ cards_boxplot.pdf
		+ education_boxplot.pdf
		+ income_boxplot.pdf
		+ limit_boxplot.pdf
		+ rating_boxplot.pdf
	+ conditional_boxplots/  
		+ ehnicity_conditional_boxplot.pdf
		+ gender_conditional_boxplot.pdf
		+ married_conditional_boxplot.pdf
		+ student_conditional_boxplot.pdf
	+ histograms/  
		+ age_histogram.pdf
		+ balance_histogram.pdf
		+ cards_histogram.pdf
		+ education_histogram.pdf
		+ income_histogram.pdf
		+ limit_histogram.pdf
		+ rating_histogram.pdf
	+ lasso_validation_plot.png  
	+ ols_plots.png  
	+ pcr_validation_plot.png  
	+ pls_validation_plot.png  
	+ ridge_validation_plot.png  
	+ scatterplot_matrix.pdf  
+   report/  
	+ report.pdf  
	+ report.Rmd  
	+ sections/  
		+ 00-abstract.Rmd  
		+ 01-introduction.Rmd  
		+ 02-data.Rmd  
		+ 03-methods.Rmd  
		+ 04-analysis.Rmd  
		+ 05-results.Rmd  
		+ 06-conclusions.Rmd  
   + slides/  

## Authors  

* Jared Wilber
* Austin Carango
* Manny Horta

## Installation

* Use a computer with R and bash installed
* Clone this repository into your directory of choice


## Usage

* Check the session-info.txt file to make sure you have the relevant packages
* Run the Makefile as you see fit to re-implement what you want

## Make commands  
 
.PHONY: all eda regression session tests report clean data   

eda:  
&nbsp;&nbsp;&nbsp;&nbsp;Rscript -e 'source("code/scripts/eda.R")'    

regression:  
&nbsp;&nbsp;&nbsp;&nbsp;	make ols  
&nbsp;&nbsp;&nbsp;&nbsp;	make ridge  
&nbsp;&nbsp;&nbsp;&nbsp;	make lasso  
&nbsp;&nbsp;&nbsp;&nbsp;	make pcr  
&nbsp;&nbsp;&nbsp;&nbsp;	make plsr  

tests:  
&nbsp;&nbsp;&nbsp;&nbsp;	Rscript -e 'source("code/tests/test-regressions.R")'  

session:   
&nbsp;&nbsp;&nbsp;&nbsp;	bash session.sh  
	

clean:  
&nbsp;&nbsp;&nbsp;&nbsp;	rm -f report/report.pdf  
	
data:  
&nbsp;&nbsp;&nbsp;&nbsp;	curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv  
	 
## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D


## License

MIT (see License file)

The following license is for all media.   
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  
  

