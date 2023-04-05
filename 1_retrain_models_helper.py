# -*- coding: utf-8 -*-
"""
Created on Fri May 13 14:34:41 2022

@author: sarkart4

This code attempts to gather necessary informations from LC to retrain models they have already deleloped  Needed:
    1. split_uuid ()
    2. ampl_version 
    3. featurizer 
"""

#IMPORT LIBRARIES 
import os, math, time, glob, sys, shutil
import pandas as pd
import json
from urllib.request import urlopen
import numpy as np
import argparse
import tempfile,tarfile,os,stat
    
# get split uuid for model_metadata.json file from old model.tar.gz file
def get_split_uuid(gene, parent_dir):
    model_ = gene.lower() + '_union_trainset_graphconv_ampl-1.1.0.tar.gz'
    data_ = gene.upper() + '-ampl-1.1.0.tar.gz'
    if gene.upper() == 'PIK3CG':
        model_ = gene.lower()+'_union_trainset_mordred_ampl-1.1.0.tar.gz'
    
    # extract DATA tar
    data_extracted_dir = parent_dir + data_.replace('.tar.gz','') + '/'
    if not os.path.exists(data_extracted_dir):
        os.makedirs(data_extracted_dir)
    with tarfile.open(parent_dir + data_ , mode='r:gz') as tar:
        tar.extractall(path = data_extracted_dir)   
    
    # view contents of the extracted DATA tar file 
    for l in os.listdir(data_extracted_dir): print(l)
    
    # extract MODEL tar
    model_extracted_dir = parent_dir + model_.replace('.tar.gz','') + '/'
    if not os.path.exists(model_extracted_dir):
        os.makedirs(model_extracted_dir)
    with tarfile.open(parent_dir + model_ , mode='r:gz') as tar:
        tar.extractall(path = model_extracted_dir) 
    
    # view contents of the extracted MODEL tar file 
    for l in os.listdir(model_extracted_dir): print(l) 
    
    # extract model info from model_metadata.json file
    with open(model_extracted_dir + 'model_metadata.json') as json_file:
        data = json.load(json_file)
        #ampl_version = data['model_parameters']['ampl_version']
        #featurizer = data['model_parameters']['featurizer']
        #model_uuid = data['model_uuid']
        split_uuid = data['splitting_parameters']['split_uuid']
	#get split file location
        split_dir = os.path.dirname(data['training_dataset']['dataset_key'])
        print(split_uuid, split_dir)
	     
    
    # retrieve split file with specific split_uuid form pre-saved split files from LC split file location (or, /usr/workspace/atom/public_dsets/union/)
    ##split_dir = '/usr/workspace/atom/public_dsets/union/'
    split_file = gene.lower() + '_union_trainset_base_smiles_train_valid_test_scaffold_' + split_uuid +'.csv'
    if gene == 'PIK3CG':
        split_file = gene.upper() + '_union_trainset_base_smiles_train_valid_test_scaffold_' + split_uuid + '.csv'
    shutil.copy(split_dir + '/' + split_file , data_extracted_dir)
        
#----------------
# main
#----------------
def main(argv):
    start_time = time.time()
    # Argument parsing
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--data_dir', type=str, required=True, help='input directory where model.tar.gz files exist')
    args = parser.parse_args()
    
    parent_dir = args.data_dir #'/g/g92/sarkar7/atom/titli/MoDaC/NCI_DOE_Archive/ATOM/Cancer_Kinase_Selectivity/'
    print(parent_dir)
    n = len(parent_dir.split("/"))-1
    
    genes = [x.split("/")[n].split("-")[0].upper() for x in glob.glob(parent_dir + '*-ampl-1.1.0.tar.gz')]
    print(len(genes),genes)
    
    for gene in genes:
        print("\n\nProcessing ......", gene)
        #if gene == 'PIK3CG':continue;
        get_split_uuid(gene, parent_dir)
    print("CODE END. Time in min = ", np.round((time.time()-start_time)/60, 2))

if __name__ == "__main__":
   main(sys.argv[1:])
