# Statistical analysis and ML/ROC

## Transcript quantity and normalization
Ct and amplification efficiency were obtained using LinReg.
Fold-change significance was assessed using REST.

For downstream analysis in R, transcript quantities were computed relative to the GAPDH reference gene:

Transcript quantity = (amp_gene ^ (-Ct_gene)) / (amp_GAPDH ^ (-Ct_GAPDH))

Values were then log2-transformed.

## Paired comparison
Tumour vs adjacent non-tumour tissues were compared using paired t-tests.

## Correlation analysis
Spearman correlation coefficients were calculated between expression levels of the oxytocin-related genes and lncRNAs.

## Diagnostic modelling (ROC / ML)
ROC curves were used to evaluate diagnostic power. Three models were evaluated using 10-fold cross validation:
- Bayesian generalized linear model (BayesGLM)
- generalized linear model (GLM)
- linear discriminant analysis (LDA)

AUC was used for model selection; the selected model was then trained for each gene separately to assess individual discriminatory power.

## Clinical associations
Chi-square tests were used to assess associations between demographic/clinical variables and transcript levels.

## Significance threshold
P value < 0.05

