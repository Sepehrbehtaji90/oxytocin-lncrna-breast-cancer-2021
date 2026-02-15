# Study design summary

## Type of study
Case–control study using paired clinical samples (tumour tissue vs adjacent non-tumour tissue).

## Study population
Iranian patients with breast cancer (invasive ductal carcinoma / ductal invasive adenocarcinoma) referred to Sina and Farmaniyeh hospitals (Tehran, Iran).

### Inclusion / exclusion (high level)
- Tumour diagnosis confirmed by surgeon and pathology report.
- Samples collected prior to chemotherapy/radiotherapy.
- Benign and hereditary breast cancer samples excluded (where applicable).
- Only cases with complete demographic/clinical/pathological information included.

## Sample count and collection
- 70 tumour tissue specimens
- 70 adjacent non-tumour tissue specimens (paired to tumour samples)
Samples were transferred on liquid nitrogen immediately after surgery and stored at −70°C.

## Data collection tools
1. Questionnaire (demographic/clinical information)
2. Real-time PCR (SYBR Green) for gene/lncRNA expression

## Wet-lab workflow (measurement)
1. Sample collection (tumour + adjacent non-tumour)
2. RNA extraction using dedicated kits
3. DNase treatment (if applied)
4. cDNA synthesis using dedicated kits
5. Primer design using NCBI Primer-BLAST and AlleleID software
6. Quantification of target expression by SYBR Green real-time PCR
7. Statistical analysis and interpretation

## Variables table

| Variable | Measurement method / tool | Variable role |
|---|---|---|
| Breast cancer diagnosis | Surgeon + pathology report | Dependent / outcome |
| OXTR expression | SYBR Green RT-qPCR | Independent |
| CAMK2D expression | SYBR Green RT-qPCR | Independent |
| ITPR1 expression | SYBR Green RT-qPCR | Independent |
| RCAN1 expression | SYBR Green RT-qPCR | Independent |
| RGS2 expression | SYBR Green RT-qPCR | Independent |
| KCNJ2 expression | SYBR Green RT-qPCR | Independent |
| CACNA2D1 expression | SYBR Green RT-qPCR | Independent |
| FOS expression | SYBR Green RT-qPCR | Independent |
| lincTNS1 expression | SYBR Green RT-qPCR | Independent |
| lincMTX2 expression | SYBR Green RT-qPCR | Independent |
| lincFOXF1 expression | SYBR Green RT-qPCR | Independent |
| lincZFP161 expression | SYBR Green RT-qPCR | Independent |
| BALR-2 expression | SYBR Green RT-qPCR | Independent |
| Age | Questionnaire | Contextual |
| Stage | Pathology report | Contextual |
| Histological grade | Pathology report | Contextual |
| Tumour size | Clinical/pathology measurement | Contextual |
| Family history | Questionnaire | Contextual |
| Menarche age | Questionnaire | Contextual |
| Menopause age | Questionnaire | Contextual |

## Software / analysis tools
- SPSS
- LinReg
- REST
- Excel
(Other analysis steps may also be reproduced in R within this repository.)

## Research limitations (as stated in proposal)
No specific restrictions were listed. Potential systematic errors can include:
- RNA quality variability
- primer-dimer / non-specific amplification
- batch effects
These are typically controlled via RNA QC, melt-curve checks, and consistent protocols.

## Implementation plan (high level)
- Sample collection, primer design and ordering: 30%
- RNA extraction + cDNA synthesis: 20%
- Real-time PCR: 40%
- Data analysis: 10%

