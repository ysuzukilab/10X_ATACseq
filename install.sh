#!/bin/sh
#$ -S /bin/sh
#$ -l s_vmem=48G
#$ -l mem_req=48G
#-pe def_slot 4

<<COMMENT
usage: qsub -l os7 -cwd install.sh
execute in your scATAC directory
COMMENT

cd tools
tar -xzvf cellranger-atac-1.1.0.tar.gz
rm cellranger-atac-1.1.0.tar.gz
cd ..
mkdir reference
cd reference
wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-1.1.0.tar.gz
tar -xzvf refdata-cellranger-atac-GRCh38-1.1.0.tar.gz
rm refdata-cellranger-atac-GRCh38-1.1.0.tar.gz

export PATH=/opt/cellranger-atac-1.1.0:$PATH
