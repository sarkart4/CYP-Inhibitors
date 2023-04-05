#!/bin/bash

WRK="/g/g92/sarkar7/atom/titli/MoDaC/NCI_DOE_Archive/ATOM/Safety_Screen_Targets/"
echo $WRK
outdir="${WRK}output_ampl-1.4.0"
if [ ! -d $outdir ]; then
  mkdir -p $outdir;
fi
echo $outdir

source /g/g92/$USER/.bashrc
conda activate ampl-1.4.0_dev
which python

#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}chrm1_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CHRM1-ampl-1.1.0/chrm1_union_trainset_base_smiles.csv" && date
#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}chrm2_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CHRM2-ampl-1.1.0/chrm2_union_trainset_base_smiles.csv" && date
#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}chrm3_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CHRM3-ampl-1.1.0/chrm3_union_trainset_base_smiles.csv" && date

#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}cyp2c9_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CYP2C9-ampl-1.1.0/cyp2c9_union_trainset_base_smiles.csv" && date
#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}cyp2d6_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CYP2D6-ampl-1.1.0/cyp2d6_union_trainset_base_smiles.csv" && date
date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}cyp3a4_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}CYP3A4-ampl-1.1.0/cyp3a4_union_trainset_base_smiles.csv" && date

#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}hrh1_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}HRH1-ampl-1.1.0/hrh1_union_trainset_base_smiles.csv" && date
#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}kcnh2_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}KCNH2-ampl-1.1.0/kcnh2_union_trainset_base_smiles.csv" && date
#date && python /usr/WS2/sarkar7/AMPL-1.4.0/AMPL/atomsci/ddm/utils/model_retrain.py -i "${WRK}pik3cg_union_trainset_graphconv_ampl-1.1.0.tar.gz" -o $outdir -pd_type regression -dk "${WRK}PIK3CG-ampl-1.1.0/pik3cg_union_trainset_base_smiles.csv" && date
