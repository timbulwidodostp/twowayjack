{smcl}
{* *! version 1.1 June 2024}{...}
{help logitjack:twowayjack}
{hline}{...}

{title:Title}

{pstd}
Jackknife Inference With two-way clustering.{p_end}

{title:Syntax}

{phang}
{cmd:twowayjack} {it:varlist}, {it:cluster(varname)}  [  {it:options}]

{phang}
{it:varlist} the dependent variable, the independent variable of
interest, and other (binary or continuous) independent variables,

{phang}
{it:cluster} the two clustering variables. Exactly two variables must be specified.

{synoptset 45 tabbed}{...}
{synopthdr}
{synoptline}

{synopt:{opt fevar(varlist)}}creates fixed effects for the included
variables, similar to {cmd:i.varname}.{p_end}


{synopt:{opt sam:ple}}allows for sample restrictions. For instance,
in order to restrict the analysis to individuals 25 years of age or
older based on a variable "age", sample(age>=25) should be added to
the list of options. {p_end}


{marker description}{...}
{title:Description}

{pstd}{cmd:twowayjack} is a stand alone command that calculates a cluster jackknife variance estimator. MacKinnon, Nielsen, and Webb (2024) documents the procedure more fully than this help file. The command will calculate two standard errors for the coefficient of interest. Both use the max(se) procedure rather than an eigenvalue correction.  The first standard error uses the conventional (non-jackknife) CRVE, referred to as CV_1.  The second, and preferred, standard error is the jackknife one, CV_3.  The package also calculates coefficients of variation for leverage, partial leverage, cluster sizes and omit-one-cluster coefficients in each dimension.
Finally, it calculcates the effective number of clusters in the two dimensions of clustering.  


{title:Stored results}

All of the matrices displayed on screen are available in memory after {cmd:twowayjack}
runs.

{synopt:{cmd:matrix list mwcvstuff}} shows the two CV standard errors, p-values and confidence intervals.

 
{synopt:{cmd:matrix list summtable}} shows the various cluster diagnostics.

 

{title:Examples}

{hline}

{pstd} nlswork -- using {cmd:regress}

{phang2}{cmd:. webuse nlswork, clear}

{phang2}{cmd:. keep if inrange(age,25,35)}

{phang2}{cmd:. gen vismin  = inrange(race,2,3)}

{phang2}{cmd:. reg hours vismin south i.age i.birth_yr i.year i.ind   , cluster(ind)}

{pstd} nlswork -- using {cmd:twowayjack}

{phang2}{cmd:. twowayjack  hours vismin south   ,  fevar(age birth_yr year ind ) cluster(age ind)}


{pstd} sample restrictions - using {cmd:sample}

{phang2}{cmd:. gen rndsample = runiform()}

{phang2}{cmd:. twowayjack  hours vismin south   ,  fevar(age birth_yr year ind ) cluster(age ind) sample(rndsample<=0.5) }



{title:Author}

{p 4}Matthew D. Webb{p_end}
{p 4}matthewdwebb@gmail.com{p_end}

{title:Citation}

{p 4 8 2}{cmd:twowayjack} is not an official Stata command. It is a
free contribution to the research community.

Please cite:
{p 8 8 2} James G. MacKinnon,  Morten Ø. Nielsen, and Matthew D. Webb.
2024. Jackknife inference with two-way clustering. Arxiv 2406.08880. {p_end}



***************************************************************
