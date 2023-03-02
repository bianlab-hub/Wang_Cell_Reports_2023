for filename in *.bed; do 
	sample=$(basename "$filename" .bed)
	bedtools slop -i $filename -g hg38.chrom.sizes -b 1000000 > ${sample}_plus_minus_1Mb.bed
	bedtools slop -i $filename -g hg38.chrom.sizes -b 2000000 > ${sample}_plus_minus_2Mb.bed
	for stage in shCtrl shSATB1 ; do
		coolpup.py ${stage}_merged_hic_matrix.cool ${sample}_plus_minus_1Mb.bed --expected ${stage}_merged_hic_matrix_cool_cis_expected.tsv --local \
                                                                            --pad 1000 --outname ${sample}_plus_minus_1Mb_pileup_${stage}.txt
		coolpup.py ${stage}_merged_hic_matrix.cool ${sample}_plus_minus_2Mb.bed --expected ${stage}_merged_hic_matrix_cool_cis_expected.tsv --local \
                                                                            --pad 2000 --outname ${sample}_plus_minus_2Mb_pileup_${stage}.txt
	done
done
