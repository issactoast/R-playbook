library(rvest)

url <- "https://movie.naver.com/movie/sdb/rank/rmovie.naver?sel=pnt&date=20210829"

web_page <- read_html(url)

movie_name <- web_page |>
    html_elements(".tit5 a") |>
    html_text()
movie_name

movie_score <- web_page |>
    html_elements(".point") |>
    html_text() |> 
    as.numeric()
movie_score

movie_url <- web_page |> 
    html_elements(".tit5 a") |> 
    html_attr("href") |> 
    {\(x) paste0("https://movie.naver.com", x)}()
movie_url[1]

get_release_year <- function(url){
    web_page <- read_html(url)    
    
    movie_info <- web_page |> 
        html_elements(".h_movie2") |> 
        html_text()
    movie_info <- movie_info[1]
    n <- nchar(movie_info)
    date <- substr(movie_info, n-3, n) |> as.integer()
    date
}

movie_info <- sapply(movie_url, get_release_year)
names(movie_info) <- NULL
movie_info

movie_db <- data.frame(
    name = movie_name,
    year = movie_info,
    score = movie_score
)

write.csv()
