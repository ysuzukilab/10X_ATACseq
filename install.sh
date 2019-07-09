#!/bin/sh
#$ -S /bin/sh
#$ -l s_vmem=48G
#$ -l mem_req=48G
#-pe def_slot 4

<<COMMENT
usage: qsub -l os7 -cwd install.sh
execute in your scATAC directory
COMMENT

mkdir tools
cd tools
wget -O cellranger-atac-1.1.0.tar.gz "http://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-1.1.0.tar.gz?Expires=1562707306&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWF0YWMvY2VsbHJhbmdlci1hdGFjLTEuMS4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU2MjcwNzMwNn19fV19&Signature=ApMv9crTGmLoWJZBdia1c0seOWMfOGgzmChuSC7v0QTnHvp-7tTG~yJcrjWYAKHo53uVtgKVzlRW-FzU2HKl4Pqxp3cVpRLBrjkKBGDG9L~NteT3WcLjKqjuFxSpzTv-ZZGcBtV0lTp~jyv6aqwrytJqvNzxL7H0h1jVuAXhxoJB7l1Y3uBFrq4OHL-84qkBuWJxuzBgShOs3oNkNkp0oAObrepG5FEig1K-v~y-lY0jrRU~iQIZyDjv5KX-7zyg~x7cZs1lxzCmbcXbYMYh8S7qWMT7aXQh3KTlqDTMr9qQxRxvxaXdgbkXBGIqQQGSQ3pUhST054ZUkA9XofvQMg__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
tar -xzvf cellranger-atac-1.1.0.tar.gz
rm cellranger-atac-1.1.0.tar.gz
cd ..
mkdir reference
cd reference
wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-1.1.0.tar.gz
tar -xzvf refdata-cellranger-atac-GRCh38-1.1.0.tar.gz
rm refdata-cellranger-atac-GRCh38-1.1.0.tar.gz

export PATH=/opt/cellranger-atac-1.1.0:$PATH
