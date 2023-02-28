library(ggplot2)
library(ggthemes)

## Jurkat T cell (shSATB1 vs. shCtrl)
genes <- read.table("tss_log2fc_padj.txt", stringsAsFactors = FALSE)
colnames(genes) <- c("chr", "start", "end", "log2fc", "padj")
genes <- na.omit(genes)
threshold <- as.factor(ifelse(genes$padj < 0.05 & abs(genes$log2fc) > 0.5,
                       ifelse(genes$log2fc > 0.5, 'Up', 'Down'), 'Not'))
p <- ggplot(genes, aes(x = log2fc, y = -log10(padj), color = threshold)) +
            geom_point(size = 1, alpha = 0.5) +
            scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 30)) +  
            scale_x_continuous(limits = c(-5, 5), breaks = seq(-5, 5, 1)) + 
            scale_color_manual(values = c("blue", "grey", "red")) + theme_few() +
            geom_vline(xintercept = c(-0.5, 0.5), lty = 4, col = "black", lwd = 0.5) +
            geom_hline(yintercept = -log10(0.05), lty = 4, col = "black", lwd = 0.5)
ggsave(p, file = "satb1_RNAseq_volcano_plot.pdf")


## Mouse primary CD4+ naive T cell (Satb1 flox/flox CD4-Cre vs. Satb1+/+ CD4-Cre)
genes <- read.table("mouse_cko_rnaseq.txt", stringsAsFactors = FALSE, header=TRUE)
colnames(genes) <- c("gene_id", "log2fc", "padj")
threshold <- as.factor(ifelse(genes$padj < 0.05 & abs(genes$log2fc) > 0.5,
                       ifelse(genes$log2fc > 0.5, 'Up', 'Down'), 'Not'))
p <- ggplot(genes, aes(x = log2fc, y = -log10(padj), color = threshold)) +
            geom_point(size = 1, alpha = 0.5) +
            scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 30)) +  
            scale_x_continuous(limits = c(-10, 10), breaks = seq(-10, 10, 2)) + 
            scale_color_manual(values = c("blue", "grey", "red")) + theme_few() +
            geom_vline(xintercept = c(-0.5, 0.5), lty = 4, col = "black", lwd = 0.5) +
            geom_hline(yintercept = -log10(0.05), lty = 4, col = "black", lwd = 0.5)
ggsave(p, file = "mouse_cko_RNAseq_volcano_plot.pdf")
