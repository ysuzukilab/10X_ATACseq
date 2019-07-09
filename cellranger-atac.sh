#!/bin/sh
#$ -S /bin/sh
#$ -l s_vmem=75G
#$ -l mem_req=75G
#-pe def_slot 8

<<COMMENT
usage: 
qsub -l os7 -cwd cellranger-atac.sh -i ID_NAME -r REFERENCE \
-f FASTQS
options:
-i ... id name
-r ... reference (GRCh38 or mm10)
-f ... path to fastqs
description:
analysis of fastqs by cellranger
COMMENT

ulimit -v unlimited
export PATH=tools/cellranger-atac-1.1.0/:$PATH
while getopts i:r:f: OPT;do
        case $OPT in
                i )ID=$OPTARG #ID_NAME
                        ;;
                r )REF=$OPTARG #REFERENCE
                        ;;
                f )FASTQS=$OPTARG #path to fastqs
                        ;;
                *?)usage
                        ;;
        esac
done

cellranger-atac count --id=${ID} \
 --reference=${REF}/ \
 --fastqs=${FASTQS} \
 --localcores=8 --localmem=90
