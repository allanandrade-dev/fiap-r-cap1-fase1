library("httr")
library("jsonlite")

base <- "https://api.open-meteo.com/v1/forecast?"
latitude <- 52.52
longitude <- 13.41


call1 <- paste(base, "latitude=", latitude, "&longitude=", longitude, "&current=temperature_2m", sep="")
get_temperatura <- GET(call1, type = "basic")
get_temperatura_text <- content(get_temperatura, "text")
get_temperatura_json <- fromJSON(get_temperatura_text, flatten = TRUE)
get_temperatura_df <- as.data.frame(get_temperatura_json)
print(get_temperatura_df)