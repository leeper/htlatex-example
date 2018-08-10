library("ggplot2")
x <- rnorm(100L)

ggplot(, aes(x = x)) + geom_histogram()
ggsave("figures/figure.png", width = 4, height = 3)
