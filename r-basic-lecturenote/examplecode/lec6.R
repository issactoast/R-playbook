# Ctrl + Shift + m
# |> %>%
    
x <- c(1, 13, 4, 2, 1)
x_factor <- factor(x)
x_factor

levels(x_factor)

x_factor2 <- factor(x, 
   levels = c(1, 2, 4, 7, 13))
x_factor2

# 계절변수
# 봄, 여름 만 들어있는 계절 factor
# 변수 만들기
x <- c("spring", "summer")
season <- factor(x, levels = c("spring", "summer",
                               "autumn", "winter"))
season[1] <- "summer"
season[1] <- "myseason"
season
paste("school", 1:4)
levels(x_factor) <- 
    paste("school", 1:4)
x_factor    

con_vector <- c("bad", "good", "soso", "good")
x_factor3 <- factor(con_vector, 
    levels = c("bad", "soso", "good"),
    ordered = TRUE)
x_factor3

set.seed(2021)
age <- sample(20:60, 6)
gender <- sample(c("남자", "여자"), 
                 6, replace = TRUE)

tapply(age, gender, mean)
mean(age[-5])


library(palmerpenguins)
penguins |> dim()
penguins |> names()
penguins |> head()
penguins |> View()
penguins$species |> unique()
penguins$bill_length_mm
tapply(penguins$bill_length_mm,
       penguins$species, 
       mean, na.rm = TRUE)

with(penguins,
     tapply(bill_length_mm,
            species,
            mean, na.rm = TRUE)
     )


with(penguins, 
     tapply(bill_length_mm, 
            species, mean,
            na.rm = TRUE))


with(penguins, 
     tapply(bill_length_mm, 
            species, mean,
            na.rm = TRUE))

penguins[penguins == "Chinstrap", ] |> dim()
# dim(penguins[penguins == "Adelie", ])
penguins[penguins == "Chinstrap", ]$island |> 
    unique()

# Q: NA가 뜬 이유는?
with(penguins, 
     tapply(bill_length_mm , 
            list(species, island), 
            mean, na.rm = TRUE))

# 문제: 종별, 섬별, 펭귄 평균 부리길이
aggregate(bill_depth_mm ~ species + island, 
          data = penguins, mean)

aggregate(cbind(bill_depth_mm,
                bill_length_mm) ~ species + island, 
          data = penguins, mean)

by(penguins, penguins$species,
   function(input) { var(input$bill_depth_mm,
                         input$bill_length_mm,
                         na.rm = TRUE) } )


x <- 1:10
y <- 11:20
cor(x, y)

# 3개 데이터 프레임
split(penguins, penguins$species)



result <- split(1:5, x_factor)
result$`school 2`
result[[2]]


# 시각화
penguins$bill_length_mm |> 
    range(na.rm = TRUE)
penguins$bill_depth_mm |> 
    range(na.rm = TRUE)
plot(0, 0,
     type = "n",
     xlim = c(30, 60),
     ylim = c(10, 25),
     main = "펭귄 종별 부리 길이 vs. 깊이",
     xlab = "부리길이 (단위: mm)",
     ylab = "부리깊이 (단위: mm)",
     cex.main = 1.5,
     cex.lab = 1.2, # 축 제목
     cex.axis = 1.2 # 축 숫자
     ) # 밑바닥 흰 도화지
with(penguins,
     points(bill_length_mm,
            bill_depth_mm,
            col = c("red", "blue", "green")[species],
            pch = c(16:18)[species],
            cex = 1.2)
     )
legend(30, 15, 
       legend = c("Adelie", "Chinstrap", "Gentoo"),
       col = c("red", "blue", "green"), 
       pch = 16:18)
text(mean_points[,2:3], "X")

text(mean_points[2,2],
     mean_points[2,3], "gentoo")
text(mean_points[3,2],
     mean_points[3,3], "chinstrap")

mean_points <- 
    aggregate(cbind(bill_length_mm, bill_depth_mm) ~ species, 
              data = penguins,
              mean)
names(mean_points) <- c("species", "x", "y")
mean_points

