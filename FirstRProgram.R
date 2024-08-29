my_data<-read.csv("./data/climate_anxiety_All.csv")

#library(readxl)
#install.packages("readxl")

#my_data<-read_excel("climate_anxiety_All.csv")

library(dplyr)

filtered_data <- my_data %>% 
  select(D1,D2,country,Q1)


names(filtered_data)[names(filtered_data)=='D1']<- 'age'
names(filtered_data)[names(filtered_data)=='D2']<- 'gender'

bar_chart_data<-filtered_data %>%
  group_by(country) %>%
  summarize(extremely_worried = sum(Q1 == 'extremely'))

library(ggplot2)

#basic
#ggplot(bar_chart_data, aes(x=country, y=extremely_worried)) +
 # geom_bar(stat = "identity") +
  #labs(x="Country", y="count of extremely anxious youth", 
     #  title="Extremely anxious youth country-wise")

ggplot(bar_chart_data, aes(x=reorder(country,extremely_worried), y=extremely_worried)) +
  geom_bar(stat = "identity") +
  labs(x="Country", y="count of extremely anxious youth", 
       title="Extremely anxious youth country-wise")

stacked_bar_data <-filtered_data %>%
  group_by(country, Q1) %>%
  summarize(count=n())


ggplot(stacked_bar_data, aes(x=country, y=count, fill=Q1)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x="Country", y="count of extremely anxious youth", 
   title="Extremely anxious youth country-wise")




