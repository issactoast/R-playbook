library(rvest)
library(httr)

url <- "https://www.transfermarkt.com/spieler-statistik/wertvollstespieler/marktwertetop"
url <- "https://www.transfermarkt.com/spieler-statistik/wertvollstespieler/marktwertetop?page=2"

web_page <- read_html(url)

player_name <- web_page |>
    html_nodes("#yw1 .spielprofil_tooltip") |>
    html_text()
player_name


national <- web_page |>
    html_nodes(".flaggenrahmen") |>
    html_attr("title")
national
print(national[1], width = 1000)


url <- "https://www.chosun.com/national/labor/2021/07/17/3HMIMCHXHZCJBCU6FIKGUP7LCE/"

web_page <- read_html(url)

web_page <- html_children(web_page)
web_page <- html_children(web_page)
print(web_page[56], width = 1000)
write(web_page[56] |> html_text(),
      "test.txt")
web_page[56] 

print(web_page[56], width = 1000) 
player_name <- web_page |>
    html_nodes(".nav__bar-center-link") |>
    html_text()
player_name

library(RSelenium)
pJS <- wdman::phantomjs(port = 4567L)
remDr <- remoteDriver(port = 4567L, browserName = 'phantonjs')
remDr$open()
remDr$navigate("http://www.google.com")
remDr$screenshot(display = T)
webElem <- remDr$findElement("css selector", "[name = 'q']")
webElem$sendKeysToElement(list("R Cran"))
webElem$sendKeysToElement(list(key = "enter"))
remDr$screenshot(display = T)

webElem <- remDr$findElements(using = "css", "h3.r")
resHeaders <- lapply(webElem, \(x) x$getElementText()) |> unlist()


remDr$mouseMoveToLocation(webElement = webElem[[1]])
remDr$click(1)
remDr$screenshot(display = T)
remDr$getCurrentUrl()
remDr$close()
pJS$stop()
