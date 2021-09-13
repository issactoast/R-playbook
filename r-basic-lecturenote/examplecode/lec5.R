matrix(c(as.character(c(1:5)),
         6:10),
       ncol = 2)

data.frame(col1 = c("one", "two", 
                    "three", "four",
                    "five"),
           col2 = c(6:10))

name <- c("issac", "bomi")
birthmonth <- c(5, 4)
my_df <- data.frame(name, 
                    birthmonth)
dim(my_df)
my_df[2, 2]
url <- "https://www.theissaclee.com/ko/courses/rstat101/examscore.csv"
mydata <- read.csv(url, header = TRUE)
mydata[1:4, 2]
class(mydata[1:4, 2])
mydata[1:4, 2, drop = FALSE]
class(mydata[1:4, 2, drop = FALSE])
# midterm  30 점 이하인 
# 아이들은 어떻게 고를까요?
# mydata[행, 열]
mydata$midterm <= 30
mydata[mydata$midterm <= 30, ]
mydata[1:5, ]
which(mydata$midterm <= 30)

# NA 
mydata[1, 2] <- NA
complete.cases(mydata$gender) 
complete.cases(mydata) 
mydata[complete.cases(mydata), ]
mydata$total <- 
    mydata$midterm + 
    mydata$final
mydata[1:3, 4:5]
mydata$total
mydata$gender <- NULL
mydata$add <- NA 
mydata <- mydata[, 1:4]
mydata <- mydata[, -5]
mydata

mydata <- cbind(mydata, 
                mydata$total/2)
mydata
names(mydata)[5] <- "average"
subset(mydata, midterm <= 30)

# subset 사용
# 중간고사 30 ~ 60 점 사이
# 학생들을 골라보세요!
# & and, 
# | or
subset(mydata, midterm > 30 & midterm < 60)
sample(1:30, 5)
c(rep("Pass", 3), rep("Fail", 2))
mydata2 <- data.frame(id = sample(1:30, 5),
                      result = c(rep("Pass", 3), rep("Fail", 2)))
mydata2
mydata
merge(mydata, mydata2,
      by.x = "student_id",
      by.y = "id",
      all.x = TRUE)
library(palmerpenguins)
penguins
names(penguins)
penguins <- data.frame(penguins)
head(penguins)
unique(penguins$species)

# 문제 아델리 펭귄 수컷 평균 몸무게는?

subset(penguins, species == "Adelie")
# penguins[penguins$species == "Adelie", ]
index <- penguins$species == "Adelie" & penguins$sex == "male"
mean(penguins[index, 6], na.rm = TRUE)

mean(subset(penguins, species == "Adelie" & 
           sex == "male")$body_mass_g)
df <- subset(penguins, species == "Adelie" & 
                 sex == "male")
mean(df$body_mass_g)

# 파이프 연산자 |>
subset(penguins, 
       species == "Adelie" & 
       sex == "male")$body_mass_g |> mean()

penguins[order(penguins$body_mass_g),] 
order(c(1, 30, 20))

aggregate(cbind(body_mass_g, bill_length_mm) ~ 
            species + sex,
          penguins, mean)

# 종별 성별 몸무게 평균은?
"+"

# 종별 성별 몸무게 평균,
# 부리 길이 평균은?
cbind(body_mass_g, bill_length_mm) ~ 
  species + sex

# 종별 성별 모든 
# 수치 데이터 평균은?
aggregate(. ~ species + sex,
          penguins, mean)

