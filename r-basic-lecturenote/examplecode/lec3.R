y <- matrix(1:6, nrow = 3)
y

y[2, 2]
x <- matrix(1:10, ncol = 2,
            byrow = TRUE)
x[c(1, 2, 5), 1]

x[x[, 2] < 7, 1]
# 1열 5보다 크거나 같은 조건
# 해당하는 2열 원소 가져오기!
x[x[, 1] >= 5, 2]

library(raster)
raster::as.raster()

set.seed(2021)
z <- matrix(runif(9, min = 0, max = 1),
            nrow = 3, ncol = 3)

plot(raster::as.raster(z),
     interpolate = FALSE)

data_url <- "https://raw.githubusercontent.com/issactoast/R-playbook/main/lecturenote/data/mat.rds"
download.file(data_url, 
              "mat.rds")
img_mat <- readRDS("mat.rds")
file.remove("mat.rds")

dim(img_mat)
head(img_mat)
min(img_mat)
max(img_mat)
plot(as.raster(img_mat/255))

img_mat <- img_mat/255
plot(as.raster(img_mat))
dim(img_mat)
plot(as.raster(img_mat[1:44,]))
plot(as.raster(img_mat[, 1:25]))
# 색반전은 어떻게 시킬수 있을까?
plot(as.raster(img_mat))
plot(as.raster(1 - img_mat))

z
class(z)
attributes(z)
dim(z)
x <- 1:10
x
class(x)
attributes(x)
dim(x)
x <- matrix(1:10 * 2, ncol = 2)
x
t(x)
plot(as.raster(t(img_mat)))
y <- matrix(1:4, nrow = 2)
y
x %*% y
y
solve(y)

y %*% solve(y)

no_inverse <- matrix(c(1, 2, 1, 2), nrow = 2)
solve(no_inverse)

colnames(y) <- c("col1", "col2") 
y[, "col2"]
y[, 2]

mat1 <- matrix(1:6, nrow = 2)
mat2 <- matrix(7:12, nrow = 2)
my_array <- array(
    data = c(mat1, mat2), 
    dim = c(2, 3, 2)
)
my_array[ , , 2]
my_array[1:2, 1:2, 1]

my_array[, -3, 1]

aperm(my_array, perm = c(2,1,3))
1번째 차원 (행렬 가로행), 
2번째 차원 (행렬 세로열), 
3번째 차원 (레이어)

c(2, 1, 3)
# 2 by 2 행렬을 3개 쌓아놓은 배열
aperm(my_array, perm = c(3, 1, 2))

library(png)
img_url <- "https://raw.githubusercontent.com/issactoast/R-playbook/main/lecturenote/img/jelly.png"
download.file(img_url, "jelly.png", 
              mode="wb")
jelly <- readPNG("jelly.png")
file.remove("jelly.png")
dim(jelly)
jelly[1:6, 1:6, 1]
# 1번째 - 빨강색 관련 정보 (0~255)
# 2번쨰 - 녹색 관련 정보 (0~255)
# 3번째 - 파란색 관련 정보 (0~255)
# 4번째 - 투명도 (0~1)

plot(as.raster(jelly))
jelly[1, 1, ]
