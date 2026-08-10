# dig-heart-severity-mortality-sas

#  Academic analysis of the DIG teaching dataset: Association Between Heart Failure Severity and Mortality in the Digitalis Investigation Group Trial

## Overview

This project examines the association between baseline heart failure severity and all-cause mortality using the Digitalis Investigation Group (DIG) teaching dataset.

The primary exposure was New York Heart Association (NYHA) functional class, which measures the severity of functional limitation associated with cardiac disease. The primary outcome was all-cause mortality, measured using time from randomization to death or last contact.

This was an individual academic project applying epidemiologic and biostatistical methods to a clinical trial dataset.

## Research Question

Is baseline heart failure severity, measured by NYHA functional class, associated with all-cause mortality among participants in the DIG trial?

A secondary objective was to assess whether this association differed by sex.

## Data

The analysis used the Digitalis Investigation Group (DIG) teaching dataset made available through the NHLBI Biologic Specimen and Data Repository Information Coordinating Center (BioLINCC).

The primary exposure was NYHA functional class:

- Class I: No limitation on physical activity
- Class II: Slight limitation of physical activity
- Class III: Marked limitation of physical activity
- Class IV: Inability to carry on physical activity without discomfort

The outcome was all-cause mortality, measured using time-to-event data.

Potential confounders included:

- Age
- Sex
- Race
- Diabetes
- Hypertension
- Body mass index (BMI)
- Chronic heart failure duration

## Statistical Methods

Descriptive statistics were used to summarize participant characteristics.

Survival analysis was conducted using:

- Kaplan-Meier survival estimates stratified by NYHA functional class
- Cox proportional hazards regression

Two adjusted Cox proportional hazards models were used.

**Model 1:** Estimated the association between NYHA functional class and all-cause mortality while adjusting for sex, age, race, hypertension, diabetes, BMI, and chronic heart failure duration.

**Model 2:** Included an interaction term between NYHA functional class and sex to assess whether the association between heart failure severity and mortality differed by sex.

Analyses were conducted using SAS.

## Results

### Baseline Characteristics

The study included 6,800 participants, including 1,519 women (22%) and 5,281 men (78%). Women and men differed significantly in ejection fraction, race, NYHA functional class, and chronic heart failure etiology. Other evaluated characteristics, including age, BMI, diabetes, hypertension, and previous myocardial infarction, did not differ significantly by sex.

### Adjusted Cox Proportional Hazards Model

NYHA functional class was strongly associated with all-cause mortality after adjustment for sex, age, race, hypertension, diabetes, BMI, and chronic heart failure duration.

Compared with participants with NYHA Class I:

- NYHA Class II: adjusted HR = 1.38 (95% CI: 1.12–1.60, p < 0.0001)
- NYHA Class III: adjusted HR = 2.32 (95% CI: 2.00–2.69, p < 0.0001)
- NYHA Class IV: adjusted HR = 4.05 (95% CI: 3.16–5.20, p < 0.0001)

Sex was also associated with mortality. Women had a lower adjusted hazard of mortality compared with men (HR = 0.78, 95% CI: 0.70–0.86, p < 0.0001).

Race, hypertension, diabetes, age, BMI, and chronic heart failure duration were not statistically significant predictors of mortality after adjustment.

### Effect Modification by Sex

The interaction between NYHA functional class and sex was not statistically significant (overall p = 0.80). Therefore, this analysis did not provide evidence that the association between NYHA functional class and mortality differed by sex.

### Kaplan-Meier Survival Analysis

Kaplan-Meier survival curves demonstrated progressively lower survival probabilities with increasing NYHA functional class. Participants with NYHA Class I had the highest observed survival probability, while participants with Classes III and IV had lower survival probabilities over time.

## Discussion

The analysis demonstrated a strong association between greater baseline heart failure severity and mortality. Participants with higher NYHA functional classes had progressively higher hazards of mortality compared with participants with Class I disease.

Although women had a lower adjusted hazard of mortality than men, there was no statistically significant evidence that the association between NYHA functional class and mortality differed by sex.

A key limitation is the relatively small proportion of women in the study population (22%), which may have limited the statistical power to detect sex-specific differences. The underrepresentation of women also limits the generalizability of these findings to women with heart failure.

These findings highlight the importance of considering sex representation when evaluating clinical outcomes and encourage further research using more representative heart failure populations.

## Conclusion

Higher NYHA functional class was associated with progressively higher hazard of mortality in the DIG trial population. Women had a lower adjusted hazard of mortality than men, but the association between NYHA functional class and mortality did not significantly differ by sex.

Further research using populations with more balanced representation of women and men may help clarify potential sex-specific differences in the relationship between heart failure severity and mortality.

## Software

- SAS
- PROC PHREG
- PROC LIFETEST
- PROC MEANS
- PROC TTEST
- PROC FREQ

## Project Objectives

This project applied epidemiologic and biostatistical methods to:

- Evaluate an epidemiologic research question using clinical trial data
- Apply survival analysis and Cox proportional hazards regression
- Assess potential confounding
- Evaluate effect modification using an interaction term
- Interpret statistical findings in the context of public health research
- Communicate findings through written and oral presentation

## Author

Jaimie Figueroa

## Repository Contents

```text
sas/
└── analysis.sas
