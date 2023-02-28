A2B <- read.table("A2B_genes.txt", stringsAsFactors = FALSE, col.names = c('chr', 'start', 'end', 'log2fc'))
B2A <- read.table("B2A_genes.txt", stringsAsFactors = FALSE, col.names = c('chr', 'start', 'end', 'log2fc'))
A2A_B2B <- read.table("A2A_B2B_genes.txt", stringsAsFactors = FALSE, col.names = c('chr', 'start', 'end', 'log2fc'))

dat <- rbind(rbind(data.frame(value = A2B$log2fc, type = 'A2B'),
                   data.frame(value = B2A$log2fc, type = 'B2A')),
             data.frame(value = A2A_B2B$log2fc, type = 'Unchanged'))

pdf("compartment_switch_genes.pdf")
boxplot(value ~ type, dat, outline = FALSE, notch = FALSE, ylim = c(-3, 3)) 
dev.off()
