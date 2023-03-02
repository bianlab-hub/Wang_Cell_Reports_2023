sample='Sh-210304'
threads=12
assemb=hg38

# balance
cooler balance ${sample}_10kb.cool -p $threads

#calculate expected
cooltools compute-expected ${sample}_10kb.cool -o ${sample}_cis_expected.tsv -t cis -p $threads 

# generate saddle plots overall A/B compartment strength
cooltools compute-saddle ${sample}_10kb.cool ${sample}.cis.vecs.tsv ${sample}_cis_expected.tsv -o ${sample}_saddle_E1 --fig pdf --qrange 0.02 0.98
