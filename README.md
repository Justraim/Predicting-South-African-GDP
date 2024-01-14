# [Under Construction]Predicting South African GDP using a Autoregressive Distributed Lag Stationarity (ARDL) Model
https://unsplash.com/photos/blue-and-red-cargo-ship-on-dock-during-daytime-SInhLTQouEk

***
The data on GDP (Gross Domestic Product) is regarded as the important index for assessing national economic development and for judging the operating status of macroeconomics. Forecasting future economic outcomes is a vital component of the decision-making process in central banks for all countries. Therefore, accurate forecasting of GDP is an interesting topic for researchers and policy makers in the field of business in general and economics to frame proper economic development strategies, economic policies, and to allocate funds according to diverse priorities of the government. 

## 1. Project Objective
We will use the statistical techniques in time series analysis to estimate and predict the South African GDP. 
With this data, we embarked on a journey of data analysis, pre-processing, model selection, and evaluation

## 2. The Dataset and Libraries
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



## 3. Data Visualisation
The next step is to visualize the data. We can use various types of plots to visualize the patterns and relationships in the data. Here, we will use the matplotlib and seaborn libraries to create plots.

#### Figure 1: GDP over time
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/8b3e1b15-fb28-446a-b005-ee7da219805a)

#### Figure 2: Investment over time
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/633271c6-d39e-4d35-bb91-dff62e4ffc77)

#### Figure 3: The Real Effective Exchange Rate of the Rand over time
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/bda823d6-9376-4438-95e9-122c290b57fe)

#### Figure 4: Correlation between GDP and Investment 
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/5cf6f393-9a18-4675-9a10-6f9dd3e24785)

#### Figure 5: Correlation between GDP and Real Effective Exchange Rate
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/c95444e8-315d-4365-89e8-8f9ecd8589ee)


#### Table 1: Descriptive Summary Statistics Table
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/f2a3fade-4808-4e85-9fd9-4cb2e92bc221)


## 4. Diagnostics

The first step of empirical research is to check for stationarity and if there’s any unit root process on the variables. Otherwise, the regression might be spurious
#### 4.1 Diagnostics for GDP

#### 4.2 Diagnostics for Investment


#### 4.3 Diagnostics for Real Effective Exchange Rate


## 5. Model Specifications
#### Model 1: AR(4)


#### Model 2: ARDL(2,2)


#### Model 3: ARDL(2,2,2)

## 6. Forecasting and Analysis


#### Model 1: AR(1) forecast


##### Calculating the Forecast Error (RMSE and MAE) for Model13



#### Model 2: ARDL(2,2) forecast

##### Calculating the Forecast Error (RMSE and MAE) for Model 2


#### Model 3: ARDL(2,2,2) forecast

##### Calculating the Forecast Error (RMSE and MAE) for Model 3
