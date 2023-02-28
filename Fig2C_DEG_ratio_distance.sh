awk '{if($6==1) print($3 "\t" $4 "\t" $4+1 "\t" $1 "\t" $2);else print($3 "\t" $5 "\t" $5+1 "\t" $1 "\t" $2)}' Genes_log2fc.txt |\
sort -k1,1 -k2,2n > Genes_tss_id_log2fc.txt  # 34556

awk '{printf($1"\t");printf("%d\t", ($2+$3)/2);printf("%d\n", ($2+$3)/2+1)}' satb1_peaks.bed | sort -k1,1 -k2,2n > satb1_peaks_center.bed  # 24263

bedtools closest -a Genes_tss_id_log2fc.txt -b satb1_peaks_center.bed > Genes_satb1.bed

## 0-10kb
awk '{if(($2-$7>0 && $2-$7<=10000) || ($2-$7<0 && $2-$7>=-10000)) print $4}' Genes_satb1.bed > 0_10kb_genes.bed  # 13167
sort 0_10kb_genes.bed up_genes.txt | uniq -d | wc -l  # 388
sort 0_10kb_genes.bed down_genes.txt | uniq -d | wc -l  # 394
# 13167-388-394=12385
# 388/13167=0.02946761
# 394/13167=0.02992329
# 12385/13167=0.9406091


## 10-20kb
awk '{if(($2-$7>10000 && $2-$7<=20000) || ($2-$7<-10000 && $2-$7>=-20000)) print $4}' Genes_satb1.bed > 10_20kb_genes.bed  # 3711
sort 10_20kb_genes.bed up_genes.txt | uniq -d | wc -l  # 86
sort 10_20kb_genes.bed down_genes.txt | uniq -d | wc -l  # 43
# 3711-86-43=3582
# 86/3711=0.02317435
# 43/3711=0.01158717
# 3582/3711=0.9652385


## 20-30kb
awk '{if(($2-$7>20000 && $2-$7<=30000) || ($2-$7<-20000 && $2-$7>=-30000)) print $4}' Genes_satb1.bed > 20_30kb_genes.bed  # 2791
sort 20_30kb_genes.bed up_genes.txt | uniq -d | wc -l  # 47
sort 20_30kb_genes.bed down_genes.txt | uniq -d | wc -l  # 33
# 2791-47-33=2711
# 47/2791=0.01683984
# 33/2791=0.01182372
# 2711/2791=0.9713364


## 30-40kb
awk '{if(($2-$7>30000 && $2-$7<=40000) || ($2-$7<-30000 && $2-$7>=-40000)) print $4}' Genes_satb1.bed > 30_40kb_genes.bed  # 2159
sort 30_40kb_genes.bed up_genes.txt | uniq -d | wc -l  # 47
sort 30_40kb_genes.bed down_genes.txt | uniq -d | wc -l  # 27
# 2159-47-27=2085
# 47/2159=0.02176934
# 27/2159=0.01250579
# 2058/2159=0.9532191


## 40-50kb
awk '{if(($2-$7>40000 && $2-$7<=50000) || ($2-$7<-40000 && $2-$7>=-50000)) print $4}' Genes_satb1.bed > 40_50kb_genes.bed  # 1780
sort 40_50kb_genes.bed up_genes.txt | uniq -d | wc -l  # 40
sort 40_50kb_genes.bed down_genes.txt | uniq -d | wc -l  # 23
# 1780-40-23=1717
# 40/1780=0.02247191
# 23/1780=0.01292135
# 1717/1780=0.9646067


## 50-60kb
awk '{if(($2-$7>50000 && $2-$7<=60000) || ($2-$7<-50000 && $2-$7>=-60000)) print $4}' Genes_satb1.bed > 50_60kb_genes.bed  # 1370
sort 50_60kb_genes.bed up_genes.txt | uniq -d | wc -l  # 23
sort 50_60kb_genes.bed down_genes.txt | uniq -d | wc -l  # 15
# 1370-23-15=1332
# 23/1370=0.01678832
# 15/1370=0.01094891
# 1332/1370=0.9722628


## 60-70kb
awk '{if(($2-$7>60000 && $2-$7<=70000) || ($2-$7<-60000 && $2-$7>=-70000)) print $4}' Genes_satb1.bed > 60_70kb_genes.bed  # 1054
sort 60_70kb_genes.bed up_genes.txt | uniq -d | wc -l  # 23
sort 60_70kb_genes.bed down_genes.txt | uniq -d | wc -l  # 10
# 1054-23-10=1021
# 23/1054=0.02182163
# 10/1054=0.009487666
# 1021/1054=0.9686907


## 70-80kb
awk '{if(($2-$7>70000 && $2-$7<=80000) || ($2-$7<-70000 && $2-$7>=-80000)) print $4}' Genes_satb1.bed > 70_80kb_genes.bed  # 886
sort 70_80kb_genes.bed up_genes.txt | uniq -d | wc -l  # 14
sort 70_80kb_genes.bed down_genes.txt | uniq -d | wc -l  # 13
# 886-14-13=859
# 14/886=0.01580135
# 13/886=0.01467269
# 859/886=0.969526


## 80-90kb
awk '{if(($2-$7>80000 && $2-$7<=90000) || ($2-$7<-80000 && $2-$7>=-90000)) print $4}' Genes_satb1.bed > 80_90kb_genes.bed  # 736
sort 80_90kb_genes.bed up_genes.txt | uniq -d | wc -l  # 21
sort 80_90kb_genes.bed down_genes.txt | uniq -d | wc -l  # 11
# 736-21-11=704
# 21/736=0.02853261
# 11/736=0.01494565
# 704/736=0.9565217


## 90-100kb
awk '{if(($2-$7>90000 && $2-$7<=100000) || ($2-$7<-90000 && $2-$7>=-100000)) print $4}' Genes_satb1.bed > 90_100kb_genes.bed  # 673
sort 90_100kb_genes.bed up_genes.txt | uniq -d | wc -l  # 11
sort 90_100kb_genes.bed down_genes.txt | uniq -d | wc -l  # 4
# 673-11-4=658
# 11/673=0.01634473
# 4/673=0.005943536
# 658/673=0.9777117
