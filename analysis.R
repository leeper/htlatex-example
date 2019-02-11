library("ggplot2")
x <- rnorm(100L)
p <- ggplot(, aes(x = x)) + geom_histogram()
ggsave("figure.png", p, width = 4, height = 3)
