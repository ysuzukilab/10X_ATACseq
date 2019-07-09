#!/bin/sh
#$ -S /bin/sh

<<COMMENT
usage:
sh run.sh -i ID_NAME -r REFERENCE -f FASTQS
description:
If you have more than one fastq dataset in data directory and 
want to run all of them at the same time, write the path to
data directory after -f. Otherwise, write the path to fastqs.
options:
-i ... id name
-r ... reference (GRCh38)
-f ... path to data directory or fastqs
COMMENT
while getopts i:r:f: OPT;do
        case $OPT in
	    i )ID=$OPTARG #ID_NAME
		;;
	    r )REF=$OPTARG #REFERENCE
                ;;
            f )FASTQS=$OPTARG #path to data directory or fastqs
                ;;
	    *);;
        esac
done

if [ -z "$ID" ];then
        echo "Undefined ID_NAME";
        exit 1;
fi

if [ -z "$REF" ];then
        echo "Undefined REFERENCE";
        exit 1;
fi

if [ -z "$FASTQS" ];then
        echo "path to FASTQS does not exist";
        exit 1;
fi

FILES=($(ls -1 $FASTQS))

for file in ${FILES[@]}
do
if [ -d "$FASTQS/$file" ];then
qsub -l os7 -cwd ../code/scATAC/cellranger-atac.sh -i ${ID}_${file} -r $REF -f ${FASTQS}/${file}
else
qsub -l os7 -cwd ../code/scATAC/cellranger-atac.sh -i ${ID} -r $REF -f ${FASTQS}
break
fi
done
