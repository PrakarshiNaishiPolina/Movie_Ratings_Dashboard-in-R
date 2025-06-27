# Load the dataset
movies<-read_csv("movies.csv")

# The first few rows
head(movies)

# Top 10 movies
top_movies<-movies[order(-movies$Rating),c("Title","Genre","Rating")]
head(top_movies,10)

# Average Rating by Genre
genre_avg<-aggregate(Rating~Genre,data-movies,FUN=mean)
genre_avg$Rating<-round(genre_avg$Rating,2)
genre_avg <- genre_avg[order(-genre_avg$Rating), ]
print(genre_avg)

# Bar Plot

barplot(genre_avg$Rating,
        names.arg = genre_avg$Genre,
        col = rainbow(length(genre_avg$Genre)),
        main = "Average Rating by Genre",
        ylab = "Average Rating",
        las = 2)

# Histogram

hist(movies$Year,
     breaks = 10,
     col = "skyblue",
     main = "Movies Released by Year",
     xlab = "Year",
     ylab = "Frequency")

# Scatter Plot

plot(movies$Duration, movies$Rating,
     col = "darkgreen",
     pch = 19,
     main = "Duration vs Rating",
     xlab = "Duration (minutes)",
     ylab = "Rating")

# Movies count per genre

genre_count <- table(movies$Genre)
barplot(genre_count,
        col = "orange",
        main = "Number of Movies by Genre",
        ylab = "Count",
        las = 2)
