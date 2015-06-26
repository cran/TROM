\name{choose.z}
\alias{choose.z}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Choose the suggested threshold of Z-scores
}
\description{
This function calculates the suggested \code{z_thre} for within-species comparison. The suggested \code{z_thre} gives the most sparse but still stable correspondance map of the transcriptomes.
}
\usage{
choose.z(sp_gene_expr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Required.
}
}
\details{
This function calculates the suggested \code{z_thre} for the species corresponding to \code{sp_gene_expr} to select associated genes and calculate TROM scores. The users can tune \code{z_thre} based on the mapping results calculated from the suggested \code{z_thre}.
}
\value{
A numeric vector of length one containing the suggested \code{z_thre}.
}

\author{
Jingyi Jessica Li, Wei Vivian Li}


\seealso{
\code{\link{ws.trom}}, \code{\link{ws.trom.orthologs}}
}
\examples{
## Calculating the suggested z_thre for D. melanogaster 

## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
z_thre <- choose.z(dm_gene_expr)
}
}