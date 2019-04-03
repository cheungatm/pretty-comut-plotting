# pretty-comut-plotting

This Rproject allows users to create an aesthetically pleasing "co-mut" plot that shows various clinical and genomic features of each patient in an easy-to-read panel figure.

## Getting Started

Although the user can immediately create co-mut plots using the _main_comut_script.R_ given the correctly formatted data files, the main purpose of this repo is to provide helper functions and Rscript examples to allow others to customize and view their own plots. As a result, this should be run in RStudio (or preferred IDE). Not all clinical or genomic features have been included (i.e. drug names or response labels), but one can add their own to the _fill_pallettes.R script_.

### Parameters for _main_comut_script.R_

--maf_with_pair_id = a maf file that must include column names: 'pair_id', 'Hugo_Symbol', 'Variant_Classification', and 'Protein_Change'

--snv_gene_list = .tsv file of desired genes (taken from SNVs in the maf) to include in the plot that must include column name: 'Hugo_Symbol'

--cna_focality_file = .tsv file of copy number events that must include column names: 'pair_id', 'Hugo_Symbol', 'chr', 'start', 'end', and 'segment_CN_interpretation' (based on whatever CNA calling method you prefer).

--cna_gene_list = .tsv file of desired genes (taken from CNAs in the cna_focality_file) to include in the plot that must include column name: 'Hugo_Symbol'.

--melted_clinical_response_df = .tsv file of melted (i.e. long-form) clinical data that must include column names: 'pair_id', 'variable', and 'value' (ex. 'sample_1' 'response_type' 'exceptional')

--melted_genomics_df = .tsv file of melted (i.e. long-form) genomics data that must include column names: 'pair_id', 'variable', and 'value'. (ex. 'sample_1' 'tumor_mutational_burden (mut/Mb)' '4.2')

--pair_order_list = .tsv file of desired order of the columns (left to right) that must include column name: 'pair_id'

--gene_order_list = .tsv file of desired order of the genes (top to bottom) that must include column name: 'Hugo_Symbol'.
(NOTE: genes included in here from cna_gene_list must have '\_cna' appended to the end to specify you want to plot the CNA corresponding to that gene and not the SNV. (i.e. Hugo_Symbol TP53 SPOP TP53_cna would plot TP53 (_snv_), SPOP (_snv_), and then the TP53_cna in that order). 

### Installing

pretty-comut-plotting requires R 3.5.0 as well as dplyr, tidyr, ggplot2, reader, and egg

## Authors

* **Alex "Scanner" Cheung** - (https://github.com/cheungatm)

## Acknowledgments

* Shoutout to Claire Margolis and Natalie Vokes for their initial Rscripts!

