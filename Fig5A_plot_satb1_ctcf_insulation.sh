## generate bins
bedtools intersect -a all_bins.bed -b satb1_peaks.bed -wa | uniq > satb1_bins.bed
bedtools intersect -a all_bins.bed -b ctcf_peaks.bed -wa | uniq > ctcf_bins.bed
# SATB1 & CTCF
sort -k1,1 -k2,2n satb1_bins.bed ctcf_bins.bed | uniq -d > satb1_ctcf_bins.bed
# SATB1 only
sort -k1,1 -k2,2n satb1_bins.bed satb1_ctcf_bins.bed satb1_ctcf_bins.bed | uniq -u > satb1_no_ctcf_bins.bed
# CTCF only
sort -k1,1 -k2,2n ctcf_bins.bed satb1_ctcf_bins.bed satb1_ctcf_bins.bed | uniq -u > ctcf_no_satb1_bins.bed
# no SATB1 & no CTCF
cat satb1_bins.bed ctcf_bins.bed > satb1_or_ctcf_bins.bed
sort -k1,1 -k2,2n all_bins.bed satb1_or_ctcf_bins.bed satb1_or_ctcf_bins.bed | uniq -u > no_satb1_no_ctcf_bins.bed

## plot insulation
# SATB1 & CTCF
computeMatrix reference-point --referencePoint center -p 40 -S shCtrl_insulation.bw shSATB1_insulation.bw -R satb1_ctcf_bins.bed \
                              -a 500000 -b 500000 -bs 10000 -o satb1_ctcf_insulation.gz
plotProfile -m satb1_ctcf_insulation.gz --perGroup --yMin -0.2 --yMax 0.2 -out satb1_ctcf_insulation.pdf
# SATB1 only
computeMatrix reference-point --referencePoint center -p 40 -S shCtrl_insulation.bw shSATB1_insulation.bw -R satb1_no_ctcf_bins.bed \
                              -a 500000 -b 500000 -bs 10000 -o satb1_no_ctcf_insulation.gz
plotProfile -m satb1_no_ctcf_insulation.gz --perGroup --yMin -0.2 --yMax 0.2 -out satb1_no_ctcf_insulation.pdf
# CTCF only
computeMatrix reference-point --referencePoint center -p 40 -S shCtrl_insulation.bw shSATB1_insulation.bw -R ctcf_no_satb1_bins.bed \
                              -a 500000 -b 500000 -bs 10000 -o ctcf_no_satb1_insulation.gz
plotProfile -m ctcf_no_satb1_insulation.gz --perGroup --yMin -0.2 --yMax 0.2 -out ctcf_no_satb1_insulation.pdf
# no SATB1 & no CTCF
computeMatrix reference-point --referencePoint center -p 40 -S shCtrl_insulation.bw shSATB1_insulation.bw -R no_satb1_no_ctcf_bins.bed \
                              -a 500000 -b 500000 -bs 10000 -o no_satb1_no_ctcf_insulation.gz
plotProfile -m no_satb1_no_ctcf_insulation.gz --perGroup --yMin -0.2 --yMax 0.2 -out no_satb1_no_ctcf_insulation.pdf
