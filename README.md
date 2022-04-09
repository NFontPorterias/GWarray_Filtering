# Genome-Wide array data Filtering pipeline
Helper script and documentation to perform "genome-wide array data" variant and individual filtering for population genetics analyses. Pipeline applied in [Font-Porterias, N. et al. *PLoS Gen*, 2019](https://doi.org/10.1371/journal.pgen.1008417) and [Flores-Bello, A. et al. *BMC Genomics*, 2021](https://doi.org/10.1186/s12864-021-08203-y) on [Axiom® Human Origins array data](http://www.affymetrix.com/support/technical/byproduct.affx?product=Axiom_GW_HuOrigin). This repo is not under active development, consider code as it is and check the software versions specified below. 

See documentation [here](Processing_HOarray.pdf), for a complete description of the filtering pipeline. 


## Citation

If you use these pipeline, please cite: 

> **Font-Porterias N**, Arauna LR, Poveda A, Bianco E, Rebato E, Prata MJ, Calafell F Comas, D. (2019). European Roma groups show complex West Eurasian admixture footprints and a common South Asian genetic origin. *PLoS Genetics*, 15(9), e1008417, https://doi.org/10.1371/journal.pgen.1008417


## Pipeline
*[PLINK](https://www.cog-genomics.org/plink/1.9/) version*: 1.9. 

**Input and output formats**: binary PLINK files (.bed, .bim, .fam)

Run the following command:
```bash
sh filtering.sh
```
