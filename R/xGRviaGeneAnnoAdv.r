#' Function to conduct region-based enrichment analysis given a list of genomic region sets and a list of ontologies
#'
#' \code{xGRviaGeneAnnoAdv} is supposed to conduct enrichment analysis given a list of gene sets and a list of ontologies. It is an advanced version of \code{xGRviaGeneAnno}, returning an object of the class 'ls_eTerm'.
#'
#' @param list_vec an input vector containing genomic regions. Alternatively it can be a list of vectors, representing multiple groups of genomic regions. Formatted as "chr:start-end" are genomic regions
#' @param background a background vector containing genomic regions (formatted as "chr:start-end") as the test background. If NULL, by default all annotatable are used as background
#' @param build.conversion the conversion from one genome build to another. The conversions supported are "hg38.to.hg19" and "hg18.to.hg19". By default it is NA (no need to do so)
#' @param gap.max the maximum distance to nearby genes. Only those genes no far way from this distance will be considered as nearby genes. By default, it is 0 meaning that nearby genes are those overlapping with genomic regions
#' @param GR.Gene the genomic regions of genes. By default, it is 'UCSC_knownGene', that is, UCSC known genes (together with genomic locations) based on human genome assembly hg19. It can be 'UCSC_knownCanonical', that is, UCSC known canonical genes (together with genomic locations) based on human genome assembly hg19. Alternatively, the user can specify the customised input. To do so, first save your RData file (containing an GR object) into your local computer, and make sure the GR object content names refer to Gene Symbols. Then, tell "GR.Gene" with your RData file name (with or without extension), plus specify your file RData path in "RData.location"
#' @param ontologies the ontologies supported currently. By default, it is 'NA' to disable this option. Pre-built ontology and annotation data are detailed in \code{\link{xDefineOntology}}.
#' @param size.range the minimum and maximum size of members of each term in consideration. By default, it sets to a minimum of 10 but no more than 2000
#' @param min.overlap the minimum number of overlaps. Only those terms with members that overlap with input data at least min.overlap (3 by default) will be processed
#' @param which.distance which terms with the distance away from the ontology root (if any) is used to restrict terms in consideration. By default, it sets to 'NULL' to consider all distances
#' @param test the test statistic used. It can be "fisher" for using fisher's exact test, "hypergeo" for using hypergeometric test, or "binomial" for using binomial test. Fisher's exact test is to test the independence between gene group (genes belonging to a group or not) and gene annotation (genes annotated by a term or not), and thus compare sampling to the left part of background (after sampling without replacement). Hypergeometric test is to sample at random (without replacement) from the background containing annotated and non-annotated genes, and thus compare sampling to background. Unlike hypergeometric test, binomial test is to sample at random (with replacement) from the background with the constant probability. In terms of the ease of finding the significance, they are in order: hypergeometric test > fisher's exact test > binomial test. In other words, in terms of the calculated p-value, hypergeometric test < fisher's exact test < binomial test
#' @param background.annotatable.only logical to indicate whether the background is further restricted to the annotatable. By default, it is NULL: if ontology.algorithm is not 'none', it is always TRUE; otherwise, it depends on the background (if not provided, it will be TRUE; otherwise FALSE). Surely, it can be explicitly stated
#' @param p.tail the tail used to calculate p-values. It can be either "two-tails" for the significance based on two-tails (ie both over- and under-overrepresentation)  or "one-tail" (by default) for the significance based on one tail (ie only over-representation)
#' @param p.adjust.method the method used to adjust p-values. It can be one of "BH", "BY", "bonferroni", "holm", "hochberg" and "hommel". The first two methods "BH" (widely used) and "BY" control the false discovery rate (FDR: the expected proportion of false discoveries amongst the rejected hypotheses); the last four methods "bonferroni", "holm", "hochberg" and "hommel" are designed to give strong control of the family-wise error rate (FWER). Notes: FDR is a less stringent condition than FWER
#' @param ontology.algorithm the algorithm used to account for the hierarchy of the ontology. It can be one of "none", "pc", "elim" and "lea". For details, please see 'Note' below
#' @param elim.pvalue the parameter only used when "ontology.algorithm" is "elim". It is used to control how to declare a signficantly enriched term (and subsequently all genes in this term are eliminated from all its ancestors)
#' @param lea.depth the parameter only used when "ontology.algorithm" is "lea". It is used to control how many maximum depth is used to consider the children of a term (and subsequently all genes in these children term are eliminated from the use for the recalculation of the signifance at this term)
#' @param path.mode the mode of paths induced by vertices/nodes with input annotation data. It can be "all_paths" for all possible paths to the root, "shortest_paths" for only one path to the root (for each node in query), "all_shortest_paths" for all shortest paths to the root (i.e. for each node, find all shortest paths with the equal lengths)
#' @param true.path.rule logical to indicate whether the true-path rule should be applied to propagate annotations. By default, it sets to false
#' @param verbose logical to indicate whether the messages will be displayed in the screen. By default, it sets to false for no display
#' @param silent logical to indicate whether the messages will be silent completely. By default, it sets to false. If true, verbose will be forced to be false
#' @param plot logical to indicate whether heatmap plot is drawn
#' @param fdr.cutoff fdr cutoff used to declare the significant terms. By default, it is set to 0.05. This option only works when setting plot (see above) is TRUE
#' @param displayBy which statistics will be used for drawing heatmap. It can be "fc" for enrichment fold change, "fdr" for adjusted p value (or FDR), "pvalue" for p value, "zscore" for enrichment z-score (by default), "or" for odds ratio. This option only works when setting plot (see above) is TRUE
#' @param RData.location the characters to tell the location of built-in RData files. See \code{\link{xRDataLoader}} for details
#' @return 
#' an object of class "ls_eTerm", a list with following components:
#' \itemize{
#'  \item{\code{df}: a data frame of n x 12, where the 12 columns are "group" (the input group names), "ontology" (input ontologies), "id" (term ID), "name" (term name), "nAnno" (number in members annotated by a term), "nOverlap" (number in overlaps), "fc" (enrichment fold changes), "zscore" (enrichment z-score), "pvalue" (nominal p value), "adjp" (adjusted p value (FDR)), "or" (odds ratio), "CIl" (lower bound confidence interval for the odds ratio), "CIu" (upper bound confidence interval for the odds ratio), "distance" (term distance or other information), "members" (members (represented as Gene Symbols) in overlaps)}
#'  \item{\code{mat}: NULL if the plot is not drawn; otherwise, a matrix of term names X groups with numeric values for the signficant enrichment, NA for the insignificant ones}
#'  \item{\code{gp}: NULL if the plot is not drawn; otherwise, a 'ggplot' object}
#' }
#' @note none
#' @export
#' @seealso \code{\link{xRDataLoader}}, \code{\link{xGRviaGeneAnno}}, \code{\link{xEnrichViewer}}, \code{\link{xHeatmap}}
#' @include xGRviaGeneAnnoAdv.r
#' @examples
#' \dontrun{
#' # Load the library
#' library(XGR)
#' RData.location <- "http://galahad.well.ox.ac.uk/bigdata/"
#' 
#' # Enrichment analysis for GWAS SNPs from ImmunoBase
#' ## a) provide input data (bed-formatted)
#' data.file <- "http://galahad.well.ox.ac.uk/bigdata/ImmunoBase_GWAS.bed"
#' input <- read.delim(file=data.file, header=T, stringsAsFactors=F)
#' data <- paste0(input$chrom, ':', (input$chromStart+1), '-', input$chromEnd)
#' 
#' # b) perform enrichment analysis
#' ## overlap with gene body
#' ls_eTerm <- xGRviaGeneAnnoAdv(data, gap.max=0, ontologies=c("REACTOME_ImmuneSystem","REACTOME_SignalTransduction"), RData.location=RData.location)
#' ls_eTerm
#' ## forest plot of enrichment results
#' gp <- xEnrichForest(ls_eTerm, top_num=10, CI.one=F)
#' gp
#' }

