
#Installing and loading the libraries
#install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")
library(caTools)

#book rating data
book_rate_data2 <- read.csv(file.choose())
book_rate_data <- book_rate_data2[,c(2,4,6)]
book_rate_data1 <- book_rate_data2[,c(2,5,6)]
#metadata about the variable
str(book_rate_data)
str(book_rate_data1)
#rating distribution
hist(book_rate_data$rating)
hist(book_rate_data1$rating)
dim(book_rate_data)
book_rate_data$Author <- book_rate_data$Book.Author
 
#the datatype should be realRatingMatrix inorder to build recommendation engine
book_rate_data_matrix <- as(book_rate_data, 'realRatingMatrix')
book_rate_data_matrix1 <- as(book_rate_data1, 'realRatingMatrix')
#Popularity based 

book_recomm_model1 <- Recommender(book_rate_data_matrix, method="POPULAR")
book_recomm_model3 <- Recommender(book_rate_data_matrix1, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(book_recomm_model1, book_rate_data_matrix[413:414], n=5)
as(recommended_items1, "list")

recommended_items2 <- predict(book_recomm_model3, book_rate_data_matrix[413:414], n=5)
as(recommended_items2, "list")



## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(book_rate_data_matrix, method="UBCF")
book_recomm_model4 <- Recommender(book_rate_data_matrix1, method="UBCF")


#Predictions for two users 
book_items2 <- predict(book_recomm_model2, book_rate_data_matrix[413:414], n=5)
as(book_items2, "list")


book_items3 <- predict(book_recomm_model4, book_rate_data_matrix[413:414], n=5)
as(book_items2, "list")

