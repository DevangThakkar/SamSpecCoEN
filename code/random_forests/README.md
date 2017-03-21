# Synopsis

We construct random forests and use them to calculate the feature importance and predict expression values for the networks created with the edge weights. Feature importance relies on finding out how often a variable is used in major decisions while branching. 

Discussion
==========
Two parameters are usually used to calculate the feature importance - gini impurity and information gain. Gini importance measure has been observed to be biased in variable selection and hence is not preferred. Information gain is measured using a statistic known as the permutation importance. The reasoning is to permute the values for parameters and observe the change in the outputs - changes to important features would probably see a greater change in the accuracy.

A detailed discussion on the and advantages and drawbacks of various feature importances can be found in a paper by [Strobl et al., 2007](http://dx.doi.org/10.1186/1471-2105-8-25).

## Iterations

* Scikit-learn does not provide the functionality to calculate permutaion importances, so a decision is made to use packages in R which support the same. 
* Openly available code for calculating permutation importances is tried out but not considered further due to excessive memory requirements. 
* Rpy2/PypeR can be used to import R packages in Python however in order to optimise for time, a separate R script is created.

## Methods 

* [Altmann's approach](https://doi.org/10.1093/bioinformatics/btq134) (applied on random forests in R package vita {variable importance testing approaches} under PIMP)
* [Janitza's approach](https://epub.ub.uni-muenchen.de/25587/1/TR185.pdf) (applied on random forests in R package vita {variable importance testing approaches} under NTA)

These approaches prove to be tediously slow, hence an alternative is searched for.

The paper of [Wright et al., 2015](https://arxiv.org/pdf/1508.04409.pdf) on ranger is being tried out with primary focus on random forests used for Janitza's approach.


More papers on this topic: 

* [Hothorn et al., 2012](http://dx.doi.org/10.1198/106186006X133933)
* [Janitza et al., 2013](http://dx.doi.org/10.1186/1471-2105-14-119)

Papers to be seen:
* [Hapfelmeier et al., 2013](http://dx.doi.org/10.1016/j.csda.2012.09.020)
* [Huynh-Thu et al., 2012](https://doi.org/10.1093/bioinformatics/bts238)
