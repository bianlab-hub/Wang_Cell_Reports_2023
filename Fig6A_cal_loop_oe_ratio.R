## calculate oe ratio
shctrl_1 <- read.table('shctrl_1_loops_oe_KR_10kb.txt', stringsAsFactors = FALSE)[, 7:13]
colnames(shctrl_1) <- c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2', 'shctrl_1_oe')

shctrl_2 <- read.table('shctrl_2_merged_loops_oe_KR_10kb.txt', stringsAsFactors = FALSE)[, 7:13]
colnames(shctrl_2) <- c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2', 'shctrl_2_oe')

shsatb1_1 <- read.table('shsatb1_1_merged_loops_oe_KR_10kb.txt', stringsAsFactors = FALSE)[, 7:13]
colnames(shsatb1_1) <- c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2', 'shsatb1_1_oe')

shsatb1_2 <- read.table('shsatb1_2_merged_loops_oe_KR_10kb.txt', stringsAsFactors = FALSE)[, 7:13]
colnames(shsatb1_2) <- c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2', 'shsatb1_2_oe')

shctrl <- merge(shctrl_1, shctrl_2, by = c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2'))
shsatb1 <- merge(shsatb1_1, shsatb1_2, by = c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2'))
dat <- merge(shctrl, shsatb1, by = c('chr_1', 'left_1', 'left_2', 'chr_2', 'right_1', 'right_2'))  # 5403

dat$ratio <- (dat$shsatb1_1_oe + dat$shsatb1_2_oe) / (dat$shctrl_1_oe + dat$shctrl_2_oe)

write.table(dat, "shctrl_shsatb1_oe.txt", sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)


## plot heatmap
library(pheatmap)
# up-regulated
up <- read.table('up_loops.txt', stringsAsFactors = FALSE)[, 7:10]
colnames(up) <- c('shctrl_1', 'shctrl_2', 'shsatb1_1', 'shsatb1_2')
pdf('up_loops.pdf')
pheatmap(up, cluster_row = FALSE, cluster_cols = FALSE,
         scale = 'row', show_rownames = FALSE, breaks = seq(-1.5, 1.5, 0.03),
         color = colorRampPalette(c('blue', 'white', 'red'))(100))
dev.off()

# down-regulated
down <- read.table('down_loops.txt', stringsAsFactors = FALSE)[, 7:10]
colnames(down) <- c('shctrl_1', 'shctrl_2', 'shsatb1_1', 'shsatb1_2')
pdf('down_loops.pdf')
pheatmap(down, cluster_row = FALSE, cluster_cols = FALSE,
         scale = 'row', show_rownames = FALSE, breaks = seq(-1.5, 1.5, 0.03),
         color = colorRampPalette(c('blue', 'white', 'red'))(100))
dev.off()

# unchanged
unchanged <- read.table('unchanged_loops.txt', stringsAsFactors = FALSE)[, 7:10]
colnames(unchanged) <- c('shctrl_1', 'shctrl_2', 'shsatb1_1', 'shsatb1_2')
pdf('unchanged_loops.pdf')
pheatmap(unchanged, cluster_row = FALSE, cluster_cols = FALSE,
         scale = 'row', show_rownames = FALSE, breaks = seq(-1.5, 1.5, 0.03),
         color = colorRampPalette(c('blue', 'white', 'red'))(100))
dev.off()
