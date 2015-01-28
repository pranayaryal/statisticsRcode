##conducting one way anova table for means

anov<-read.csv('Mult(1).csv')

##getting summary of data by methods and scores
tapply(anov$score,anov$method,summary)

##looking at data with boxplots of factors
boxplot(score~method,data=anov)

##one-way analysis of means
oneway.test(score~method,data=anov,var.equal=T)

##looking at variances of group
with(anov,tapply(score,method,var))

##levene test to look for homogeniety of variance
levene.test(anov$score,anov$method,
            location="median")

##checking normality in residuals.Create an object to store the aov
obj<-aov(iop~formulation,data=iop)
## the class of this object  class(obj) will give "lm" "aov"

##this will give you the value of residuals(a vector of integers)
obj$residuals

##this can be added to the dataframe as a separate variable
anov$residuals<-obj$residuals

## checking normality
shapiro.test(anov$residuals)


