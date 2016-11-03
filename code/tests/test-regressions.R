# Test file

library(testthat)


# Load in data & model scripts
source('code/scripts/ridge_regression.R')
source('code/scripts/lasso_regression.R')
source('code/scripts/pls_regression.R')
source('code/scripts/pca_regression.R')
#--------------------------------------------------------------------------------------------------------



# Ridge  
context("Test Ridge")
test_that("Ridge works ",{
  
  
  expect_lt(ridge_mse, 0.05)
})


# LASSO
context("Test LASSO")
test_that("LASSO MSE is accurate ",{
  
  expect_lt(lasso_mse, 0.05)
  
})  



# PCR
context("Test PCR")
test_that("PCR Optimal Components Work",{
  
  expect_equal(10L, best_mod_comp_pcr)
  
  
})



# PLS
context("Test PLS")
test_that("PLS works" , {
  
  expect_equal(9L, best_mod_comp_pls)
})

# ------- end --------