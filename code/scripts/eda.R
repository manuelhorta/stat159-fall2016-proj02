credit=read.csv("data/Credit.csv")
credit_numeric <- credit[ -c(1,8:11) ]
sink("data/eda.txt")
paste("Summary of Quantitative Variables")
paste("Mean")
sapply(credit_numeric, mean, na.rm=TRUE)
paste("Standard Deviation")
sapply(credit_numeric, sd, na.rm=TRUE)
paste("Mean, Median, 1st and 3rd Quartile, Min, Max")
sapply(credit_numeric, summary, na.rm=TRUE)
paste("Range")
sapply(credit_numeric, range, na.rm=TRUE)
paste("IQR")
sapply(credit_numeric, IQR, na.rm=TRUE)
paste("Summary of Qualitative Variables")
paste("Frequency Tables")
paste("1. Gender")
table(credit$Gender)
paste("2. Student")
table(credit$Student)
paste("3. Married")
table(credit$Married)
paste("4. Ethnicity")
table(credit$Ethnicity)
paste("Relative Frequency Tables")
paste("1. Gender")
prop.table(table(credit$Gender))
paste("2. Student")
prop.table(table(credit$Student))
paste("3. Married")
prop.table(table(credit$Married))
paste("4. Ethnicity")
prop.table(table(credit$Ethnicity))
paste("Matrix of Correlations for Quantitative Variables")
as.matrix(cor(credit_numeric))
paste("ANOVA between Balance and ...")
paste("1. Income")
aov(Balance~Income, data=credit)
paste("2. Limit")
aov(Balance~Limit, data=credit)
paste("3. Rating")
aov(Balance~Rating, data=credit)
paste("4. Cards")
aov(Balance~Cards, data=credit)
paste("5. Age")
aov(Balance~Age, data=credit)
paste("6. Education")
aov(Balance~Education, data=credit)
sink()

pdf("images/barcharts/ethnicity_barchart.pdf")
barplot(table(credit$Ethnicity), main="Ethnicity Distribution",
        xlab="Ethnicity")
dev.off()

pdf("images/barcharts/gender_barchart.pdf")
barplot(table(credit$Gender), main="Gender Distribution",
        xlab="Gender")
dev.off()

pdf("images/barcharts/married_barchart.pdf")
barplot(table(credit$Married), main="Married Distribution",
        xlab="Married")
dev.off()

pdf("images/barcharts/student_barchart.pdf")
barplot(table(credit$Student), main="Student Distribution",
        xlab="Student")
dev.off()

pdf("images/boxplots/age_boxplot.pdf")
boxplot(credit$Age, main="Age Boxplot", ylab= "Age")
dev.off()

pdf("images/boxplots/balance_boxplot.pdf")
boxplot(credit$Balance, main="Balance Boxplot", ylab= "Balance")
dev.off()

pdf("images/boxplots/cards_boxplot.pdf")
boxplot(credit$Cards, main="Cards Boxplot", ylab= "Cards")
dev.off()

pdf("images/boxplots/education_boxplot.pdf")
boxplot(credit$Education, main="Education Boxplot",
        ylab= "Education")
dev.off()

pdf("images/boxplots/income_boxplot.pdf")
boxplot(credit$Income, main="Income Boxplot", ylab= "Income")
dev.off()

pdf("images/boxplots/limit_boxplot.pdf")
boxplot(credit$Limit, main="Limit Boxplot", ylab= "Limit")
dev.off()

pdf("images/boxplots/rating_boxplot.pdf")
boxplot(credit$Rating, main="Limit Boxplot", ylab= "Limit")
dev.off()

pdf("images/conditional_boxplots/student_conditional_boxplot.pdf")
boxplot(credit$Balance~credit$Student,
        main="Conditional Boxplot of Balance vs. Student",
        ylab= "Balance", xlab="Student")
dev.off()

pdf("images/conditional_boxplots/married_conditional_boxplot.pdf")
boxplot(credit$Balance~credit$Married,
        main="Conditional Boxplot of Balance vs. Married",
        ylab= "Balance", xlab="Married")
dev.off()

pdf("images/conditional_boxplots/ethnicity_conditional_boxplot.pdf")
boxplot(credit$Balance~credit$Ethnicity,
        main="Conditional Boxplot of Balance vs. Ethnicity",
        ylab= "Balance", xlab="Ethnicity")
dev.off()

pdf("images/conditional_boxplots/gender_conditional_boxplot.pdf")
boxplot(credit$Balance~credit$Gender,
        main="Conditional Boxplot of Balance vs. Gender",
        ylab= "Balance", xlab="Gender")
dev.off()

pdf("images/histograms/age_histogram.pdf")
hist(credit$Age, main="Age Histogram",xlab="Age")
dev.off()

pdf("images/histograms/balance_histogram.pdf")
hist(credit$Balance, main="Balance Histogram",xlab="Balance")
dev.off()

pdf("images/histograms/cards_histogram.pdf")
hist(credit$Cards, main="Cards Histogram",xlab="Cards")
dev.off()

pdf("images/histograms/education_histogram.pdf")
hist(credit$Education, main="Education Histogram",
     xlab="Education")
dev.off()

pdf("images/histograms/income_histogram.pdf")
hist(credit$Income, main="Income Histogram",xlab="Income")
dev.off()

pdf("images/histograms/limit_histogram.pdf")
hist(credit$Limit, main="Limit Histogram",xlab="Limit")
dev.off()

pdf("images/histograms/rating_histogram.pdf")
hist(credit$Rating, main="Rating Histogram",xlab="Rating")
dev.off()

pdf("images/scatterplot_matrix.pdf")
pairs(credit_numeric,
      main="Scatterplot Matrix of Quantitative Variables")
dev.off()
