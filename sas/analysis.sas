/*===========================================================
  Digitalis Investigation Group (DIG) Teaching Dataset
  Association Between NYHA Functional Class and Mortality

  Analysis conducted in SAS
===========================================================*/


/*-----------------------------------------------------------
  1. Import Data
-----------------------------------------------------------*/

proc import datafile="data/dig.csv"
    out=study_data
    dbms=csv
    replace;
    getnames=yes;
run;


/*-----------------------------------------------------------
  2. Prepare Analysis Dataset
-----------------------------------------------------------*/

data dig;
    set study_data;

    /* Create categorical sex variable for descriptive analysis */
    if sex = 1 then sex_cat = "Male";
    else if sex = 2 then sex_cat = "Female";
run;


/*-----------------------------------------------------------
  3. Descriptive Statistics
-----------------------------------------------------------*/

/* Continuous variables by sex */

proc means data=dig mean std median min max;
    class sex_cat;
    var age ejf_per bmi creat chfdur nsym;
run;


/* Independent-samples t-tests */

proc ttest data=dig;
    class sex_cat;
    var age ejf_per bmi creat chfdur nsym;
run;


/* Categorical variables by sex */

proc freq data=dig;
    tables sex_cat*race / chisq;
    tables sex_cat*functcls / chisq;
    tables sex_cat*diabetes / chisq;
    tables sex_cat*hyperten / chisq;
    tables sex_cat*prevmi / chisq;
    tables sex_cat*chfetiol / chisq;
run;


/*-----------------------------------------------------------
  4. Unadjusted Cox Proportional Hazards Model
-----------------------------------------------------------*/

/* Reference category: NYHA Class I */

proc phreg data=dig;

    class functcls (ref='1') / param=ref;

    model deathday*death(0) = functcls;

run;


/*-----------------------------------------------------------
  5. Adjusted Cox Proportional Hazards Model
-----------------------------------------------------------*/

/*
   Outcome: Time to all-cause mortality
   Exposure: NYHA functional class

   Covariates:
   - Sex
   - Race
   - Hypertension
   - Diabetes
   - Age
   - BMI
   - Chronic heart failure duration
*/

proc phreg data=dig;

    class functcls (ref='1')
          race (ref='1')
          hyperten (ref='0')
          diabetes (ref='0')
          sex (ref='1') / param=ref;

    model deathday*death(0) =
          functcls
          sex
          race
          hyperten
          diabetes
          age
          bmi
          chfdur
          / rl alpha=0.05;

run;


/*-----------------------------------------------------------
  6. Interaction Between NYHA Functional Class and Sex
-----------------------------------------------------------*/

/*
   The interaction term assesses whether the association
   between NYHA functional class and mortality differs by sex.
*/

proc phreg data=dig;

    class functcls (ref='1')
          race (ref='1')
          hyperten (ref='0')
          diabetes (ref='0')
          sex (ref='1') / param=ref;

    model deathday*death(0) =
          functcls
          sex
          race
          hyperten
          diabetes
          age
          bmi
          chfdur
          functcls*sex
          / rl alpha=0.05;

run;


/*-----------------------------------------------------------
  7. Kaplan-Meier Survival Analysis
-----------------------------------------------------------*/

/*
   Survival curves are estimated by NYHA functional class.
*/

proc lifetest data=dig plots=survival;

    time deathday*death(0);
    strata functcls;

run;
