% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xDefineEQTL.r
\name{xDefineEQTL}
\alias{xDefineEQTL}
\title{Function to extract eQTL-gene pairs given a list of SNPs or a customised eQTL mapping data}
\usage{
xDefineEQTL(data = NULL, include.eQTL = c(NA, "JKscience_CD14",
"JKscience_LPS2", "JKscience_LPS24", "JKscience_IFN", "JKscience_TS2A",
"JKscience_TS2A_CD14", "JKscience_TS2A_LPS2", "JKscience_TS2A_LPS24",
"JKscience_TS2A_IFN", "JKscience_TS2B", "JKscience_TS2B_CD14",
"JKscience_TS2B_LPS2", "JKscience_TS2B_LPS24", "JKscience_TS2B_IFN",
"JKscience_TS3A", "JKng_bcell", "JKng_bcell_cis", "JKng_bcell_trans",
"JKng_mono", "JKng_mono_cis", "JKng_mono_trans", "JKpg_CD4",
"JKpg_CD4_cis", "JKpg_CD4_trans", "JKpg_CD8", "JKpg_CD8_cis",
"JKpg_CD8_trans", "JKnc_neutro", "JKnc_neutro_cis",
"JKnc_neutro_trans", "WESTRAng_blood", "WESTRAng_blood_cis",
"WESTRAng_blood_trans", "JK_nk", "JK_nk_cis", "JK_nk_trans",
"GTEx_V4_Adipose_Subcutaneous", "GTEx_V4_Artery_Aorta",
"GTEx_V4_Artery_Tibial", "GTEx_V4_Esophagus_Mucosa",
"GTEx_V4_Esophagus_Muscularis", "GTEx_V4_Heart_Left_Ventricle",
"GTEx_V4_Lung", "GTEx_V4_Muscle_Skeletal", "GTEx_V4_Nerve_Tibial",
"GTEx_V4_Skin_Sun_Exposed_Lower_leg", "GTEx_V4_Stomach",
"GTEx_V4_Thyroid", "GTEx_V4_Whole_Blood",
"GTEx_V6p_Adipose_Subcutaneous",
"GTEx_V6p_Adipose_Visceral_Omentum", "GTEx_V6p_Adrenal_Gland",
"GTEx_V6p_Artery_Aorta", "GTEx_V6p_Artery_Coronary",
"GTEx_V6p_Artery_Tibial",
"GTEx_V6p_Brain_Anterior_cingulate_cortex_BA24",
"GTEx_V6p_Brain_Caudate_basal_ganglia",
"GTEx_V6p_Brain_Cerebellar_Hemisphere", "GTEx_V6p_Brain_Cerebellum",
"GTEx_V6p_Brain_Cortex", "GTEx_V6p_Brain_Frontal_Cortex_BA9",
"GTEx_V6p_Brain_Hippocampus", "GTEx_V6p_Brain_Hypothalamus",
"GTEx_V6p_Brain_Nucleus_accumbens_basal_ganglia",
"GTEx_V6p_Brain_Putamen_basal_ganglia",
"GTEx_V6p_Breast_Mammary_Tissue",
"GTEx_V6p_Cells_EBVtransformed_lymphocytes",
"GTEx_V6p_Cells_Transformed_fibroblasts", "GTEx_V6p_Colon_Sigmoid",
"GTEx_V6p_Colon_Transverse",
"GTEx_V6p_Esophagus_Gastroesophageal_Junction",
"GTEx_V6p_Esophagus_Mucosa", "GTEx_V6p_Esophagus_Muscularis",
"GTEx_V6p_Heart_Atrial_Appendage", "GTEx_V6p_Heart_Left_Ventricle",
"GTEx_V6p_Liver", "GTEx_V6p_Lung", "GTEx_V6p_Muscle_Skeletal",
"GTEx_V6p_Nerve_Tibial", "GTEx_V6p_Ovary", "GTEx_V6p_Pancreas",
"GTEx_V6p_Pituitary", "GTEx_V6p_Prostate",
"GTEx_V6p_Skin_Not_Sun_Exposed_Suprapubic",
"GTEx_V6p_Skin_Sun_Exposed_Lower_leg",
"GTEx_V6p_Small_Intestine_Terminal_Ileum", "GTEx_V6p_Spleen",
"GTEx_V6p_Stomach", "GTEx_V6p_Testis", "GTEx_V6p_Thyroid",
"GTEx_V6p_Uterus", "GTEx_V6p_Vagina", "GTEx_V6p_Whole_Blood",
"eQTLGen",
"eQTLGen_cis", "eQTLGen_trans", "scRNAseq_eQTL_Bcell",
"scRNAseq_eQTL_CD4", "scRNAseq_eQTL_CD8", "scRNAseq_eQTL_cMono",
"scRNAseq_eQTL_DC", "scRNAseq_eQTL_Mono", "scRNAseq_eQTL_ncMono",
"scRNAseq_eQTL_NK", "scRNAseq_eQTL_PBMC", "jpRNAseq_eQTL_Bcell",
"jpRNAseq_eQTL_CD4", "jpRNAseq_eQTL_CD8", "jpRNAseq_eQTL_Mono",
"jpRNAseq_eQTL_NK", "jpRNAseq_eQTL_PBMC", "Pi_eQTL_Bcell",
"Pi_eQTL_Blood", "Pi_eQTL_CD14", "Pi_eQTL_CD4", "Pi_eQTL_CD8",
"Pi_eQTL_IFN", "Pi_eQTL_LPS2", "Pi_eQTL_LPS24", "Pi_eQTL_Monocyte",
"Pi_eQTL_Neutrophil", "Pi_eQTL_NK", "Pi_eQTL_shared_CD14",
"Pi_eQTL_shared_IFN", "Pi_eQTL_shared_LPS2", "Pi_eQTL_shared_LPS24"),
eQTL.customised = NULL, verbose = TRUE,
RData.location = "http://galahad.well.ox.ac.uk/bigdata")
}
\arguments{
\item{data}{NULL or an input vector containing SNPs. If NULL, all SNPs
will be considered. If a input vector containing SNPs, SNPs should be
provided as dbSNP ID (ie starting with rs). Alternatively, they can be
in the format of 'chrN:xxx', where N is either 1-22 or X, xxx is
number; for example, 'chr16:28525386'}

\item{include.eQTL}{genes modulated by eQTL (also Lead SNPs or in LD
with Lead SNPs) are also included. By default, it is 'NA' to disable
this option. Otherwise, those genes modulated by eQTL will be included.
Pre-built eQTL datasets are detailed in the section 'Note'}

\item{eQTL.customised}{a user-input matrix or data frame with 4
columns: 1st column for SNPs/eQTLs, 2nd column for Genes, 3rd for eQTL
mapping significance level (p-values or FDR), and 4th for contexts
(required even though only one context is input). Alternatively, it can
be a file containing these 4 columns. It is designed to allow the user
analysing their eQTL data. This customisation (if provided) will
populate built-in eQTL data; mysql -e "use pi; SELECT
rs_id_dbSNP147_GRCh37p13,gene_name,pval_nominal,Tissue FROM
GTEx_V7_pair WHERE rs_id_dbSNP147_GRCh37p13!='.';" >
/var/www/bigdata/eQTL.customised.txt}

\item{verbose}{logical to indicate whether the messages will be
displayed in the screen. By default, it sets to true for display}

\item{RData.location}{the characters to tell the location of built-in
RData files. See \code{\link{xRDataLoader}} for details}
}
\value{
a data frame with following columns:
\itemize{
\item{\code{SNP}: eQTLs}
\item{\code{Gene}: eQTL-containing genes}
\item{\code{Sig}: the eQTL mapping significant level}
\item{\code{Context}: the context in which eQTL data was generated}
}
}
\description{
\code{xDefineEQTL} is supposed to extract eQTL-gene pairs given a list
of SNPs or a customised eQTL mapping data.
}
\note{
Pre-built eQTL datasets are described below according to the data
sources.\cr
1. Context-specific eQTLs in monocytes: resting and activating states.
Sourced from Science 2014, 343(6175):1246949
\itemize{
\item{\code{JKscience_TS2A}: cis-eQTLs in either state (based on 228
individuals with expression data available for all experimental
conditions).}
\item{\code{JKscience_TS2A_CD14}: cis-eQTLs only in the resting/CD14+
state (based on 228 individuals).}
\item{\code{JKscience_TS2A_LPS2}: cis-eQTLs only in the activating
state induced by 2-hour LPS (based on 228 individuals).}
\item{\code{JKscience_TS2A_LPS24}: cis-eQTLs only in the activating
state induced by 24-hour LPS (based on 228 individuals).}
\item{\code{JKscience_TS2A_IFN}: cis-eQTLs only in the activating state
induced by 24-hour interferon-gamma (based on 228 individuals).}
\item{\code{JKscience_TS2B}: cis-eQTLs in either state (based on 432
individuals).}
\item{\code{JKscience_TS2B_CD14}: cis-eQTLs only in the resting/CD14+
state (based on 432 individuals).}
\item{\code{JKscience_TS2B_LPS2}: cis-eQTLs only in the activating
state induced by 2-hour LPS (based on 432 individuals).}
\item{\code{JKscience_TS2B_LPS24}: cis-eQTLs only in the activating
state induced by 24-hour LPS (based on 432 individuals).}
\item{\code{JKscience_TS2B_IFN}: cis-eQTLs only in the activating state
induced by 24-hour interferon-gamma (based on 432 individuals).}
\item{\code{JKscience_TS3A}: trans-eQTLs in either state.}
\item{\code{JKscience_CD14}: cis and trans-eQTLs in the resting/CD14+
state (based on 228 individuals).}
\item{\code{JKscience_LPS2}: cis and trans-eQTLs in the activating
state induced by 2-hour LPS (based on 228 individuals).}
\item{\code{JKscience_LPS24}: cis and trans-eQTLs in the activating
state induced by 24-hour LPS (based on 228 individuals).}
\item{\code{JKscience_IFN}: cis and trans-eQTLs in the activating state
induced by 24-hour interferon-gamma (based on 228 individuals).}
}
2. eQTLs in B cells. Sourced from Nature Genetics 2012, 44(5):502-510
\itemize{
\item{\code{JKng_bcell}: cis- and trans-eQTLs.}
\item{\code{JKng_bcell_cis}: cis-eQTLs only.}
\item{\code{JKng_bcell_trans}: trans-eQTLs only.}
}
3. eQTLs in monocytes. Sourced from Nature Genetics 2012, 44(5):502-510
\itemize{
\item{\code{JKng_mono}: cis- and trans-eQTLs.}
\item{\code{JKng_mono_cis}: cis-eQTLs only.}
\item{\code{JKng_mono_trans}: trans-eQTLs only.}
}
4. eQTLs in neutrophils. Sourced from Nature Communications 2015,
7(6):7545
\itemize{
\item{\code{JKnc_neutro}: cis- and trans-eQTLs.}
\item{\code{JKnc_neutro_cis}: cis-eQTLs only.}
\item{\code{JKnc_neutro_trans}: trans-eQTLs only.}
}
5. eQTLs in NK cells. Unpublished
\itemize{
\item{\code{JK_nk}: cis- and trans-eQTLs.}
\item{\code{JK_nk_cis}: cis-eQTLs only.}
\item{\code{JK_nk_trans}: trans-eQTLs only.}
}
6. Tissue-specific eQTLs from GTEx (version 4; including 13 tissues).
Sourced from Science 2015, 348(6235):648-60
\itemize{
\item{\code{GTEx_V4_Adipose_Subcutaneous}: cis-eQTLs in tissue 'Adipose
Subcutaneous'.}
\item{\code{GTEx_V4_Artery_Aorta}: cis-eQTLs in tissue 'Artery Aorta'.}
\item{\code{GTEx_V4_Artery_Tibial}: cis-eQTLs in tissue 'Artery
Tibial'.}
\item{\code{GTEx_V4_Esophagus_Mucosa}: cis-eQTLs in tissue 'Esophagus
Mucosa'.}
\item{\code{GTEx_V4_Esophagus_Muscularis}: cis-eQTLs in tissue
'Esophagus Muscularis'.}
\item{\code{GTEx_V4_Heart_Left_Ventricle}: cis-eQTLs in tissue 'Heart
Left Ventricle'.}
\item{\code{GTEx_V4_Lung}: cis-eQTLs in tissue 'Lung'.}
\item{\code{GTEx_V4_Muscle_Skeletal}: cis-eQTLs in tissue 'Muscle
Skeletal'.}
\item{\code{GTEx_V4_Nerve_Tibial}: cis-eQTLs in tissue 'Nerve Tibial'.}
\item{\code{GTEx_V4_Skin_Sun_Exposed_Lower_leg}: cis-eQTLs in tissue
'Skin Sun Exposed Lower leg'.}
\item{\code{GTEx_V4_Stomach}: cis-eQTLs in tissue 'Stomach'.}
\item{\code{GTEx_V4_Thyroid}: cis-eQTLs in tissue 'Thyroid'.}
\item{\code{GTEx_V4_Whole_Blood}: cis-eQTLs in tissue 'Whole Blood'.}
}
7. eQTLs in CD4 T cells. Sourced from PLoS Genetics 2017,
13(3):e1006643
\itemize{
\item{\code{JKpg_CD4}: cis- and trans-eQTLs.}
\item{\code{JKpg_CD4_cis}: cis-eQTLs only.}
\item{\code{JKpg_CD4_trans}: trans-eQTLs only.}
}
8. eQTLs in CD8 T cells. Sourced from PLoS Genetics 2017,
13(3):e1006643
\itemize{
\item{\code{JKpg_CD8}: cis- and trans-eQTLs.}
\item{\code{JKpg_CD8_cis}: cis-eQTLs only.}
\item{\code{JKpg_CD8_trans}: trans-eQTLs only.}
}
9. eQTLs in blood. Sourced from Nature Genetics 2013, 45(10):1238-1243
\itemize{
\item{\code{WESTRAng_blood}: cis- and trans-eQTLs.}
\item{\code{WESTRAng_blood_cis}: cis-eQTLs only.}
\item{\code{WESTRAng_blood_trans}: trans-eQTLs only.}
}
10. Tissue-specific eQTLs from GTEx (version 6p; including 44 tissues).
Sourced from http://www.biorxiv.org/content/early/2016/09/09/074450
\itemize{
\item{\code{GTEx_V6p_Adipose_Subcutaneous}: cis-eQTLs in tissue
"Adipose Subcutaneous".}
\item{\code{GTEx_V6p_Adipose_Visceral_Omentum}: cis-eQTLs in tissue
"Adipose Visceral (Omentum)".}
\item{\code{GTEx_V6p_Adrenal_Gland}: cis-eQTLs in tissue "Adrenal
Gland".}
\item{\code{GTEx_V6p_Artery_Aorta}: cis-eQTLs in tissue "Artery
Aorta".}
\item{\code{GTEx_V6p_Artery_Coronary}: cis-eQTLs in tissue "Artery
Coronary".}
\item{\code{GTEx_V6p_Artery_Tibial}: cis-eQTLs in tissue "Artery
Tibial".}
\item{\code{GTEx_V6p_Brain_Anterior_cingulate_cortex_BA24}: cis-eQTLs
in tissue "Brain Anterior cingulate cortex (BA24)".}
\item{\code{GTEx_V6p_Brain_Caudate_basal_ganglia}: cis-eQTLs in tissue
"Brain Caudate (basal ganglia)".}
\item{\code{GTEx_V6p_Brain_Cerebellar_Hemisphere}: cis-eQTLs in tissue
"Brain Cerebellar Hemisphere".}
\item{\code{GTEx_V6p_Brain_Cerebellum}: cis-eQTLs in tissue "Brain
Cerebellum".}
\item{\code{GTEx_V6p_Brain_Cortex}: cis-eQTLs in tissue "Brain
Cortex".}
\item{\code{GTEx_V6p_Brain_Frontal_Cortex_BA9}: cis-eQTLs in tissue
"Brain Frontal Cortex (BA9)".}
\item{\code{GTEx_V6p_Brain_Hippocampus}: cis-eQTLs in tissue "Brain
Hippocampus".}
\item{\code{GTEx_V6p_Brain_Hypothalamus}: cis-eQTLs in tissue "Brain
Hypothalamus".}
\item{\code{GTEx_V6p_Brain_Nucleus_accumbens_basal_ganglia}: cis-eQTLs
in tissue "Brain Nucleus accumbens (basal ganglia)".}
\item{\code{GTEx_V6p_Brain_Putamen_basal_ganglia}: cis-eQTLs in tissue
"Brain Putamen (basal ganglia)".}
\item{\code{GTEx_V6p_Breast_Mammary_Tissue}: cis-eQTLs in tissue
"Breast Mammary Tissue".}
\item{\code{GTEx_V6p_Cells_EBVtransformed_lymphocytes}: cis-eQTLs in
tissue "Cells EBV-transformed lymphocytes".}
\item{\code{GTEx_V6p_Cells_Transformed_fibroblasts}: cis-eQTLs in
tissue "Cells Transformed fibroblasts".}
\item{\code{GTEx_V6p_Colon_Sigmoid}: cis-eQTLs in tissue "Colon
Sigmoid".}
\item{\code{GTEx_V6p_Colon_Transverse}: cis-eQTLs in tissue "Colon
Transverse".}
\item{\code{GTEx_V6p_Esophagus_Gastroesophageal_Junction}: cis-eQTLs in
tissue "Esophagus Gastroesophageal Junction".}
\item{\code{GTEx_V6p_Esophagus_Mucosa}: cis-eQTLs in tissue "Esophagus
Mucosa".}
\item{\code{GTEx_V6p_Esophagus_Muscularis}: cis-eQTLs in tissue
"Esophagus Muscularis".}
\item{\code{GTEx_V6p_Heart_Atrial_Appendage}: cis-eQTLs in tissue
"Heart Atrial Appendage".}
\item{\code{GTEx_V6p_Heart_Left_Ventricle}: cis-eQTLs in tissue "Heart
Left Ventricle".}
\item{\code{GTEx_V6p_Liver}: cis-eQTLs in tissue "Liver".}
\item{\code{GTEx_V6p_Lung}: cis-eQTLs in tissue "Lung".}
\item{\code{GTEx_V6p_Muscle_Skeletal}: cis-eQTLs in tissue "Muscle
Skeletal".}
\item{\code{GTEx_V6p_Nerve_Tibial}: cis-eQTLs in tissue "Nerve
Tibial".}
\item{\code{GTEx_V6p_Ovary}: cis-eQTLs in tissue "Ovary".}
\item{\code{GTEx_V6p_Pancreas}: cis-eQTLs in tissue "Pancreas".}
\item{\code{GTEx_V6p_Pituitary}: cis-eQTLs in tissue "Pituitary".}
\item{\code{GTEx_V6p_Prostate}: cis-eQTLs in tissue "Prostate".}
\item{\code{GTEx_V6p_Skin_Not_Sun_Exposed_Suprapubic}: cis-eQTLs in
tissue "Skin Not Sun Exposed (Suprapubic)".}
\item{\code{GTEx_V6p_Skin_Sun_Exposed_Lower_leg}: cis-eQTLs in tissue
"Skin Sun Exposed (Lower leg)".}
\item{\code{GTEx_V6p_Small_Intestine_Terminal_Ileum}: cis-eQTLs in
tissue "Small Intestine Terminal Ileum".}
\item{\code{GTEx_V6p_Spleen}: cis-eQTLs in tissue "Spleen".}
\item{\code{GTEx_V6p_Stomach}: cis-eQTLs in tissue "Stomach".}
\item{\code{GTEx_V6p_Testis}: cis-eQTLs in tissue "Testis".}
\item{\code{GTEx_V6p_Thyroid}: cis-eQTLs in tissue "Thyroid".}
\item{\code{GTEx_V6p_Uterus}: cis-eQTLs in tissue "Uterus".}
\item{\code{GTEx_V6p_Vagina}: cis-eQTLs in tissue "Vagina".}
\item{\code{GTEx_V6p_Whole_Blood}: cis-eQTLs in tissue "Whole Blood".}
}
11. eQTLs in eQTLGen. Sourced from bioRxiv, 2018, doi:10.1101/447367
\itemize{
\item{\code{eQTLGen}: cis- and trans-eQTLs.}
\item{\code{eQTLGen_cis}: cis-eQTLs only.}
\item{\code{eQTLGen_trans}: trans-eQTLs only.}
}
12. Single-cell-RNA-identified celltype-specific cis-eQTLs (including 9
cell types). Sourced from Nature Genetics 2018, 50(4):493-497
\itemize{
\item{\code{scRNAseq_eQTL_Bcell}: cis-eQTLs in B cells.}
\item{\code{scRNAseq_eQTL_CD4}: cis-eQTLs in CD4+ T cells.}
\item{\code{scRNAseq_eQTL_CD8}: cis-eQTLs in CD8+ T cells.}
\item{\code{scRNAseq_eQTL_DC}: cis-eQTLs in dendritic cells.}
\item{\code{scRNAseq_eQTL_cMono}: cis-eQTLs in classical monocytes.}
\item{\code{scRNAseq_eQTL_ncMono}: cis-eQTLs in nonclassical
monocytes.}
\item{\code{scRNAseq_eQTL_Mono}: cis-eQTLs in monocytes.}
\item{\code{scRNAseq_eQTL_NK}: cis-eQTLs in NK cells.}
\item{\code{scRNAseq_eQTL_PBMC}: cis-eQTLs in PBMC.}
}
13. Japanese celltype-specific cis-eQTLs (including 6 cell types).
Sourced from Nature Genetics 2017, 49(7):1120-1125
\itemize{
\item{\code{jpRNAseq_eQTL_Bcell}: cis-eQTLs in B cells.}
\item{\code{jpRNAseq_eQTL_CD4}: cis-eQTLs in CD4+ T cells.}
\item{\code{jpRNAseq_eQTL_CD8}: cis-eQTLs in CD8+ T cells.}
\item{\code{jpRNAseq_eQTL_Mono}: cis-eQTLs in monocytes.}
\item{\code{jpRNAseq_eQTL_NK}: cis-eQTLs in NK cells.}
\item{\code{jpRNAseq_eQTL_PBMC}: cis-eQTLs in PBMC.}
}
14. Pi eQTL
\itemize{
\item{\code{Pi_eQTL_CD14}: cis and trans-eQTLs in the resting/CD14+
state.}
\item{\code{Pi_eQTL_LPS2}: cis and trans-eQTLs in the activating state
induced by 2-hour LPS.}
\item{\code{Pi_eQTL_LPS24}: cis and trans-eQTLs in the activating state
induced by 24-hour LPS.}
\item{\code{Pi_eQTL_IFN}: cis and trans-eQTLs in the activating state
induced by 24-hour interferon-gamma.}
\item{\code{Pi_eQTL_Bcell}: cis and trans-eQTLs in B cells.}
\item{\code{Pi_eQTL_Blood}: cis and trans-eQTLs in the blood.}
\item{\code{Pi_eQTL_CD4}: cis and trans-eQTLs in the CD4 cells.}
\item{\code{Pi_eQTL_CD8}: cis and trans-eQTLs in the CD8 cells.}
\item{\code{Pi_eQTL_Monocyte}: cis and trans-eQTLs in the monocytes.}
\item{\code{Pi_eQTL_Neutrophil}: cis and trans-eQTLs in the
neutrophils.}
\item{\code{Pi_eQTL_NK}: cis and trans-eQTLs in the NK cells.}
\item{\code{Pi_eQTL_shared_CD14}: cis and trans-eQTLs in the
resting/CD14+ state (based on 228 individuals).}
\item{\code{Pi_eQTL_shared_LPS2}: cis and trans-eQTLs in the activating
state induced by 2-hour LPS (based on 228 individuals).}
\item{\code{Pi_eQTL_shared_LPS24}: cis and trans-eQTLs in the
activating state induced by 24-hour LPS (based on 228 individuals).}
\item{\code{Pi_eQTL_shared_IFN}: cis and trans-eQTLs in the activating
state induced by 24-hour interferon-gamma (based on 228 individuals).}
}
}
\examples{
\dontrun{
# Load the library
library(XGR)
}

RData.location <- "http://galahad.well.ox.ac.uk/bigdata"
\dontrun{
# a) provide the SNPs with the significance info
data(ImmunoBase)
gr <- ImmunoBase$AS$variants
data <- gr$Variant

# b) define eQTL genes
df_SGS <- xDefineEQTL(data, include.eQTL="JKscience_TS2A",
RData.location=RData.location)
}
}
\seealso{
\code{\link{xRDataLoader}}
}
