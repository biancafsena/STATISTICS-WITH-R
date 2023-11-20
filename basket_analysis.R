#https://select-statistics.co.uk/blog/market-basket-analysis-understanding-customer-behaviour/

#install.packages("arules")
#install.packages("arulesViz")

library("arules")
library("arulesViz")



#Load data set:
data("Groceries")


summary(Groceries)
#Look at data:
inspect(Groceries[1])
LIST(Groceries)[1]


#Calculate rules using apriori algorithm and specifying support and confidence thresholds:
rules = apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
#Inspect the top 5 rules in terms of lift:
inspect(head(sort(rules, by ="lift"),5))
#Plot a frequency plot:
itemFrequencyPlot(Groceries, topN = 50)

#Scatter plot of rules:
library("RColorBrewer")
plot(rules,control=list(col=brewer.pal(11,"Spectral")),main="")
#Rules with high lift typically have low support.
#The most interesting rules reside on the support/confidence border which can be clearly seen in this plot.

#Plot graph-based visualisation:
subrules2 <- head(sort(rules, by="lift"), 10)
plot(subrules2, method="graph",control=list(type="items",main=""))

