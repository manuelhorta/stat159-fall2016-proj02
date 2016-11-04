slides
========================================================
author: Jared Wilber, Austin Carango, Manuel Horta
date: October 28, 2016

Project 2
========================================================

This is a slide show for project 2, Stat 159 (at UC Berkeley)

Authors

- Jared Wilber
- Austin Carango
- Manuel Horta

Ridge Regression
========================================================

- Shrinkage Technique
- Append l-2 regularization parameter to

Ridge Regresson 2
========================================================



Lasso
========================================================



Lasso
========================================================


Principal Components Regression
========================================================

- Principal Components Regression is a popular technique
used in regression. It is often used for high-dimensional
datasets.

- First, scale and mean-center the data.
- Next, perform PCA on the data.
- Finally, perform original least squares regression on the
new dataset.

Procs of Principal Components Regression
========================================================
- Often used with high-dimensional datasets because it allows
us to reduce the dimensions of the data.

- Removes correlation between features.



Cons of Principal Components Regression
========================================================

- The resulting components that you are regressing on are
linear combinations of the other features, so they are essentially
impossible to interpret.
- We make an inherent assumption that these components will be related in the direction of
our dependent variable, though this isn't always the case.

Partial Least Squares Regression
========================================================

- Partial Least Squares Regression is a regression technique
that is very similar to principal components analysis, but
accounts for the association with Y downfall of PCR by ensuring that
the selected components are associated with the dependent variable

- It has the same cons as PCR with regards to

Conclusions
========================================================

- Multiple regression techniques exist, each with their own pros and cons

- Ridge

- Lasso

- PCR

-PLS
