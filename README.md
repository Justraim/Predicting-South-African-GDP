# [Under Construction] Predicting South African GDP using a Autoregressive Distributed Lag Stationarity (ARDL) Model

![dominik-luckmann-SInhLTQouEk-unsplash](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/7daae3cc-9afd-473e-901d-87726562495b)


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
#### GDP Variable
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/8a565e59-dcfa-4025-960b-3d48666b16f4)

#### Investment
 ![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/875e94c3-3f39-4e04-90b0-d4ffe5c7cda8)


#### Real Effective Exchange Rate
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/e92c1f52-edd1-4473-ab9e-33213d5bb75f)


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

* We'll create a new dataframe without 2020 - 2022
* This is the sample we'll estimate the model on
* We have to do this twice
* Once for GDP only (1960 - 2020)
* Again for GDP reer (1970 - 2020)

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/ad35125f-26a6-45f8-81d0-15cd6c34f763)

*  R^2 is very high - 95% of variation in GDP can be explained by time
*  Time trend will be a problem
*  Does detrended GDP look any better?
##### Detrending the GDP variable
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/f9b59072-675f-4295-bccc-1898f3753afe)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/76bff8d2-1f1e-4704-83d6-2df0117cd5cb)
* This seems to have got rid of the time trend
* However non-stationarity looks to be a problem

#####  To take care of non-stationarity, let's do two transformations
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/5fcd38b7-f1be-4b85-817b-8792dc41e5e0)

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/765d1b75-a3ac-4593-844a-65f6c6000812)


#### 4.2 Diagnostics for Investment

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/cad8ebb8-7682-469e-a29c-b382e846cd88)

* R^2 is very high - 95% of variation in GDP can be explained by time
* Time trend will be a problem
* Does detrended GDP look any better?
##### Detrending the GDP variable
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/ab922096-ba75-4064-820f-ebb4ee0d88d3)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/1195d488-0f68-4a0e-83a7-d59e35d38403)

* This seems to have got rid of the time trend
* However non-stationarity looks to be a problem
##### To take care of non-stationarity, let's do two transformations
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/c3193fe6-53ce-4d56-a39e-4d77790b509d)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/d9911514-f34c-4248-8975-a14f0afc029b)

#### 4.3 Diagnostics for Real Effective Exchange Rate
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/bbef981a-2132-44d9-8a2a-4cdc98ce62be)

* R^2 is very high - 83% of variation in GDP can be explained by time
* Time trend will be a problem
* Does detrended reer look any better?
##### Detrending the GDP variable
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/e6a361df-ace6-4c5d-8146-92556d09ca5b)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/2727ae4e-ff32-447b-a482-34dc59eef89d)
* This seems to have got rid of the downward time trend for half of the data
* But there is now a clear upward trend in half of the data!
* In addition to there still being a time trend, non-stationarity will also be a problem

##### To take care of non-stationarity, let's do two transformations
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/08dea092-4a00-40ef-be3f-468de760892a)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/64211de5-fab0-43a8-9028-7303c5e50036)


## 5. Model Specifications
I prefer using log differences - gives a % change interpretation
#### Model 1: AR(4)

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/427265fc-4cdc-442b-a068-933acf3d1670)



#### Model 2: ARDL(2,2)

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/4a9f7cc4-e8b6-4af3-9be1-e10cd81bc256)


#### Model 3: ARDL(2,2,2)

![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/e1736361-4954-45c9-8b12-e05d853f9e5b)

#### All the Models
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/2810c408-9fc3-4e65-8533-b683ee8e552c)
![image](https://github.com/Justraim/Predicting-South-African-GDP/assets/42674004/55a9ee2a-6e78-43c6-8aeb-f8ca74c16d77)


## 6. Forecasting and Analysis


#### Model 1: AR(1) forecast


##### Calculating the Forecast Error (RMSE and MAE) for Model13



#### Model 2: ARDL(2,2) forecast

##### Calculating the Forecast Error (RMSE and MAE) for Model 2


#### Model 3: ARDL(2,2,2) forecast

##### Calculating the Forecast Error (RMSE and MAE) for Model 3
