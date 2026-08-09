proc import datafile="data/dig.csv"
    out=study_data
    dbms=csv
    replace;
    getnames=yes;
run;

proc contents data=study_data;
run;

data dig;
    set study_data;

    if sex = 1 then sex_cat = "Male";
    else if sex = 2 then sex_cat = "Female";
run;

proc means data=dig mean std median min max;
    class sex_cat;
    var age ejf_per bmi creat chfdur nsym;
run;

proc ttest data=dig;
    class sex_cat;
    var age ejf_per bmi creat chfdur nsym;
run;

proc freq data=dig;
    tables sex_cat*race / chisq;
    tables sex_cat*functcls / chisq;
    tables sex_cat*diabetes / chisq;
    tables sex_cat*hyperten / chisq;
    tables sex_cat*prevmi / chisq;
    tables sex_cat*chfetiol / chisq;
run;

proc phreg data=dig;
	class functcls (ref = '1');
	model deathday*death(0) =functcls;
run;

proc phreg data=dig;
	class functcls (ref = '1');
	model deathday*sex(1) = functcls;
run;

proc phreg data=dig;
	class functcls (ref = '1')
		race (ref='1')
		hyperten (ref='0')
		diabetes (ref='0')
		sex (ref='1')/param=ref;
		
	model deathday*death(0) =functcls sex race hyperten diabetes age bmi chfdur functcls*sex/rl alpha=0.05;
run;

proc phreg data=dig;
	class functcls (ref = '1')
		race (ref='1')
		hyperten (ref='0')
		diabetes (ref='0')
		sex (ref='1')/param=ref;
		
	model deathday*death(0) =functcls sex race hyperten diabetes age bmi chfdur functcls*sex/rl alpha=0.05;
run;


proc lifetest data=dig plots=survival;
    time deathday*death(0);
    strata functcls;
run;
