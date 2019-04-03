# pretty-comut-plotting

This Rproject allows users to create an aesthetically pleasing "co-mut" plot that shows various clinical and genomic features of each patient in an easy-to-read panel figure.


![Example pretty comut plot](https://github.com/cheungatm/pretty-comut-plotting/blob/master/example_comut_plot.png)

## Getting Started

Although the user can immediately create co-mut plots using the _main_comut_script.R_ given the correctly formatted data files, the main purpose of this repo is to provide helper functions and Rscript examples to allow others to customize and view their own plots. As a result, this should be run in RStudio (or preferred IDE). Not all clinical or genomic features have been included (i.e. drug names or response labels), but one can add their own to the _fill_pallettes.R script_.

There are example files of properly formatted data in the _/test_data/_ directory, helper functions used by _main_comut_script.R_ in the _/scripts/_ directory, and a grch37 build of the reference genome in the _/ref_files/_ directory. 

### Parameters for _main_comut_script.R_

--maf_with_pair_id = a maf file that must include column names: 'pair_id', 'Hugo_Symbol', 'Variant_Classification', and 'Protein_Change'

pair_id | Hugo_Symbol | Variant_Classification | Protein_Change
------------ | ------------ | ------------ | ------------
sample1 | TP53 | Missense_Mutation | p.C135W


--snv_gene_list = .tsv file of desired genes (taken from SNVs in the maf) to include in the plot that must include column name: 'Hugo_Symbol'

| Hugo_Symbol |
-------------- |
TP53 |


--cna_focality_file = .tsv file of copy number events that must include column names: 'pair_id', 'Hugo_Symbol', 'chr', 'start', 'end', and 'segment_CN_interpretation' (based on whatever CNA calling method you prefer).


pair_id | Hugo_Symbol | chr | start | end | segment_CN_interpretation
------------ | ------------ | ------------ | ------------ | ------------ | ------------
sample1 | TP53 | 17 | 7565097 | 7590856 | Loss of heterozygosity


--cna_gene_list = .tsv file of desired genes (taken from CNAs in the cna_focality_file) to include in the plot that must include column name: 'Hugo_Symbol'.


| Hugo_Symbol |
-------------- |
TP53 |


--melted_clinical_response_df = .tsv file of melted (i.e. long-form) clinical data that must include column names: 'pair_id', 'variable', and 'value' (ex. 'sample_1' 'response_type' 'exceptional')


pair_id | variable | value | 
------------ | ------------ | ------------ |
sample1 | response | exceptional |
sample2 | response | non-responder |


--melted_genomics_df = .tsv file of melted (i.e. long-form) genomics data that must include column names: 'pair_id', 'variable', and 'value'.


pair_id | variable | value | 
------------ | ------------ | ------------ |
sample1 | tumor_mutational_burden | 4.3 |
sample1 | sample_purity | 0.62

--pair_order_list = .tsv file of desired order of the columns (left to right) that must include column name: 'pair_id'


| pair_id |
-------------- |
sample1 |
sample2 |


--gene_order_list = .tsv file of desired order of the genes (top to bottom) that must include column name: 'Hugo_Symbol'.
(NOTE: genes included in here from cna_gene_list must have '\_cna' appended to the end to specify you want to plot the CNA corresponding to that gene and not the SNV.

| Hugo_Symbol |
-------------- |
TP53 |
SPOP |
TP53_cna |

### Installing

pretty-comut-plotting requires R 3.5.0 as well as dplyr, tidyr, ggplot2, reader, and egg

## Authors

* **Alex "Scanner" Cheung** - (https://github.com/cheungatm)

## Acknowledgments

* Shoutout to Claire Margolis and Natalie Vokes of the Van Allen Lab for their initial Rscripts!

