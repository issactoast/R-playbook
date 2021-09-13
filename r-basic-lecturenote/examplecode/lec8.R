hometown <- readLines("./hometown.txt",
                      encoding = "UTF-8")
hometown
class(hometown)
length(hometown)

grep("아버지", hometown)
index <- grep("고향", hometown)
index
# 고향이라는 단어가 몇번 나왔는지를 세기
# 위해서 grep 함수를 사용할수 있을까요?
hometown[1]
nchar(hometown[1])

# 문제, 백석 시인의 고향 시에서 
# 가장 길이간 긴 행은 어디일까요?
nchar(hometown)
long_line <- which.max(nchar(hometown))
hometown[long_line]

paste("issac", "lee")
paste0("issac", "lee")
paste(1:5, "번째")
paste0(1:10, c("st", "nd", "rd", 
              rep("th", 7)))

paste("1st", "2nd", "3rd", sep = ", ")
# 1) sep
paste(hometown[1],
      hometown[2],
      hometown[3],
      hometown[4],
      hometown[5],
      hometown[6], sep = ", ")
# 2) collapse
paste(hometown[1:6], collapse=", ")


substr(문자열, 시작점, 끝점)
hometown[6]
substr(hometown[6], 5, 10)
# 질문, 마지막 4글자 가져오기?
n <- nchar(hometown[6])
substr(hometown[6], n-3, n)


# 문자열 나누기
result <- strsplit(hometown[3],
                   split = " ")
result
# "앓아" 어떻게 빼내올 것인가? 
result[[1]][4]

gsub(" ", "", hometown[6])

result <- gsub("\\(如來\\)", "", hometown[6])
result <- gsub("\\(關公\\)", "", result)
result

1:100 |> sum()


mat_a <- matrix(1:10, ncol =2)
# 1 |> apply(mat_a, , sum) 이렇게는 안됨!
1 |> {\(x) apply(mat_a, x, sum)}()


hometown[6] |> 
    {\(x) gsub("\\(如來\\)", "", x)}() |> 
    {\(x) gsub("\\(關公\\)", "", x)}()
    

gsub("\\.", "", "statistics.playbook")
gsub("\\?", "", "statistics?playbook")
gsub("\\!", "", "statistics!playbook")

gsub("\\d", "", "stat.123")
# 문제 123 남기고 싶은 경우?
gsub("\\D", "", "stat.123")
gsub("\\D", "", "stat슬기로운.123")

gsub("\\s", "", "stat. 123")

# . 모든 문자를 의미
gsub(".", "", "stat슬기로운.123")

random_string <- c("123-123",
                   "123.123",
                   "123?123",
                   "1234?123",
                   "statistics.playbook",
                   "r-programming")
random_string

# 어떤 의미?
grep("\\d\\d\\d.\\d\\d\\d", random_string)
random_string[1:2]

grep("\\.", random_string)
grep("\\d\\d\\d[-.?]\\d\\d\\d", random_string)

# 매칭 갯수 설정
test_string <- c("슬기로운.통계생활", 
                 "슬기로운통계*PlayBOOK")
m1 <- regexpr("슬\\w\\w", test_string)
regmatches(test_string, m1)
m1 <- regexpr("슬\\w{2}", test_string)
regmatches(test_string, m1)
m1 <- regexpr("슬\\w{4}", test_string)
regmatches(test_string, m1)
m1 <- regexpr("슬\\w*", test_string)
regmatches(test_string, m1)

ex_str <- c("Mr. 슬통", "Mr 마통",
            "Ms. Lee", "Ms.Lee",
            "Mr. R")
# m1 <- regexpr("Mr\\.", ex_str)
# m1
# regmatches(ex_str, m1)
# grep("Mr\\.", ex_str)
# grep("Mr\\.?", ex_str)
# grep("M(r|s)\\.?", ex_str)
# grep("M(r|s)\\.?\\s", ex_str)
# grep("M(r|s)\\.?\\s[A-Z]", ex_str)
# grep("M(r|s)\\.?\\s[가-힣]", ex_str)
ex_str <- c("Mr. 슬통", "Mr 마통이",
            "Ms. Lee", "Ms.Lee",
            "Mr. R")
m <- regexpr("M(r|s)\\.?\\s[가-힣]+", 
             ex_str)
m <- regexpr("M(r|s)\\.?\\s[가-힣]{2,3}", 
             ex_str)
regmatches(ex_str, m)


hometown[1]
gsub("\\([^가-힣]\\w*\\)", "", hometown)

# \n 줄바꿈을 뜻함 (엔터)
total <- paste(hometown, collapse = "\n")
total <- gsub("\\([^가-힣]\\w*\\)", "", 
              total)
file_con <- file("./output.txt",
                 encoding = "UTF-8")
writeLines(total, file_con)
close(file_con)



