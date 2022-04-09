
#!/bin/bash

FilewoFilters="/path/to/file" #PLINK file without filters (only filename, without extension). File in PLINK format (.bed,.bim,.fam)

####  0. INITIAL VARIANT FILTERS (PLINK/1.9b) (apply this to each dataset independently)

####  0.1. Exclude sites with genotype missingness > 5%.
plink --bfile ${FilewoFilters} --geno 0.05 --make-bed --out ${FilewoFilters}_geno

####  0.2. Exclude individuals with genotype missingness > 10%
plink --bfile ${FilewoFilters}_geno --mind 0.1 --make-bed --out ${FilewoFilters}_geno_mind

####  0.3. Filter SNPs in HW disequilibrium pvalue 10-6 
plink --bfile ${FilewoFilters}_geno_mind --hwe 10-6 --make-bed --out ${FilewoFilters}_geno_mind_hwe

####  1. RELATEDNESS ESTIMATION (PLINK/1.9b) Perform independently on each dataset

####  1.1. Remove sites with minor-allele frequency (MAF) < 1%
plink --bfile ${FilewoFilters}_geno_mind_hwe --maf 0.01 --make-bed --out ${FilewoFilters}_geno_mind_hwe_maf

####  1.2. Estimate relatedness 
plink --bfile ${FilewoFilters}_geno_mind_hwe_maf --genome --out ${FilewoFilters}_geno_mind_hwe_maf #this creates the output.genome with IBD sharing

####  1.3. Remove related individuals (the one with less missing sites):
###### First, create a list of related inds (manually checking PI_HAT values in ${FilewoFilters}_geno_mind_hwe_maf.genome) and save it in related_inds.txt, and then remove them from dataset (file from step 0.3)
plink --bfile ${FilewoFilters}_geno_mind_hwe --remove related_inds --make-bed --out ${FilewoFilters}_geno_mind_hwe_maf_unrelated

####  2. MERGING WITH REFERENCE PANELS (PLINK/1.9b) Perform independently on each dataset
####  2.1. Merging datasets from step 0.3 (without related individuals --> step 1.3): keeping only overlapping SNPs
####  File with merged data: ${Merged}
####  2.2. Remove sites with minor-allele frequency (MAF) < 1%
plink --bfile ${Merged} --maf 0.01 --make-bed --out ${Merged}_maf


####  #. EXTRA filtering: Linkage disequilibrium pruning (for allele-frequency-based analyses) 
plink --bfile ${Merged}_maf --indep-pairwise 200 25 0.5 
plink --bfile ${Merged}_maf --exclude plink.prune.out --make-bed --out ${Merged}_maf_pruned
