satb1_peaks='output_Satb1_CUT_tag_rep_1_rep_2_merged.bedgraph.stringent.bed' 
shuffled_peaks='SatB1_peaks_shuffled.bed'
SC_cool='shCtrl_merged_hic_matrix.cool'
SC_expected='shCtrl_merged_hic_matrix_cool_cis_expected.tsv'
Sh_cool='shSATB1_merged_hic_matrix.cool'
Sh_expected='shSATB1_merged_hic_matrix_cool_cis_expected.tsv'

coolpup.py ${SC_cool} ${satb1_peaks} --nshifts 10 --pad 500 --mindist 500000 --maxdist 2000000 --pad 500 --outname SC_SatB1_pileup_500k_2m.txt 
coolpup.py ${SC_cool} ${satb1_peaks} --expected ${SC_expected} --pad 500 --mindist 500000 --maxdist 2000000 --pad 500 \
                                     --outname SC_SatB1_pileup_500k_2m_expected.txt 

coolpup.py ${Sh_cool} ${satb1_peaks} --nshifts 10 --pad 500 --mindist 500000 --maxdist 2000000 --pad 500 --outname Sh_SatB1_pileup_500k_2m.txt
coolpup.py ${Sh_cool} ${satb1_peaks} --expected ${Sh_expected} --pad 500 --mindist 500000 --maxdist 2000000 --pad 500 \
                                     --outname Sh_SatB1_pileup_500k_2m_expected.txt
