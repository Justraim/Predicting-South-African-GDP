rm(list=ls())

#Loading the Necessary Libraries
library(stargazer) # For tables
library(lmtest) # DW test
library(readxl)
library(tseries)
library(ggplot2)
library(prais) # Prais-Winsten
library(sandwich) # Has NeweyWest function


################################################################################
#
# 1. Reading and cleaning GDP data
#
################################################################################

#1.1 Read in dataset
gdp <- read.csv("Real_GDP_2023.csv")

# Always a good step to get rid of unnecessary columns and rename columns appropriately

head(gdp,10)
tail(gdp,10)
gdp <- gdp[,-c(2,3,4)]
head(gdp)
colnames(gdp) <- c("date", "gdp")
tail(gdp,10)

# Transform date appropriately
gdp$date <- as.Date(as.yearmon(gdp$date, "%Y/%m"))
head(gdp)



# Create a year variable by taking the subset of the date variable
# Code extracts the first 4 characters from the date


# Create a year variable by taking the subset of the date variable
# Code extracts the first 4 characters from the date
gdp$year <- substr(gdp$date, 1, 4)
gdp$year <- as.integer(gdp$year)

gdp$quarter <- substr(gdp$date, 6, 7)
gdp$quarter <- as.integer(gdp$quarter)

gdp$q2 <- 0
gdp$q2[which(gdp$quarter == 2)] <- 1

gdp$q3 <- 0
gdp$q3[which(gdp$quarter == 3)] <- 1

gdp$q4 <- 0
gdp$q4[which(gdp$quarter == 4)] <- 1



################################################################################
#
# Joining a different dataset
#
################################################################################
# Read in dataset
# I've renamed the file from the SARB's website to something more appropriate

# Real Exchange Rate

reer <- read.csv("reer_monthly2.csv")
head(reer)
# Always a good step to get rid of unnecessary columns and rename columns appropriately

reer <- reer[,-c(2,3,4)]
colnames(reer) <- c("date", "reer")
head(reer)

# Transform date appropriately
reer$date <- as.Date(as.yearmon(reer$date, "%Y/%m"))

# Convert the reer data frame to a time series object
# We do this so we can use the aggregate() function
# This function helps us transform monthly to quarterly data

reer.ts <- ts(reer$reer, start = c(1970,1), frequency = 12) 
reer.ts <- aggregate(reer.ts, nfrequency = 4, FUN = mean)

# Since reer only starts in 1970, we create a new GDP data frame which has values from 1970
reer.ts




# Investment

inv <- read.csv("investment.csv")

# Always a good step to get rid of unnecessary columns and rename columns appropriately
head(inv)
inv <- inv[,-c(2,3,4)]
colnames(inv) <- c("year", "Investment")

# Transform date appropriately
inv$year <- as.Date(as.yearmon(inv$year, "%Y/%m"))

gdp_subset <- gdp[which(gdp$year >= 1970),]
inv_subset <- inv[which(gdp$year >= 1970),]


# We create a new column called called reer and we assign it the value from reer.ts
# We need to use the as.vector() function 

gdp_subset$reer <- as.vector(reer.ts)
gdp_subset$investment <- as.vector(inv_subset$Investment)

gdp_subset <- gdp_subset[,-c(5,6,7)]




################################################################################
#
# Descriptive statistics
#
################################################################################

# Let's create a summary statistics table of the reer dataset
# [,-c(1,3)] to remove the first and third column (date and year)

stargazer(gdp_subset[,-c(1,3,4)], type = "text", median = T, flip = T)

# To write to file
stargazer(gdp_subset[,-c(1,3,4)], type = "text", median = T, flip = T, out = "Table1.html")

# Let's create a figure of GDP
# An upward trend clearly visible
plot(x = gdp$year,
     y = gdp$gdp,
     main = "Gross Domestic Product in constant 2010 prices (seasonally adjusted)",
     ylab = "Rand (million)",
     xlab = "",
     type = "l")

# Let's create a figure of the reer
# A clear downward trend - Rand depreciates
# However two strucutral changes around 1985 and again post 2000

plot(x = gdp_subset$year,
     y = gdp_subset$reer,
     main = "Real Effective Exchange Rate (reer)",
     ylab = "REER",
     xlab = "",
     type = "l")


plot(x = gdp_subset$date,
     y = gdp_subset$investment,
     main = "Gross Fixed Capital (Investmet)",
     ylab = "Rand (million)",
     xlab = "",
     type = "l")




# 4. Scatter plot  t showing the relationship between ???GDPt and Yield Spreadt???4


plot( y = gdp_subset$gdp,
      x = gdp_subset$investment,
      main = "Scatter of GDP and Investment",
      ylab = "Gross Domestic Product",
      xlab = "4b. Gross Fixed Capital")
abline(lm(gdp_subset$gdp~gdp_subset$investment,data = gdp_subset),col="red")
par(mfrow=c(1,2))
plot( y = gdp_subset$gdp,
      x = gdp_subset$reer,
      main = "Scatter of GDP and Exchange Rate",
      ylab = "Gross Domestic Product",
      xlab = "4a.Real Effective Exchange Rate (reer)")
abline(lm(gdp_subset$gdp~gdp_subset$reer,data = gdp_subset),col="blue")