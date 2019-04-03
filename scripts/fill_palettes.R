#' @title Pre-set color fills for co-mut aesthetics
#'
#' @description The list of included clinical and genomic features is by no means exhaustive, but one can include any label of choice in one's data to correspond
#'              to a particular color!
#'

# Clinical variables fill colors 
clinical_fill <- c("clinical benefit" = "forestgreen", "CR/PR" = "forestgreen", "CB" = "forestgreen", "Exceptional Responder" = '#333399',
                   "no clinical benefit" = "goldenrod", "PD" = "goldenrod", "NCB" = "goldenrod", "Non-Responder" = '#CC6666',
                   "stable disease" = "cornflowerblue", "SD" = "cornflowerblue",
                   "CR" = "magenta4", "PR" = "lightpink", "PR/CR" = "lightpink", "SD" = "aquamarine2", "PD" = "cyan4", "X" = "beige", "NE/PD" = "cyan4",
                   "former" = "gray50","Former" = "gray50", "former "="gray50",
                   "current" = "gray20","Current" = "gray20","current "="gray20",
                   "Current/Former"= "gray50",
                   "never" = "gray90","Never" = "gray90",
                   "anti-CTLA-4" = "darkorchid4", "anti-PD-1" = "dodgerblue2", "anti-PD-L1" = "skyblue", "anti-PD-1/anti-PD-L1" = "palevioletred3",
                   "anti-CTLA-4 + anti-PD-1/PD-L1" = "violet",
                   "ipilimumab" = "lightgreen", "nivolumab" = "skyblue4", "pembrolizumab" = "cyan3", "atezolizumab" = "navy", "durvalumab" = "salmon3", "tremelimumab" = "wheat3", 
                   "nivolumab + ipilimumab" = "seagreen3", "nivolumab + lirilumab" = "skyblue3", "nivolumab + lirilumab " = "skyblue2", "nivolumab + urelumab" = "skyblue1", 
                   "ipilimumab + dacarbazine" = "tan", "vemurafenib + ipilimumab" = "seagreen2", "nivolumab + pembrolizumab" = "skyblue2", "durvalumab + tremelimumab " = "orange",
                   "atezolizumab + bevacizumab" = "royalblue3", "axitinib + avelumab" = "coral1", "durvalumab + tremelimumab" = "brown3", "ipilimumab + nivolumab" = "seagreen3", 
                   "ipilimumab + tremelimumab" = "palegreen3", "axitinib + pembrolizumab" = "darkslategray3", "NA" = "gray50",
                   "atezolizumab+carboplatin/nab-paclitaxel" = "darkcyan",
                   "positive" = "salmon", "negative" = "lightblue",
                   "yes" = "gray40"," " = "gray50",
                   "MALE" = "darkblue", "FEMALE" = "palevioletred3", 
                   "cutaneous" = "peachpuff", "eye" = "palegreen", "cutaneous and eye" = "palegreen3", "mucosa" = "slateblue1", "mucosal" = "slateblue1", "occult" = "tomato",
                   "toe" = "palevioletred", "unknown" = "lemonchiffon4", "uveal" = "palegreen", "acral" = "palevioletred",
                   "adenocarcinoma" = "indianred", "Adenocarcinoma" = "indianred", "Squamous Cell Carcinoma"= "skyblue", "squamous cell carcinoma" = "skyblue",
                   "NSCLC NOS" = "wheat","Small Cell Lung Cancer" = "seagreen", 
                   "null" = "gray50",
                   "Anal"= "lemonchiffon2", "Bladder"="slateblue3","HNSCC"="sandybrown", "Lung"="palegreen2", "Melanoma"="palevioletred", "Renal"="turquoise3", "Sarcoma"="thistle")

# Copy number fill colors
cn_fill <- c("Homozygous deletion"="dodgerblue3", "Loss of heterozygosity"="skyblue",
             "Copy neutral loss of heterozygosity"="skyblue3", "High amplification with loss of heterozygosity"="orchid4",
             "Amplification with loss of heterozygosity"="plum1", "Amplification"="indianred1", "High amplification"="firebrick1",
             "High amplification and amplification"="firebrick4", "Biallelic amplification"="hotpink2", 
             "Biallelic high amplification"="firebrick", "Neutral"="grey90", "Unknown"="grey90")


# Mutation types
type_syn <- c("Silent", "IGR", "Intron", "lincRNA", "RNA", "3'UTR", "5'UTR", "5'Flank", "Non-coding_Transcript")
type_nonsyn <- c("Missense_Mutation", "Nonsense_Mutation", "Frame_Shift_Ins",
                 "Frame_Shift_Del", "In_Frame_Ins", "In_Frame_Del",
                 "Stop_Codon_Del", "De_novo_Start_InFrame", "Start_Codon_Del", "De_novo_Start_InFrame",
                 "Splice_Site", "Nonstop_Mutation")

type_truncating <- c("Nonsense_Mutation", "Frame_Shift_Ins",
                     "Frame_Shift_Del", "Splice_Site",  "Stop_Codon_Del", 
                     "Start_Codon_Del", "Nonstop_Mutation")