xGRviaGeneAnnoAdv <- function(list_vec, background=NULL, build.conversion=c(NA,"hg38.to.hg19","hg18.to.hg19"), gap.max=0, GR.Gene=c("UCSC_knownGene","UCSC_knownCanonical"), ontologies=NA, size.range=c(10,2000), min.overlap=5, which.distance=NULL, test=c("fisher","hypergeo","binomial"), background.annotatable.only=NULL, p.tail=c("one-tail","two-tails"), p.adjust.method=c("BH", "BY", "bonferroni", "holm", "hochberg", "hommel"), ontology.algorithm=c("none","pc","elim","lea"), elim.pvalue=1e-2, lea.depth=2, path.mode=c("all_paths","shortest_paths","all_shortest_paths"), true.path.rule=F, verbose=T, silent=FALSE, plot=TRUE, fdr.cutoff=0.05, displayBy=c("zscore","fdr","pvalue","fc","or"), RData.location="http://galahad.well.ox.ac.uk/bigdata")
{
    startT <- Sys.time()
    if(!silent){
    	message(paste(c("Start at ",as.character(startT)), collapse=""), appendLF=TRUE)
    	message("", appendLF=TRUE)
    }else{
    	verbose <- FALSE
    }
    ####################################################################################
    
    ## match.arg matches arg against a table of candidate values as specified by choices, where NULL means to take the first one
    build.conversion <- match.arg(build.conversion)
    test <- match.arg(test)
    p.tail <- match.arg(p.tail)
    p.adjust.method <- match.arg(p.adjust.method)
    ontology.algorithm <- match.arg(ontology.algorithm)
    path.mode <- match.arg(path.mode)
    displayBy <- match.arg(displayBy)
    
    ############
    if(length(list_vec)==0){
    	return(NULL)
    }
    ############
    if(is.vector(list_vec) & class(list_vec)!="list"){
    	list_vec <- list(list_vec)
	}else if(class(list_vec)=="list"){
		## Remove null elements in a list
		list_vec <- base::Filter(base::Negate(is.null), list_vec)
		if(length(list_vec)==0){
			return(NULL)
		}	
    }else{
        stop("The input data must be a vector or a list of vectors.\n")
    }
    
	list_names <- names(list_vec)
	if(is.null(list_names)){
		list_names <- paste0('G', 1:length(list_vec))
		names(list_vec) <- list_names
	}
    
    ls_df <- lapply(1:length(list_vec), function(i){
		
		if(verbose){
			message(sprintf("Analysing group %d ('%s') (%s) ...", i, names(list_vec)[i], as.character(Sys.time())), appendLF=T)
		}
		data <- list_vec[[i]]
    	
    	ls_df <- lapply(1:length(ontologies), function(j){
			if(verbose){
				message(sprintf("\tontology %d ('%s') (%s) ...", j, ontologies[j], as.character(Sys.time())), appendLF=T)
			}
			ontology <- ontologies[j]
			
			eTerm <- xGRviaGeneAnno(data.file=data, background.file=background, format.file="chr:start-end", build.conversion=build.conversion, gap.max=gap.max, GR.Gene=GR.Gene, ontology=ontology, size.range=size.range, min.overlap=min.overlap, which.distance=which.distance, test=test, background.annotatable.only=background.annotatable.only, p.tail=p.tail, p.adjust.method=p.adjust.method, ontology.algorithm=ontology.algorithm, elim.pvalue=elim.pvalue, lea.depth=lea.depth, path.mode=path.mode, true.path.rule=true.path.rule, verbose=verbose, RData.location=RData.location)
			df <- xEnrichViewer(eTerm, top_num="all", sortBy="or", details=TRUE)
			
			if(is.null(df)){
				return(NULL)
			}else{
				cbind(group=rep(names(list_vec)[i],nrow(df)), ontology=rep(ontology,nrow(df)), id=rownames(df), df, stringsAsFactors=F)
			}
		})
		df <- do.call(rbind, ls_df)
	})
    df_all <- do.call(rbind, ls_df)
    
    ## heatmap view
    if(plot & !is.null(df_all)){

    	adjp <- NULL
    	
    	gp <- NULL
    	mat <- NULL
    	
    	ls_df <- split(x=df_all[,-12], f=df_all$ontology)
    	#######
    	## keep the same order for ontologies as input
    	ls_df <- ls_df[unique(df_all$ontology)]
    	#######
		ls_mat <- lapply(1:length(ls_df), function(i){
		
			df <- ls_df[[i]]
			ind <- which(df$adjp < fdr.cutoff)
			if(length(ind)>=1){
				df <- as.data.frame(df %>% dplyr::filter(adjp < fdr.cutoff))
				
				if(displayBy=='fdr'){
					mat <- as.matrix(xSparseMatrix(df[,c('name','group','adjp')], rows=unique(df$name), columns=names(list_vec)))
					mat[mat==0] <- NA
					mat <- -log10(mat)
				}else if(displayBy=='pvalue'){
					mat <- as.matrix(xSparseMatrix(df[,c('name','group','pvalue')], rows=unique(df$name), columns=names(list_vec)))
					mat[mat==0] <- NA
					mat <- -log10(mat)
				}else if(displayBy=='zscore'){
					mat <- as.matrix(xSparseMatrix(df[,c('name','group','zscore')], rows=unique(df$name), columns=names(list_vec)))
					mat[mat==0] <- NA
				}else if(displayBy=='fc'){
					mat <- as.matrix(xSparseMatrix(df[,c('name','group','fc')], rows=unique(df$name), columns=names(list_vec)))
					mat[mat==0] <- NA
					mat <- log2(mat)
				}else if(displayBy=='or'){
					mat <- as.matrix(xSparseMatrix(df[,c('name','group','or')], rows=unique(df$name), columns=names(list_vec)))
					mat[mat==0] <- NA
					mat <- log2(mat)
				}
				
				if(nrow(mat)==1){
					df_mat <- mat
				}else{
					
					## order by the length of names
					rname_ordered <- rownames(mat)[order(-nchar(rownames(mat)))]
					## order by the evolutionary ages
					if(names(ls_df)[i]=='PS2'){
						df_tmp <- unique(df[,c('id','name')])
						df_tmp <- df_tmp[with(df_tmp, order(as.numeric(df_tmp$id))),]
						rname_ordered <- df_tmp$name
					}
					
					ind <- match(rname_ordered, rownames(mat))
					df_mat <- as.matrix(mat[ind,], ncol=ncol(mat))
					colnames(df_mat) <- colnames(mat)
					
					colnames(df_mat) <- colnames(mat)
				}
				return(df_mat)
					
			}else{
				return(NULL)
			}
			
		})
		mat <- do.call(rbind, ls_mat)
		
		if(!is.null(mat)){
			if(displayBy=='fdr' | displayBy=='pvalue'){
				colormap <- 'grey100-darkorange'
				zlim <- c(0, ceiling(max(mat[!is.na(mat)])))
				
				if(displayBy=='fdr'){
					legend.title <- expression(-log[10]("FDR"))
				}else if(displayBy=='pvalue'){
					legend.title <- expression(-log[10]("p-value"))
				}
				
			}else if(displayBy=='fc' | displayBy=='zscore' | displayBy=='or'){
				tmp_max <- ceiling(max(mat[!is.na(mat)]))
				tmp_min <- floor(min(mat[!is.na(mat)]))
				if(tmp_max>0 & tmp_min<0){
					colormap <- 'deepskyblue-grey100-darkorange'	
					tmp <- max(tmp_max, abs(tmp_min))
					zlim <- c(-tmp, tmp)
				}else if(tmp_max<=0){
					colormap <- 'deepskyblue-grey100'	
					zlim <- c(tmp_min, 0)
				}else if(tmp_min>=0){
					colormap <- 'grey100-darkorange'	
					zlim <- c(0, tmp_max)
				}
				
				if(displayBy=='fc'){
					legend.title <- expression(log[2]("FC"))
				}else if(displayBy=='zscore'){	
					legend.title <- ("Z-score")
				}else if(displayBy=='or'){	
					legend.title <- expression(log[2]("OR"))
				}
			}
		
			gp <- xHeatmap(mat, reorder="none", colormap=colormap, ncolors=64, zlim=zlim, legend.title=legend.title, barwidth=0.4, x.rotate=60, shape=19, size=2, x.text.size=6,y.text.size=6, na.color='transparent',barheight=max(3,min(5,nrow(mat))))
			gp <- gp + theme(legend.title=element_text(size=8))
		}
		
    }else{
    	gp <- NULL
    	mat <- NULL
    }
    
    ls_eTerm <- list(df = df_all,
    			   mat = mat,
    			   gp = gp
                 )
    class(ls_eTerm) <- "ls_eTerm"
    ####################################################################################
    endT <- Sys.time()
    runTime <- as.numeric(difftime(strptime(endT, "%Y-%m-%d %H:%M:%S"), strptime(startT, "%Y-%m-%d %H:%M:%S"), units="secs"))
    
    if(!silent){
    	message(paste(c("\nEnd at ",as.character(endT)), collapse=""), appendLF=TRUE)
    	message(paste(c("Runtime in total is: ",runTime," secs\n"), collapse=""), appendLF=TRUE)
    }
    
    invisible(ls_eTerm)
}
