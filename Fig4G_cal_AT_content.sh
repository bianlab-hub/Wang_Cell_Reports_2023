## SATB1 & CTCF
bedtools intersect -a satb1_peaks.bed -b ctcf_peaks.bed -wa | uniq |\
awk '{printf($1 "\t");printf("%d\t", ($2+$3)*0.5-250);printf("%d\t", ($2+$3)*0.5+250+1);printf($4"\n")}' > satb1_ctcf_250bp.bed
bedtools getfasta -fi hg38.fa -bed satb1_ctcf_250bp.bed | grep -v chr > satb1_ctcf_250bp.txt

## SATB1 only
bedtools intersect -a satb1_peaks.bed -b ctcf_peaks.bed -wa -v | uniq |\
awk '{printf($1 "\t");printf("%d\t", ($2+$3)*0.5-250);printf("%d\t", ($2+$3)*0.5+250+1);printf($4"\n")}' > satb1_only_250bp.bed
bedtools getfasta -fi hg38.fa -bed satb1_only_250bp.bed | grep -v chr > satb1_only_250bp.txt

## CTCF only
bedtools intersect -a ctcf_peaks.bed -b satb1_peaks.bed -wa -v | uniq |\
awk '{printf($1 "\t");printf("%d\t", ($2+$3)*0.5-250);printf("%d\t", ($2+$3)*0.5+250+1);printf($4"\n")}' > ctcf_only_250bp.bed
bedtools getfasta -fi hg38.fa -bed ctcf_only_250bp.bed | grep -v chr > ctcf_only_250bp.txt
