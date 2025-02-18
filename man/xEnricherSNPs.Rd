% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xEnricherSNPs.r
\name{xEnricherSNPs}
\alias{xEnricherSNPs}
\title{Function to conduct enrichment analysis given a list of SNPs and the ontology in query}
\usage{
xEnricherSNPs(data, background = NULL, ontology = c("EF", "EF_disease",
"EF_phenotype", "EF_bp"), include.LD = NA, LD.r2 = 0.8,
size.range = c(10, 2000), min.overlap = 5, which.distance = NULL,
test = c("fisher", "hypergeo", "binomial"),
background.annotatable.only = NULL, p.tail = c("one-tail",
"two-tails"), p.adjust.method = c("BH", "BY", "bonferroni", "holm",
"hochberg", "hommel"), ontology.algorithm = c("none", "pc", "elim",
"lea"), elim.pvalue = 0.01, lea.depth = 2,
path.mode = c("all_paths", "shortest_paths", "all_shortest_paths"),
true.path.rule = T, verbose = T, silent = FALSE,
RData.location = "http://galahad.well.ox.ac.uk/bigdata")
}
\arguments{
\item{data}{an input vector. It contains a list of SNPs of interest}

\item{background}{a background vector. It contains a list of SNPs as
the test background. If NULL, by default all annotatable are used as
background}

\item{ontology}{the ontology supported currently. Now it is only "EF"
for Experimental Factor Ontology (used to annotate GWAS Catalog SNPs).
However, there are several subparts of this ontology to choose:
'EF_disease' for the subpart under the term 'disease' (EFO:0000408),
'EF_phenotype' for the subpart under the term 'phenotype'
(EFO:0000651), 'EF_bp' for the subpart under the term 'biological
process' (GO:0008150)}

\item{include.LD}{additional SNPs in LD with Lead SNPs are also
included. By default, it is 'NA' to disable this option. Otherwise, LD
SNPs will be included based on one or more of 26 populations and 5
super populations from 1000 Genomics Project data (phase 3). The
population can be one of 5 super populations ("AFR", "AMR", "EAS",
"EUR", "SAS"), or one of 26 populations ("ACB", "ASW", "BEB", "CDX",
"CEU", "CHB", "CHS", "CLM", "ESN", "FIN", "GBR", "GIH", "GWD", "IBS",
"ITU", "JPT", "KHV", "LWK", "MSL", "MXL", "PEL", "PJL", "PUR", "STU",
"TSI", "YRI"). Explanations for population code can be found at
\url{http://www.1000genomes.org/faq/which-populations-are-part-your-study}}

\item{LD.r2}{the LD r2 value. By default, it is 0.8, meaning that SNPs
in LD (r2>=0.8) with input SNPs will be considered as LD SNPs. It can
be any value from 0.8 to 1}

\item{size.range}{the minimum and maximum size of members of each term
in consideration. By default, it sets to a minimum of 10 but no more
than 2000}

\item{min.overlap}{the minimum number of overlaps. Only those terms
with members that overlap with input data at least min.overlap (3 by
default) will be processed}

\item{which.distance}{which terms with the distance away from the
ontology root (if any) is used to restrict terms in consideration. By
default, it sets to 'NULL' to consider all distances}

\item{test}{the test statistic used. It can be "fisher" for using
fisher's exact test, "hypergeo" for using hypergeometric test, or
"binomial" for using binomial test. Fisher's exact test is to test the
independence between gene group (genes belonging to a group or not) and
gene annotation (genes annotated by a term or not), and thus compare
sampling to the left part of background (after sampling without
replacement). Hypergeometric test is to sample at random (without
replacement) from the background containing annotated and non-annotated
genes, and thus compare sampling to background. Unlike hypergeometric
test, binomial test is to sample at random (with replacement) from the
background with the constant probability. In terms of the ease of
finding the significance, they are in order: hypergeometric test >
fisher's exact test > binomial test. In other words, in terms of the
calculated p-value, hypergeometric test < fisher's exact test <
binomial test}

\item{background.annotatable.only}{logical to indicate whether the
background is further restricted to the annotatable. By default, it is
NULL: if ontology.algorithm is not 'none', it is always TRUE;
otherwise, it depends on the background (if not provided, it will be
TRUE; otherwise FALSE). Surely, it can be explicitly stated}

\item{p.tail}{the tail used to calculate p-values. It can be either
"two-tails" for the significance based on two-tails (ie both over- and
under-overrepresentation) or "one-tail" (by default) for the
significance based on one tail (ie only over-representation)}

\item{p.adjust.method}{the method used to adjust p-values. It can be
one of "BH", "BY", "bonferroni", "holm", "hochberg" and "hommel". The
first two methods "BH" (widely used) and "BY" control the false
discovery rate (FDR: the expected proportion of false discoveries
amongst the rejected hypotheses); the last four methods "bonferroni",
"holm", "hochberg" and "hommel" are designed to give strong control of
the family-wise error rate (FWER). Notes: FDR is a less stringent
condition than FWER}

\item{ontology.algorithm}{the algorithm used to account for the
hierarchy of the ontology. It can be one of "none", "pc", "elim" and
"lea". For details, please see 'Note' below}

\item{elim.pvalue}{the parameter only used when "ontology.algorithm" is
"elim". It is used to control how to declare a signficantly enriched
term (and subsequently all genes in this term are eliminated from all
its ancestors)}

\item{lea.depth}{the parameter only used when "ontology.algorithm" is
"lea". It is used to control how many maximum depth is used to consider
the children of a term (and subsequently all genes in these children
term are eliminated from the use for the recalculation of the
signifance at this term)}

\item{path.mode}{the mode of paths induced by vertices/nodes with input
annotation data. It can be "all_paths" for all possible paths to the
root, "shortest_paths" for only one path to the root (for each node in
query), "all_shortest_paths" for all shortest paths to the root (i.e.
for each node, find all shortest paths with the equal lengths)}

\item{true.path.rule}{logical to indicate whether the true-path rule
should be applied to propagate annotations. By default, it sets to
true}

\item{verbose}{logical to indicate whether the messages will be
displayed in the screen. By default, it sets to false for no display}

\item{silent}{logical to indicate whether the messages will be silent
completely. By default, it sets to false. If true, verbose will be
forced to be false}

\item{RData.location}{the characters to tell the location of built-in
RData files. See \code{\link{xRDataLoader}} for details}
}
\value{
an object of class "eTerm", a list with following components:
\itemize{
\item{\code{term_info}: a matrix of nTerm X 4 containing snp/gene set
information, where nTerm is the number of terms, and the 4 columns are
"id" (i.e. "Term ID"), "name" (i.e. "Term Name"), "namespace" and
"distance"}
\item{\code{annotation}: a list of terms containing annotations, each
term storing its annotations. Always, terms are identified by "id"}
\item{\code{g}: an igraph object to represent DAG}
\item{\code{data}: a vector containing input data in consideration. It
is not always the same as the input data as only those mappable are
retained}
\item{\code{background}: a vector containing the background data. It is
not always the same as the input data as only those mappable are
retained}
\item{\code{overlap}: a list of overlapped snp/gene sets, each storing
snps overlapped between a snp/gene set and the given input data (i.e.
the snps of interest). Always, gene sets are identified by "id"}
\item{\code{fc}: a vector containing fold changes}
\item{\code{zscore}: a vector containing z-scores}
\item{\code{pvalue}: a vector containing p-values}
\item{\code{adjp}: a vector containing adjusted p-values. It is the p
value but after being adjusted for multiple comparisons}
\item{\code{or}: a vector containing odds ratio}
\item{\code{CIl}: a vector containing lower bound confidence interval
for the odds ratio}
\item{\code{CIu}: a vector containing upper bound confidence interval
for the odds ratio}
\item{\code{cross}: a matrix of nTerm X nTerm, with an on-diagnal cell
for the overlapped-members observed in an individaul term, and
off-diagnal cell for the overlapped-members shared betwene two terms}
\item{\code{call}: the call that produced this result}
}
}
\description{
\code{xEnricherSNPs} is supposed to conduct enrichment analysis given
the input data and the ontology in query. It returns an object of class
"eTerm". Enrichment analysis is based on either Fisher's exact test or
Hypergeometric test. The test can respect the hierarchy of the
ontology. Now it supports enrichment analysis for SNPs using GWAS
Catalog traits mapped to Experimental Factor Ontology. If required,
additional SNPs that are in linkage disequilibrium (LD) with input SNPs
are also be used for test.
}
\note{
The interpretation of the algorithms used to account for the hierarchy
of the ontology is:
\itemize{
\item{"none": does not consider the ontology hierarchy at all.}
\item{"lea": computers the significance of a term in terms of the
significance of its children at the maximum depth (e.g. 2). Precisely,
once snps are already annotated to any children terms with a more
signficance than itself, then all these snps are eliminated from the
use for the recalculation of the signifance at that term. The final
p-values takes the maximum of the original p-value and the recalculated
p-value.}
\item{"elim": computers the significance of a term in terms of the
significance of its all children. Precisely, once snps are already
annotated to a signficantly enriched term under the cutoff of e.g.
pvalue<1e-2, all these snps are eliminated from the ancestors of that
term).}
\item{"pc": requires the significance of a term not only using the
whole snps as background but also using snps annotated to all its
direct parents/ancestors as background. The final p-value takes the
maximum of both p-values in these two calculations.}
\item{"Notes": the order of the number of significant terms is: "none"
> "lea" > "elim" > "pc".}
}
}
\examples{
\dontrun{
# Load the library
library(XGR)
RData.location <- "http://galahad.well.ox.ac.uk/bigdata/"

# SNP-based enrichment analysis using GWAS Catalog traits (mapped to EF)
# a) provide the input SNPs of interest (eg 'EFO:0002690' for 'systemic lupus erythematosus')
## load GWAS SNPs annotated by EF (an object of class "dgCMatrix" storing a spare matrix)
anno <- xRDataLoader(RData='GWAS2EF', RData.location=RData.location)
ind <- which(colnames(anno)=='EFO:0002690')
data <- rownames(anno)[anno[,ind]!=0]
data

# optionally, provide the test background (if not provided, all annotatable SNPs)
#background <- rownames(anno)

# b) perform enrichment analysis
eTerm <- xEnricherSNPs(data=data, ontology="EF",
path.mode=c("all_paths"), RData.location=RData.location)

# b') optionally, enrichment analysis for input SNPs plus their LD SNPs
## LD based on European population (EUR) with r2>=0.8
#eTerm <- xEnricherSNPs(data=data, include.LD="EUR", LD.r2=0.8, RData.location=RData.location)

# c) view enrichment results for the top significant terms
xEnrichViewer(eTerm)

# d) save enrichment results to the file called 'EF_enrichments.txt'
res <- xEnrichViewer(eTerm, top_num=length(eTerm$adjp), sortBy="adjp",
details=TRUE)
output <- data.frame(term=rownames(res), res)
utils::write.table(output, file="EF_enrichments.txt", sep="\\t",
row.names=FALSE)

# e) barplot of significant enrichment results
bp <- xEnrichBarplot(eTerm, top_num="auto", displayBy="adjp")
print(bp)

# f) visualise the top 10 significant terms in the ontology hierarchy
# color-code terms according to the adjust p-values (taking the form of 10-based negative logarithm)
xEnrichDAGplot(eTerm, top_num=10, displayBy="adjp",
node.info=c("full_term_name"))
# color-code terms according to the z-scores
xEnrichDAGplot(eTerm, top_num=10, displayBy="zscore",
node.info=c("full_term_name"))
}
}
\seealso{
\code{\link{xRDataLoader}}, \code{\link{xEnricher}}
}
