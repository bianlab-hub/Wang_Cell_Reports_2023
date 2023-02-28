## convert bedgraph to bigwig
./bedGraphToBigWig shctrl_insulation.bedgraph hg38.chrom.sizes shctrl_insulation.bw
./bedGraphToBigWig shsatb1_insulation.bedgraph hg38.chrom.sizes shsatb1_insulation.bw 


## intersect SATB1 sites with TAD boundaries
bedtools intersect -a boundary.txt -b satb1_peaks.bed -wa | uniq > satb1_boundary.txt
sort boundary.txt satb1_boundary.txt satb1_boundary.txt | uniq -u > no_satb1_boundary.txt


## plot insulation score
computeMatrix reference-point --referencePoint center -p 40 -S shctrl_insulation.bw shsatb1_insulation.bw -R satb1_boundary.txt \
                              -a 200000 -b 200000 -bs 10000 -o satb1_tad_boundary_insulation.gz
plotProfile -m satb1_tad_boundary_insulation.gz --perGroup --yMin -0.4 --yMax 0.4 -out satb1_tad_boundary_insulation.pdf

computeMatrix reference-point --referencePoint center -p 40 -S shctrl_insulation.bw shsatb1_insulation.bw -R no_satb1_boundary.txt \
                              -a 200000 -b 200000 -bs 10000 -o no_satb1_tad_boundary_insulation.gz
plotProfile -m no_satb1_tad_boundary_insulation.gz --perGroup --yMin -0.4 --yMax 0.4 -out no_satb1_tad_boundary_insulation.pdf
