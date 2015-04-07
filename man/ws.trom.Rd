\name{ws.trom}
\alias{ws.trom}
\title{
Within-species transcriptome mapping
}
\description{
This function calculates the TROM scores in comparing/mapping samples from the same species. TROM score = -log\eqn{_{10}}{10}(Bonferroni-corrected \emph{p}-value from a hypergeometric test), with a minimum value of 0.
}
\usage{
ws.trom(sp_gene_expr, z_thre = 1.5, FPKM_thre = 1, 
    provide = FALSE, gene_lists = "", save_overlap_genes = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Required.
}
  \item{z_thre}{
a numeric value specifiying the Z-score threshold used to select associated genes, whose Z-scores \eqn{\ge} \code{z_thre}. Defaults to 1.5.
}
  \item{FPKM_thre}{
a numeric value specifying FPKM threshold used to select associated genes, whose FPKM \eqn{\ge} \code{FPKM_thre}. Defaults to 1.
}
  \item{provide}{
a Boolean value indicating whether associated genes are user-provided. If \code{provide = TRUE}, the users need to provide lists of genes that they think can represent the transcriptome characteristics of different samples. 
}
  \item{gene_lists}{
an .xlsx file containing user-provided gene lists. It is required when \code{provide = TRUE}.
}
  \item{save_overlap_genes}{
a Boolean value indicating whether the users want to save overlap genes between every two samples from the species to an .xlsx file. If \code{save_overlap_genes = TRUE}, this function outputs the overlap genes to "within-species overlapping genes between sample pairs.xlsx". Defaults to FALSE.
}
}
\details{
If \code{provide = TRUE}, users provide gene lists with \code{gene_lists} to calculate the TROM scores; otherwise, the function will automatically select associated genes based on the criterion: Z-scores \eqn{\ge} \code{z_thre} and FPKM \eqn{\ge} \code{FPKM_thre}.

If provided, \code{gene_lists} should be a one-sheet Excel file. In the Excel file, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column. Please note that different columns may have different numbers of rows.

This function outputs the within-species TROM scores into an .xlsx file named "within-species TROM scores.xlsx".
}
\value{
A square matrix of within-species TROM scores, where rows and columns correspond to the samples of the species respectively.
}
\references{
Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\author{
Jingyi Jessica Li, Wei Li
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bs.trom}}, \code{\link{ws.trom.orthologs}}
}
\examples{
## Calculating transcriptome overlap measure within D. melanogaster 

## without user-provided gene lists
## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
dm_trom <- ws.trom(sp_gene_expr = dm_gene_expr, z_thre = 1.5, 
                     FPKM_thre = 1, provide = FALSE, save_overlap_genes = TRUE)

## with user-provided gene lists
gene_lists <- system.file("dm_associated_genes.xlsx", package = "TROM")
dm_trom_2 <- ws.trom(provide = TRUE, gene_lists = gene_lists)}
}

