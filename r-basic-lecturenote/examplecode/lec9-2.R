library(rvest)

url <- "https://www.theissaclee.com/ko/courses/rstat101/"
web_page <- read_html(url)
print(web_page)

#목차 내용 가져오기
chapter_name <- web_page |>
    html_elements(".docs-sidenav a") |> 
    html_text()
chapter_name

head(chapter_name)


url <- "https://www.transfermarkt.com/spieler-statistik/wertvollstespieler/marktwertetop"
web_page <- read_html(url)
print(web_page)

# 문제 - 사이트의 선수 이름 불러오기
player_name <- web_page |>
    html_elements("#yw1 .spielprofil_tooltip") |> 
    html_text()
player_name

player_name
head(player_name)

# 문제 - 선수 나이 정보 가져오기
player_age <- web_page |>
    html_elements("#yw1 .zentriert:nth-child(3)") |> 
    html_text()
player_age <- as.integer(player_age[-1])

player_age

# 클럽 정보 긁어오기
player_club <- web_page |>
    html_elements("#yw1 .vereinprofil_tooltip") |> 
    html_children() |> 
    html_attr("alt")
player_club

# 문제: 나라 정보 가져오기
player_country <- web_page |>
    html_elements(".flaggenrahmen") |> 
    html_attr("title")
player_country

# 이렇게 하면 안되는 이유?
data.frame(name = player_name,
           age = player_age,
           club = player_club,
           national = player_country[-c(7, 13, 22)])


national2 <- web_page |>
    html_elements("#yw1 .zentriert:nth-child(4)")
national2 <- national2[-1]
html_children(national2[6]) |> length()

print(national2[6], width = 1000)

<td > <img> <br> <img> </td>

count_dup <- sapply(national2,
                        \(x) length(html_children(x)))
which(count_dup > 1)

result <- sapply(national2, 
                 \(x) html_attr(html_children(x)[1],
                                "alt"))
result
head(result)

mydb <- data.frame(name = player_name,
           age = player_age,
           club = player_club,
           national = result,
           value = player_value)
mydb


write.csv(mydb, 
          file = "./soccer.csv",
          row.names = FALSE,
          fileEncoding = "UTF-8")

# install.packages("stringr")
library("stringr")

player_value <- web_page |>
    html_elements("#yw1 b") |> 
    html_text() |> 
    str_extract("\\d+[.]\\d\\d") |> 
    as.numeric()
player_value

base_url <- "https://www.transfermarkt.com/spieler-statistik/wertvollstespieler/marktwertetop/plus/ajax/yw1/0//page/"
url <- paste0(base_url, 1:3)
url

data_scrap <- function(url) {
    Sys.sleep(2)
    web_page <- read_html(url)
    
    player_name <- web_page |>
        html_elements("#yw1 .spielprofil_tooltip") |> 
        html_text()
    player_name
    
}

result <- lapply(url, data_scrap)
player_name <- unlist(result)
player_name
