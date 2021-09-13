mylist <- list(name = "issac",
               id = 30096, 
               order = c(1, 2))
mylist$order

mylist2 <- list("issac",
                30096, 
                c(1, 2))
mylist$name

mode(mylist["name"])
mode(mylist[["name"]])
mylist[["name"]]
mylist2[2]
mylist2[[1:2]]
# 응용질문
# 3번째 구성원의 2번째 원소에 접근
mylist2[[3]][2]
mylist$order[2]

mylist$id <- 52458
mylist$add1 <- NULL
mylist$add2 <- NULL
mylist$add3 <- NULL
mylist$order <- NULL
mylist[3:5] <- list("한낭",
                    "래근",
                    "두천")
mylist[c("add1", "add2", "add3")] <- list("한낭",
                    "래근",
                    "두천")
mylist$order <- c(1, 2)
mylist[[9]][2]
# mylist[9][2] NULL
mylist[9][[1]][2]

mylist$new <- list("hello",
                   c(1, 3, 2))
# 질문 1
# "hello" 만 꺼내오고 싶을때?
mylist$new[[1]]
# 질문 2    
# new 리스트안의 세번째 원소를 꺼내올땐?
mylist$new[[2]][3]
unlist(mylist, recursive = TRUE) # 벡터 (0 단)
unlist(mylist, recursive = FALSE) # 1단 리스트
mylist # 2단 리스트

c(list(1, "2"), 
  list(5, c(1, 3)))
c(list("1", matrix(1:4, ncol = 2)), 
  list(5, c(1, 3)), recursive = TRUE)
# list(1:2, 1:5)
# lapply(list(1:2, 1:5), sum)
lapply(list(1:2, 1:5), sum)
sapply(list(1:2, 1:5), sum)
# apply() 패밀리 - lapply, sapply

set.seed(2021)
sample(10:50, 1)
runif(46)
runif(29)
runif(sample(10:50, 1)) # 0~1 아무 숫자, n 개 뽑아줘
mylist3 <- replicate(100, runif(sample(10:50, 1)))
str(mylist3)

sapply(mylist3, which.max)
which.max(mylist3[[1]])
which.max(mylist3[[2]])
which.max(mylist3[[3]])
...
which.max(mylist3[[100]])
