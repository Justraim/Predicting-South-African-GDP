# [Under Construction]Predicting South African GDP using a Autoregressive Distributed Lag Stationarity (ARDL) Model

***
The data on GDP (Gross Domestic Product) is regarded as the important index for assessing national economic development and for judging the operating status of macroeconomics. Forecasting future economic outcomes is a vital component of the decision-making process in central banks for all countries. Therefore, accurate forecasting of GDP is an interesting topic for researchers and policy makers in the field of business in general and economics to frame proper economic development strategies, economic policies, and to allocate funds according to diverse priorities of the government. 

## Project Objective
We will use the statistical techniques in time series analysis to estimate and predict the South African GDP. 
With this data, we embarked on a journey of data analysis, pre-processing, model selection, and evaluation

## The Dataset and Libraries
### Dataset
Our main data set consists of quarterly annualised real GDP, quarterly annualised investment, and the real effective exchange rate. This data is obtained from the South African Reserve Bank (SARB) Quarterly Bulletin database from first quarter of 1970 to fourth quarter of 2021. The real GDP series is constructed using real-time data on GDP obtained from the South African Reserve Bank (SARB). 

### Imports/Libraries
To begin our project, we import these libraries: 

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/cdb46a86-644c-4fbb-94e8-4d66491c83ef)



* stargazer to export the tables in html format
* lmtest to conduct DW Test,  
* readxl for making scientific computations, 
* tseries for loading and modifying datasets, and 
* ggplots2 for plotting graphs.
* prais
* sandwich


After making the necessary imports, we load data on Tata Global Beverage’s past stock prices. From the data, we select the values of the first and second columns (“Open” and “High” respectively) as our training dataset. The “Open” column represents the opening price for shares that day and the “High” column represents the highest price shares reached that day.

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/8a565e59-dcfa-4025-960b-3d48666b16f4)




![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/7aeb4197-622e-4900-a6f3-c71e9ec60c77)

