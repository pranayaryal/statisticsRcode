##conducting one way anova table for means

anov<-read.csv('Mult(1).csv')

##getting summary of data by methods and scores
tapply(anov$score,anov$method,summary)

##looking at data with boxplots of factors
boxplot(score~method,data=anov)

##one-way analysis of means
oneway.test(score~method,data=anov,var.equal=T)

##levene test to look for homogeniety of variance
levene.test(anov$score,anov$method,
            location="median")

