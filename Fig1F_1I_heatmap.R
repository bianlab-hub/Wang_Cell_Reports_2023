## mouse
dat <- read.table('mouseT细胞活化相关基因画热图.txt')

library(pheatmap)
pdf('mouse_jak3.pdf')
pheatmap(dat['JAK3', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(3000, 8000, 50))
dev.off()

pdf('mouse_nfatc1.pdf')
pheatmap(dat['NFATC1', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(3000, 6500, 35))
dev.off()

pdf('mouse_il2.pdf')
pheatmap(dat['IL2', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(5, 15, 0.1))
dev.off()

pdf('mouse_sos2.pdf')
pheatmap(dat['SOS2', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(700, 1300, 6))
dev.off()

pdf('mouse_cd25.pdf')
pheatmap(dat['CD25', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(1500, 2600, 11))
dev.off()


## jurkat cell
dat_2 <- read.table('T细胞相关基因画热图-Jurkat.txt', header=TRUE)
rownames(dat_2) <- dat_2$gene
dat_2 <- dat_2[, -7]

pdf('jurkat_jak3.pdf')
pheatmap(dat_2['JAK3', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(600, 1000, 4))
dev.off()

pdf('jurkat_nfatc1.pdf')
pheatmap(dat_2['NFATC1', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(1500, 2000, 5))
dev.off()

pdf('jurkat_il2.pdf')
pheatmap(dat_2['IL2', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(0, 10, 0.1))
dev.off()

pdf('jurkat_sos2.pdf')
pheatmap(dat_2['SOS2', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(1200, 1800, 6))
dev.off()

pdf('jurkat_cd25.pdf')
pheatmap(dat_2['CD25', ],
         cluster_row = FALSE, cluster_cols = FALSE,
         show_rownames = TRUE, breaks = seq(0, 16, 0.16))
dev.off()
