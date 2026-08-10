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
