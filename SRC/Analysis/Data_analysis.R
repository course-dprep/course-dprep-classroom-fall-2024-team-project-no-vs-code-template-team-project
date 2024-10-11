library(readr)
library(dplyr)
library(ggplot2)
library(car)

#Input
cleaned_data <- read_csv("../../output/IMDb_dt.csv")

#Filtering the data
cleaned_data <- cleaned_data %>%
  rename(average_rating = 'The average rating') %>%
  rename(Number_of_episodes = 'Number of episodes') %>%
  filter(!is.na(Number_of_episodes), !is.na(average_rating))

#Summary of descriptive statistics on average ratings
Descriptive_stats <- cleaned_data %>% 
  summarize(
  mean_average_rating = mean(average_rating, na.rm = TRUE),
  median_rating = median(average_rating, na.rm = TRUE),
  min_rating = min(average_rating, na.rm = TRUE),
  max_rating = max(average_rating, na.rm = TRUE),
  num_episodes = n()
)

print(Descriptive_stats)


#Basic model without control variables
basic_model <- lm(average_rating ~ Number_of_episodes, data = cleaned_data)
summary(basic_model)

#Plot of the basic model without control variables
ggplot(cleaned_data, aes(x = Number_of_episodes, y = average_rating)) +
  geom_point() + geom_smooth(method = "lm") + labs(
    title = "Regression of Average Ratings over The number of episodes",
    x = "Number of episodes",
    y = "Average Rating"
  )

#Regression analysis output: 
#Coefficient for Number of episodes: -0.6819 x 10^-5
#T-value for Number of episodes: -24.62
#P-value for Number of episodes: <2.2 x 10^-16
#R-squared: 0.0008274

##In our basic model without any control variables, we can see that the number of episodes have a slightly negative effect on the average IMDb rating.
##With a P-value smaller than significance level of 5%, we can conclude that the number of episodes has a negative effect.
##However this model is without any control variables, so we need to expand our model.

#Main model with control variables:
#popularity: "Amount of votes are over 1000
#runtime: "Runtime in minutes is more than 50"
#new_vs_old: "The start year is later than 2015"
#episode_quantity: "Number of episodes is more than 25"

main_model <- lm(average_rating ~ Number_of_episodes + popularity + runtime + new_vs_old + episode_quantity , data = cleaned_data)
summary(main_model)

#Regression analysis output:
#Coefficient for Number of episodes: -1.183 x 10^-6
#T-value for Number of episodes: -0.355
#P-value for Number of episodes: 0.722
#R-squared 0.0376

##In our main model with control variables we can see that the coefficient of Number of episodes is negative.
#However this is not significant anymore, as the P-value for this variable is 0.772 which is larger than 0.05 
##If we look at our control variables we see that they all are significant: 
##Popularity has significant positive effect on the average rating
##A short runtime has a significant negative effect on the average rating
##Old has a significant negative effect on the average rating
##Many episodes has a negative effect on the average rating



#Correlation matrix of the predictive variables in our main model 
main_model <- lm(average_rating ~ Number_of_episodes + popularity + runtime + new_vs_old + episode_quantity , data = cleaned_data)
cor(model.matrix(main_model)[, -1])

#The correlations between our predictive variables are low and show no sign of correlation

#Multicollinearity
main_model <- lm(average_rating ~ Number_of_episodes + popularity + runtime + new_vs_old + episode_quantity , data = cleaned_data)
vif_values <- vif(main_model)
print(vif_values)

#As all variables show degree of multicollinearity close to 1 which means there is hardly any correlation between predictor and other variables

