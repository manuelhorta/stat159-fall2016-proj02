
# -------------------------------------------
# -------------------------------------------
#           Ridge Regression
# This script computes the ridge regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------

source('code/scripts/data-preprocess.R', echo=TRUE)
# install.packages('glmnet')
library(glmnet)
set.seed(1)

# -------------------------------------------
# Fit Model
# -------------------------------------------
grid <- 10^seq(10, -2, length = 100)

set.seed(1)
x <- model.matrix(Balance ~ ., data = data.frame(credit_train))
y <- data.frame(credit_train)$Balance

ridge_mod <- cv.glmnet(x, y, intercept = FALSE, standardize = FALSE, lambda = grid, alpha = 0)


ridge_best_labmda <- ridge_mod$lambda.min

# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/ridge_validation_plot.png")
plot(ridge_mod)
title('Plot of Ridge Model', line = 2)
dev.off()



# -------------------------------------------
# Predict and MSE
# -------------------------------------------

ridge_pred <- predict(ridge_mod, s= ridge_best_labmda, newx= model.matrix(Balance ~ ., data = data.frame(credit_test)))
ridge_mse <- mean((ridge_pred - credit_test[,12])^2)



# -------------------------------------------
# Refit on full dataset
# -------------------------------------------
ridge_fit_full <- cv.glmnet(model.matrix(Balance ~ .,data = data.frame(scaled_credit)),
                            data.frame(scaled_credit)$Balance, 
                            intercept = FALSE,
                            standardize = FALSE,
                            alpha = 0)


(ridge_pred_full <- predict (ridge_fit_full, type="coefficients", s= ridge_best_labmda))


save(ridge_mod, ridge_best_labmda, ridge_mse, ridge_fit_full, ridge_pred_full, file = 'data/Ridge-saved-objects.Rdata')

sink('data/model-results/ridge-results.txt')
'> ridge best lambda' 
ridge_best_labmda
'> ridge test MSE'
ridge_mse
'> ridge official coefficients'
ridge_pred_full
sink(NULL)

