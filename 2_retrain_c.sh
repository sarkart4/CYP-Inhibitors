#!/bin/bash

WRK="/g/g92/sarkar7/atom/titli/MoDaC/NCI_DOE_Archive/ATOM/Cancer_Kinase_Selectivity/"
echo $WRK
outdir="${WRK}output_ampl-1.4.0"
if [ ! -d $outdir ]; then
  mkdir -p $outdir;
fi
echo $outdir

source /g/g92/$USER/.bashrc
conda activate ampl-1.4.0_dev
which python

date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}aurka_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}./AURKA-ampl-1.1.0/aurka_union_trainset_base_smiles.csv" && date
date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}aurkb_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}./AURKB-ampl-1.1.0/aurkb_union_trainset_base_smiles.csv" && date
