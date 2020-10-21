
#Installing and loading the libraries
#install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")
library(caTools)

#book rating data
book_rate_data2 <- read.csv(file.choose())
book_rate_data <- book_rate_data2[,4:6]

#metadata about the variable
str(book_rate_data)

#rating distribution
hist(book_rate_data$rating)
head(book_rate_data)
dim(book_rate_data)
book_rate_data$Author <- book_rate_data$Book.Author
 
#the datatype should be realRatingMatrix inorder to build recommendation engine
book_rate_data_matrix <- as(book_rate_data[,], 'realRatingMatrix')

#Popularity based 

book_recomm_model1 <- Recommender(book_rate_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(movie_recomm_model1, movie_rate_data_matrix[413:414], n=5)
as(recommended_items1, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

movie_recomm_model2 <- Recommender(movie_rate_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(movie_recomm_model2, movie_rate_data_matrix[413:414], n=5)
as(recommended_items2, "list")

