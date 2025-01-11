#!/bin/bash
#SBATCH --job-name=download_genomes
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=download_genomes%A.out
#SBATCH --error=download_genomes%A_%a.err
#SBATCH --cpus-per-task=4
#SBATCH --mem=8000

# Load modules
module purge
ml intel/21.2.0 impi/2021.2
conda activate /u/fislo/conda-envs/ncbi_datasets

# Non human primates - NCBI fetch 
datasets download genome \ 
    accession $(cat NCBI_NHPrimateAccessionIDs.txt) \
    --assembly-level complete,chromsome,scaffold \
    --filename /ptmp/fislo/spry_phylogeny/primates.zip


# Human genome - NCBI fetch
datasets download genome \ 
    taxon "Homo sapiens" \
    --assembly-level complete \
    --reference \
    --filename /ptmp/fislo/spry_phylogeny/human.zip


# Fish genomes
datasets download genome \ 
    accession $(cat NCBI_ChondrichthyesAccessionIDs.txt) \
    --assembly-level complete,chromsome,scaffold \
    --filename /ptmp/fislo/spry_phylogeny/Chondrichthyes.zip







