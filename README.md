# scATAC
## Usage
1. install
* Enter your information from [this link](https://support.10xgenomics.com/single-cell-atac/software/downloads/latest)
* Install cellranger-atac **using your own token&id**
```
mkdir tools
cd tools
// Example
wget -O cellranger-atac-1.1.0.tar.gz "http://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-1.1.0.tar.gz?Expires=(put your token&id)"
```
* Get references
if you want to get more references, see [this link](https://support.10xgenomics.com/single-cell-atac/software/downloads/latest)
```
qsub -l os7 -cwd path/to/install.sh

// for test
export PATH=tools/cellranger-atac-1.1.0:$PATH
cellranger-atac testrun --id=tiny
```
2. run
```
// Example
qsub -l os7 -cwd path/to/run.sh -i ID_NAME -r path/to/REFERENCE -f path/to/FASTQS
```
## directory
```
.
├── _code
|   ├── install.sh
|   ├── cellranger-atac.sh
|   └── run.sh
└── _tools
    ├─ cellranger-atac-1.1.0
    _reference
    └─ refdata-cellranger-atac-GRCh38-1.1.0

```
