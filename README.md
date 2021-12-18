# Inverse_problem_Titech
This is the assignment repo of Inverse problem in tokyo tech. 2021    

### A Work of Liu Zihua(M1), and Yuan Yuchen(M1). Tokyo Tech, System control and enginnering master coursel

逆問題とデータ同化  
Inverse Problems and Data Assimilation   

This is the a wonderful lecture given by prof.天谷 in Tokyo Tech.   

### Assignment:  
* **Introduction**  

Inverse problems are known as the process of Finding out unknown information from external or indirect measurement through the model of the system. In this report, we mainly focus on the heat transfer inverse problem. In industrial production process, iron ore is chemically reacted with the fuels(coal for example) under high temperature and pressure with a molten at 1500℃. With the aim of maintain stable operation and better output, a good control of inside heat and pressure is very necessary. However,  because the internal temperature is quite high may reach over 2000℃, using normal direct measurement is impossible.   

One potential solution is by using inverse problems and data assimilation to solve this kind of issue[1]. The heat flux flowing into the inner surface of the refractory of molten iron can be calculated using 1D heat transfer model(shown at Fig1.1-a) and time series data of the refractory temperature(shown at Fig1.1-b) measured by the thermocouple. By using this model and data, it is possible to observe the changes in the heat flux which is difficult to measure only by checking the value measured by the thermometer. And this makes it possible to diagnose internal blast furnace phenomena. 

![img](https://www.mdpi.com/processes/processes-08-01335/article_deploy/html/images/processes-08-01335-g001.png)    

* **What I DO**   

In this repo, we dealt with the inverse problem of estimating heat flux from the temperature measurements at two points using 1D heat transfer model.
We firstly use the FEM to build a differential model with the knowledge of the observed temperature and the heat flux. Then we discretized the data and obtained the system matrix A, successfully turning the heat estimation problem into an inverse problem.
We firstly directly use LSM to solving the problems, while a poor performance was obtained for the input noise influence. Then we use TSVD and TR method for regularization to get better performance. And in order to get the best regularization term, we apply DP in TSVD for better truncation K and Generalized Cross-Validation is used for get the optimal α in TR method for better estimation.  

### YOU can find all the matlab code here for inverse problem learning.
