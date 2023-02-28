library(ggplot2)
library(ggthemes)

dat <- read.table('stat.txt', stringsAsFactors = FALSE, col.names = c('dist', 'ratio', 'change'))

p <- ggplot(dat, aes(x = dist, y = ratio, color = change, group = change)) + 
     geom_line() + geom_point() +
     scale_y_continuous(limits = c(0, 5), breaks = seq(0, 5, 1)) + 
     theme_few()
ggsave(p, file = 'satb1_genes_dist_stat.pdf')
