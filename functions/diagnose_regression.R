#This function prints out the summary of the regression diagnostics

#----------------------------------------------------------------------------#
#
#
# dataset.model = regression model that you are interesteed in testing
# df = dataset of your regression model
#
#
#----------------------------------------------------------------------------#

diagnose_regression <- function(dataset.model, df){


# dataset.model <- fit.beta() #Regression model
# df <- dataset_reg() #Regrssion dataset


k <-length(coef(dataset.model)-1)-1 #k is number of predictors
n <- nobs(dataset.model) #n is total IDs 

predictors <- c(names(coef(dataset.model)))[-1] #get our predictors



# Detecting Unusual and Influential Data 

# Studentdized residuals: identify Abs values > 2
df$stud.resid <- rstudent(dataset.model) # studentized residuals
diagnosticlist = list(df[df$stud.resid>2,1]) # Studentdized residuals outliers
names(diagnosticlist) = 'stud.resid'


# leverage: Identify values >(2k+2)/n
df$leverage <- hat(model.matrix(dataset.model))
diagnosticlist[[2]] = list(df[df$leverage >((2*k + 2)/n),1]) # leverage outliers
names(diagnosticlist)[2] = 'leverage'

# Cook's D plot: identify D values > 4/(n-k-1) 
cutoff <- 4/(n-k-1)
df$cooks.d <- cooks.distance(dataset.model)
diagnosticlist[[3]] = list(df[cooks.distance(dataset.model)>cutoff,1]) # Cook's D outliers
names(diagnosticlist)[3] = 'Cooks.D'

# DFBETAs: Identify values > 2/sqrt(n)
diagnosticlist[[4]] = list(df[ceiling(which(dfbetas(dataset.model)> 2/sqrt(n))/(k+1)),1]) #Identify ID > 2/sqrt(n))
names(diagnosticlist)[4] = 'DFBETAs'

# DFFITS: Identify values > 2*sqrt(k/n)
df$dffits <- dffits(dataset.model)
diagnosticlist[[5]] = list(df[(dffits(dataset.model)> 2*sqrt(k/n)),1]) # DFFITS outliers
names(diagnosticlist)[5] = 'DFFITS'

# Tests for Multicollinearity 
diagnosticlist[[6]] = list(sqrt(vif(dataset.model)) > 2) # VIF Tolerance outliers
names(diagnosticlist)[6] = 'VIF'

# Print ID with diagnostics issues
print(diagnosticlist)

}