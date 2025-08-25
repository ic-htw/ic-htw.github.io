---
layout: default1
nav: dsml-reports
title: ML Metrics
is_slide: 0
---



# **An Expert's Report on Correlation in Machine Learning**

## **Executive Summary**

Correlation is a foundational statistical concept that quantifies the degree to which variables co-vary. In machine learning, it is an indispensable tool used for exploratory data analysis, feature selection, and model diagnostics. However, its application demands a nuanced understanding, particularly regarding the critical distinction between correlation and causation. The presence of correlated predictors, a condition known as multicollinearity, can severely undermine the stability, reliability, and interpretability of many machine learning models, particularly linear regression.  
This report provides a comprehensive overview of correlation, detailing the calculation and appropriate application of various correlation coefficients, including Pearson's, Spearman's, and Kendall's Tau. It explains the most effective methods for visualizing these relationships, such as scatter plots and heatmaps, and outlines the significant problems caused by multicollinearity, including unstable coefficients and inflated standard errors. The report then presents a strategic framework for mitigating these issues using a range of techniques, from feature elimination and dimensionality reduction with Principal Component Analysis (PCA) to the application of penalized regression methods like Ridge and Lasso. Finally, it extends the concept of correlation into the domain of time series analysis, introducing autocorrelation and cross-correlation, and addressing the specific challenge of spurious correlations in non-stationary data.

## **1\. The Foundational Concept of Correlation in Machine Learning**

### **1.1 Defining Correlation: The Statistical Measure of Co-variance**

In the context of machine learning and data science, correlation is a core statistical measure that describes the relationship between two or more variables.1 It is not merely an examination of how one variable fluctuates independently, but rather a quantification of the simultaneous fluctuations or co-variance between them.2 A correlation is a statistical summary of the relationship, allowing for the study of both the strength and direction of the association.1 This fundamental analysis is a critical first step in nearly every data science project, as it helps to summarize the data's main characteristics and uncover patterns and anomalies.1  
The direction of a correlation can be categorized into three primary types. A **positive correlation** exists when two variables move in the same direction; as the value of one variable increases, the other also increases, and vice versa.1 Conversely, a  
**negative correlation** indicates that variables move in opposite directions; as one variable increases, the other decreases.1 When there is no discernible relationship in the change of variables, it is referred to as  
**neutral correlation**.1

### **1.2 Correlation vs. Causation: A Critical Distinction for Predictive Modeling**

A crucial principle in data analysis is that a correlation between variables does not automatically imply causation.3 While correlation is a statistical measure of a relationship, causation indicates that one event is the direct result of another.3 Misinterpreting this can lead to incorrect conclusions and flawed predictive models.  
A classic example illustrates this distinction: a strong positive correlation might be observed between ice cream consumption and the number of heatstrokes in a given population.1 A naive conclusion might be that eating ice cream causes heatstrokes. However, a deeper analysis reveals a third, confounding variable: the temperature.1 The higher the temperature, the more people consume ice cream, and the more likely people are to experience a heatstroke.1 The observed correlation is "spurious"—an indirect relationship driven by a shared, underlying cause rather than a direct link between the two variables themselves.1 Understanding this is vital, as it reinforces the need for domain knowledge and further research, such as controlled studies, to establish a causal relationship.3

### **1.3 The Role of Correlation in the Machine Learning Workflow**

Correlation is a powerful tool with a dual role in machine learning. It is actively leveraged to improve models but can also reveal inherent problems within the data that must be addressed.  
First, correlation is a key component of **Exploratory Data Analysis (EDA)**.4 By studying how variables relate to one another, practitioners can gain preliminary insights into data patterns and potential issues before designing more complex statistical analyses.1  
Second, it is a critical technique for **feature selection**.7 In this process, a practitioner selects a minimal set of the most relevant variables for a model.8 Highly correlated features often provide redundant information, which can make models overly complex and prone to overfitting.7 A principled approach, known as Correlation-based Feature Selection (CFS), selects a subset of features that are highly correlated with the target variable while having low correlation with each other.8 This approach maximizes the information provided about the target while minimizing redundancy, which leads to more accurate, efficient, and generalizable models.7  
Finally, the same concept that makes correlation useful for feature selection is also the root of a major problem in many machine learning models: **multicollinearity**.7 High correlation between predictor variables provides redundant information, which can negatively impact a model's stability and interpretability.7 A skilled practitioner understands this dual nature of correlation—it is both a solution for finding informative features and a problem that must be diagnosed and managed to build a robust model.

## **2\. Calculation and Quantification of Correlation**

### **2.1 The Correlation Coefficient: A Standardized Measure**

A correlation coefficient is a numerical value that provides a standardized summary of the strength and direction of the relationship between two variables.1 The value of this coefficient is always on the same scale, ranging from \-1.0 to 1.0.1 A value of 1.0 indicates a perfect positive correlation, \-1.0 a perfect negative correlation, and 0.0 indicates no linear correlation.1

### **2.2 Pearson's Product-Moment Correlation Coefficient (r)**

Pearson's product-moment correlation coefficient, denoted by r, is the most common measure of linear correlation.11 It is used when both variables are continuous and assumed to be normally distributed.11 The coefficient is calculated by dividing the covariance of variables  
X and Y by the product of their standard deviations.1 The formula for the sample Pearson's correlation coefficient is given by 13:  
r=∑i=1n​(xi​−xˉ)2​∑i=1n​(yi​−yˉ​)2​∑i=1n​(xi​−xˉ)(yi​−yˉ​)​  
where xi​ and yi​ are the values of the variables for the i-th individual, xˉ and yˉ​ are the sample means, and n is the sample size.13 A key limitation of Pearson's  
r is its sensitivity to extreme values, which can disproportionately influence the result.13 It is also only appropriate for linear relationships and can yield misleadingly low values for non-linear associations.14

### **2.3 Spearman's Rank Correlation Coefficient (ρ)**

Spearman's rank correlation coefficient, denoted as ρ, is a non-parametric measure that assesses the strength of a monotonic relationship between two variables.11 A monotonic relationship means that as one variable increases, the other consistently increases or decreases, but not necessarily at a constant linear rate.15 The key difference from Pearson's is that Spearman's  
ρ is calculated based on the *ranks* of the data rather than the raw values.15  
This coefficient is appropriate when the data is not normally distributed, contains outliers, or consists of ordinal variables, such as data from Likert scale survey questions.11 It is robust to extreme values because it only considers the relative ranking of the data points.13 The formula for Spearman's coefficient is given by 13:  
rs​=1−n(n2−1)6∑i=1n​di2​​  
where di​ is the difference in ranks between the corresponding values for variables X and Y.13

### **2.4 Kendall's Tau (τ): A Probabilistic Measure of Concordance**

Kendall's Tau (τ) is another non-parametric measure of rank correlation, often used as a test statistic to determine if two variables are statistically dependent.18 The calculation for Kendall's Tau is based on the number of "concordant" and "discordant" pairs of observations.16 A pair is concordant if the relative ranks of the two variables for a given pair are the same, and discordant if they are different.18  
Kendall's Tau is particularly useful when dealing with ordinal data or non-normally distributed continuous data.18 Its distribution has better statistical properties for smaller sample sizes compared to Spearman's, and its interpretation is directly related to the probabilities of observing concordant versus discordant pairs.16 While Spearman's  
ρ values are generally larger, both coefficients often lead to similar conclusions.16 When tied ranks are present, a modified version, Kendall's Tau-b, is used to adjust for these ties and ensure the coefficient remains within the \-1 to 1 range.18

### **Table 1: Comparative Analysis of Correlation Coefficients**

| Coefficient | Type of Relationship Measured | Data Type Suitability | Sensitivity to Outliers | Primary Use Case |
| :---- | :---- | :---- | :---- | :---- |
| **Pearson's r** | Linear | Continuous, normally distributed | High | Measuring the linear association between two variables.11 |
| **Spearman's ρ** | Monotonic (linear or non-linear) | Continuous, ordinal, skewed, or with outliers | Low | Assessing relationships in non-normally distributed data or when only ranks are available.13 |
| **Kendall's τ** | Monotonic (linear or non-linear) | Continuous, ordinal, skewed, or with outliers | Low | Measuring ordinal association, especially with small sample sizes or when a probabilistic interpretation of concordance is desired.16 |

This table provides a concise guide for selecting the most appropriate correlation coefficient. Choosing the right measure is a fundamental aspect of expert data analysis, as it ensures that the statistical summary accurately reflects the underlying data and prevents misleading conclusions.

## **3\. Visualization and Interpretation of Correlation**

### **3.1 Scatter Plots: Visualizing Pairwise Relationships**

Scatter plots are one of the most effective and widely used methods for visualizing the relationship between two continuous variables.4 By plotting data points on a Cartesian plane, scatter plots provide an intuitive visual representation of the correlation.20 The density and direction of the points reveal the strength and direction of the relationship. For instance, a scatter plot where points are tightly clustered and follow a clear upward trend suggests a strong positive correlation, while a plot where points are diffuse indicates little to no correlation.4  
Beyond simply visualizing correlation, scatter plots are an essential first step in any analysis because they help to identify potential issues such as outliers and non-linear relationships that can skew a correlation coefficient like Pearson's r.4 Adding a trendline to the plot can further clarify the nature of the relationship.22

### **3.2 Correlation Heatmaps: A Comprehensive View of Multivariable Relationships**

While scatter plots are excellent for examining relationships in pairs, they become impractical when analyzing correlations among numerous variables. In such cases, a **correlation heatmap** is the superior visualization tool.20 A heatmap is a color-coded table that shows the correlation coefficients between all pairs of variables in a dataset.1  
Each cell in the table represents the correlation between two variables, and its color intensity and shade (e.g., from dark red to light red for positive correlations, or dark blue to light blue for negative ones) provide a quick, intuitive summary of the relationship.21 For example, a dark red cell indicates a high positive correlation, while a dark blue cell signifies a high negative correlation.21 The diagonal of the matrix will always be 1.0, as it represents the perfect correlation of each variable with itself.1 A heatmap allows an analyst to quickly scan for strong relationships and identify potential multicollinearity issues that might not be obvious from a simple table of values.21

### **3.3 Best Practices for Correlation Visualization**

To ensure visualizations are both informative and accurate, several best practices should be followed. First, it is crucial to use a suitable color palette for heatmaps that accurately represents the correlation coefficients.20 A sequential palette, for instance, is effective for displaying density, while a diverging palette is ideal when emphasizing extremes.22 Always include a legend to map the colors to their numeric values.22  
Furthermore, it is important to avoid common pitfalls such as misleading scales or overplotting, which occurs when too many data points are on a single graph, obscuring the results.20 Techniques like jittering or transparency can help manage overplotting.20 Finally, and most importantly, an analyst must remember that these visualizations are primarily for data discovery.22 They do not prove causation, and any assumptions about cause-and-effect relationships must be supported by further statistical analysis and domain knowledge.22

## **4\. The Problem of Correlated Predictors: Multicollinearity**

### **4.1 Defining Collinearity and Multicollinearity in Predictive Models**

In a multiple regression model, **collinearity** occurs when two independent variables are highly correlated with each other.10 When this condition extends to more than two independent variables, it is referred to as  
**multicollinearity**.10 This means the predictor variables are not truly independent but instead contain similar or redundant information about the variance in the dependent variable.26 Multicollinearity can arise from natural relationships in the data, such as the correlation between a person's height and weight, or from the way variables are created or collected.25

### **4.2 The Impact of Multicollinearity on Machine Learning Algorithms**

Multicollinearity is a significant problem that can severely impact the performance and reliability of models, particularly linear regression-based algorithms.25 The key issues include:

* **Model Instability and Unreliable Coefficient Estimates:** Multicollinearity inflates the variance of the regression coefficients, making them highly unstable.25 Small changes in the training data can lead to large fluctuations in the estimated coefficients, which can drastically alter the model's predictions on unseen data.25  
* **Reduced Interpretability:** When predictor variables are highly correlated, it becomes difficult to isolate and determine the unique, individual impact of each one on the dependent variable.25 The model cannot reliably distinguish which variable is driving the effect, undermining the ability to interpret the model's feature importance.25  
* **Inflated Standard Errors and Weakened Statistical Significance:** The high variance caused by multicollinearity leads to inflated standard errors for the regression coefficients.26 This results in wider confidence intervals and can make coefficients appear statistically insignificant when they may, in fact, have a meaningful effect.26

### **4.3 Detection of Multicollinearity: The Variance Inflation Factor (VIF)**

The most common method for detecting multicollinearity is through the use of the **Variance Inflation Factor (VIF)**.25 While a correlation matrix can show pairwise correlations, it may not reveal more complex relationships where a variable is correlated with a combination of two or more other variables.24  
VIF quantifies how much the variance of an estimated regression coefficient is inflated due to collinearity with the other predictors in the model.26 A VIF of 1 indicates no correlation, a value between 1 and 5 suggests moderate correlation, and a VIF of 5 or higher signals a high degree of multicollinearity that can compromise the model's reliability.26 The VIF for the  
j-th independent variable is calculated as:  
VIFj​=1−Rj2​1​  
where Rj2​ is the coefficient of determination (R-squared) from a regression model that regresses the j-th independent variable against all other independent variables in the original model.26 A high VIF indicates that the variable can be accurately predicted by the other predictors in the model.26

## **5\. Strategies for Mitigating Multicollinearity**

When multicollinearity is detected, several techniques can be employed to address the issue, each with its own advantages and disadvantages.

### **5.1 Feature Elimination: The Simple Approach**

The most straightforward method to combat multicollinearity is to remove one of the highly correlated predictor variables from the model.23 This simplifies the model and can improve its stability.25 For example, if both "height" and "weight" are highly correlated and one is sufficient for the model, the other can be dropped.25 This is the central tenet of Correlation-based Feature Selection (CFS), which actively seeks to remove redundant features.8 However, this method is not always ideal, as it may result in a loss of valuable information or fail to address more complex multicollinearity where a variable is a linear combination of several others.24

### **5.2 Dimensionality Reduction: Principal Component Analysis (PCA)**

Principal Component Analysis (PCA) is an unsupervised technique that can effectively mitigate multicollinearity.28 PCA transforms a set of highly correlated variables into a smaller set of  
**linearly uncorrelated variables** known as principal components.24 These new components are linear combinations of the original variables and are mathematically constructed to be orthogonal to one another, meaning their correlation is zero.27 The first principal component captures the maximum amount of variance in the data, with subsequent components capturing the next highest variance, all while being uncorrelated.27  
While PCA is a powerful solution, it comes with a significant trade-off: a loss of interpretability.24 The new principal components are abstract constructs, making it difficult to explain their real-world meaning to stakeholders, which is a key consideration for model transparency.24

### **5.3 Penalized Regression Techniques: Ridge and Lasso Regression**

For models that rely on regression, penalized regression techniques such as Ridge and Lasso provide a robust way to handle multicollinearity.24 These methods add a penalty term to the regression's cost function, which constrains the coefficient estimates and reduces their variance.33

* **Ridge Regression (L2 Regularization):** Ridge regression addresses multicollinearity by adding a penalty term that is proportional to the **square** of the magnitude of the coefficients.34 This penalty shrinks the coefficients toward zero, but does not set them to exactly zero.33 The goal is to reduce the variance of the estimates by introducing a tolerable amount of bias, thereby stabilizing the model.33 Ridge regression is particularly useful when all predictors are considered conceptually important and should be retained in the model.35  
* **Lasso Regression (L1 Regularization):** The Least Absolute Shrinkage and Selection Operator (Lasso) adds a penalty term proportional to the **absolute value** of the coefficients.36 This penalty promotes sparsity in the model by shrinking some coefficients all the way to zero.37 This unique property allows Lasso to perform automatic feature selection, effectively dropping less important or redundant correlated features from the model.36 A limitation of Lasso, however, is that if two features are highly correlated, it may arbitrarily select one to keep and shrink the other to zero.36

### **Table 2: Multicollinearity Mitigation Strategies**

| Technique | Mechanism of Action | Main Advantage | Main Disadvantage | Ideal Use Case |
| :---- | :---- | :---- | :---- | :---- |
| **Feature Elimination** | Removes one of the highly correlated variables.25 | Simplifies the model and improves interpretability.23 | May discard useful information or fail to address complex relationships.28 | When a simple, interpretable model is desired and the correlated variables are clearly redundant.23 |
| **Principal Component Analysis (PCA)** | Transforms correlated variables into a new set of uncorrelated components.27 | Combats multicollinearity effectively and reduces dimensionality.24 | The new components are difficult to interpret in real-world terms.28 | When interpretability is a lower priority than predictive performance in a high-dimensional dataset.24 |
| **Ridge Regression** | Shrinks coefficients by penalizing their squared magnitude.33 | Stabilizes the model by reducing coefficient variance.33 | Does not perform feature selection; retains all variables.34 | When all predictor variables are theoretically important and should remain in the model.35 |
| **Lasso Regression** | Shrinks coefficients by penalizing their absolute value, setting some to zero.36 | Performs automatic feature selection by dropping redundant variables.36 | May arbitrarily drop one of two highly correlated variables.37 | When the goal is to simplify a model by eliminating non-essential features and managing high dimensionality.36 |

This table serves as a decision framework for an expert practitioner, highlighting the strategic trade-offs between interpretability, model stability, and feature retention when addressing multicollinearity.

## **6\. Correlation in Time Series Analysis**

Correlation takes on a new, dynamic meaning in the context of time series analysis, where data points are indexed in time. This introduces two specialized forms of correlation that are essential for understanding temporal data.

### **6.1 Autocorrelation: The Relationship of a Variable with Itself Over Time**

**Autocorrelation**, or serial correlation, measures the correlation of a signal with a delayed copy of itself.38 It quantifies the similarity between observations of a variable at different points in time, revealing patterns and dependencies over time.38 The delay is referred to as a "lag".39 For example, in financial analysis, an autocorrelation test can reveal if a stock's returns today are correlated with its returns from a previous trading session.40 A high positive autocorrelation suggests a momentum factor, where past price gains tend to predict future gains, while negative autocorrelation can signal a mean-reverting behavior.41 Autocorrelation is a key component of technical analysis used by investors to identify patterns and inform trading strategies.40

### **6.2 Cross-Correlation: The Relationship Between Two Separate Time Series**

**Cross-correlation** measures the relationship between two distinct time series.42 This analysis helps to determine if the values in one time series are related to the values in another, often with a specific time lag.43 This can be particularly useful for identifying leading indicators. For example, a business might use cross-correlation to determine the time delay between an increase in marketing spending and the resulting increase in sales revenue.43 In a metropolitan area, cross-correlation can be used to predict peak electrical demand by analyzing the time-lagged relationship between hourly temperatures and electricity usage.43 In signal processing and neuroscience, it can be used to measure the relationship between the firing times of two neurons.42 Cross-correlation can also be used in radar engineering to determine the presence of a target and its range by correlating a sent signal with the attenuated and noisy received signal.44

### **6.3 Spurious Correlation: The Pitfalls of Analyzing Non-Stationary Time Series**

The problem of spurious correlation, which can occur with any data, is particularly common and problematic in time series analysis.45 A spurious regression is a misleading statistical relationship that can arise between two independent, non-stationary variables.45 For instance, sales of ice cream and sunscreen may be highly correlated over time, not because one causes the other, but because both are driven by a shared seasonal trend.43  
The appearance of a strong correlation in such cases can be deceptive.43 Advanced statistical methods like cointegration analysis have been developed to test for genuine, long-term relationships between non-stationary series, providing a more rigorous approach than simple correlation.47 A skilled data analyst must always be cautious and use domain knowledge to avoid drawing erroneous causal conclusions from observed correlations in time series data.

## **7\. Conclusion: Synthesis and Future Directions**

The concept of correlation is far more than a simple statistical metric; it is a fundamental pillar of the machine learning workflow. As this report demonstrates, its significance extends from the initial stages of exploratory data analysis and feature engineering to the advanced diagnostics of model stability and the specialized analysis of time-dependent data. The mastery of correlation lies not only in understanding its calculation and visualization but also in its nuanced application—recognizing its dual nature as both a powerful tool for discovering relationships and a potential source of significant model problems.  
A hallmark of an expert practitioner is the ability to navigate these complexities. This includes the critical distinction between correlation and causation, the strategic selection of an appropriate correlation coefficient based on data properties, and the recognition and mitigation of multicollinearity. By employing techniques like feature elimination, PCA, and penalized regression, analysts can build models that are not only accurate but also stable, interpretable, and robust.  
Ultimately, a comprehensive understanding of correlation is a prerequisite for more advanced machine learning and statistical endeavors. It provides the foundation for constructing more sophisticated models, performing rigorous causal inference, and gaining a deeper, more reliable understanding of the relationships within complex datasets.

#### **Referenzen**

1. Python Details on Correlation Tutorial | DataCamp, Zugriff am August 21, 2025, [https://www.datacamp.com/tutorial/tutorial-datails-on-correlation](https://www.datacamp.com/tutorial/tutorial-datails-on-correlation)  
2. medium.com, Zugriff am August 21, 2025, [https://medium.com/@abdallahashraf90x/all-you-need-to-know-about-correlation-for-machine-learning-e249fec292e9\#:\~:text=Correlation%20refers%20to%20the%20degree,both%20or%20all%20variables%20measured.](https://medium.com/@abdallahashraf90x/all-you-need-to-know-about-correlation-for-machine-learning-e249fec292e9#:~:text=Correlation%20refers%20to%20the%20degree,both%20or%20all%20variables%20measured.)  
3. Correlation and causation | Australian Bureau of Statistics, Zugriff am August 21, 2025, [https://www.abs.gov.au/statistics/understanding-statistics/statistical-terms-and-concepts/correlation-and-causation](https://www.abs.gov.au/statistics/understanding-statistics/statistical-terms-and-concepts/correlation-and-causation)  
4. Exploratory Data Analysis | US EPA, Zugriff am August 21, 2025, [https://www.epa.gov/caddis/exploratory-data-analysis](https://www.epa.gov/caddis/exploratory-data-analysis)  
5. www.abs.gov.au, Zugriff am August 21, 2025, [https://www.abs.gov.au/statistics/understanding-statistics/statistical-terms-and-concepts/correlation-and-causation\#:\~:text=A%20correlation%20between%20variables%2C%20however,relationship%20between%20the%20two%20events.](https://www.abs.gov.au/statistics/understanding-statistics/statistical-terms-and-concepts/correlation-and-causation#:~:text=A%20correlation%20between%20variables%2C%20however,relationship%20between%20the%20two%20events.)  
6. Correlation Analysis in Time Series | by Tech First \- Medium, Zugriff am August 21, 2025, [https://techfirst.medium.com/correlation-analysis-in-time-series-7c18a88d27a9](https://techfirst.medium.com/correlation-analysis-in-time-series-7c18a88d27a9)  
7. Correlation in machine learning — All you need to know | by ..., Zugriff am August 21, 2025, [https://medium.com/@abdallahashraf90x/all-you-need-to-know-about-correlation-for-machine-learning-e249fec292e9](https://medium.com/@abdallahashraf90x/all-you-need-to-know-about-correlation-for-machine-learning-e249fec292e9)  
8. Correlation-based Feature Selection in a Data Science Project | by ..., Zugriff am August 21, 2025, [https://medium.com/@sariq16/correlation-based-feature-selection-in-a-data-science-project-3ca08d2af5c6](https://medium.com/@sariq16/correlation-based-feature-selection-in-a-data-science-project-3ca08d2af5c6)  
9. Correlation-based Feature Selection for Machine Learning, Zugriff am August 21, 2025, [https://www.lri.fr/\~pierres/donn%E9es/save/these/articles/lpr-queue/hall99correlationbased.pdf](https://www.lri.fr/~pierres/donn%E9es/save/these/articles/lpr-queue/hall99correlationbased.pdf)  
10. What Is Multicollinearity? | IBM, Zugriff am August 21, 2025, [https://www.ibm.com/think/topics/multicollinearity](https://www.ibm.com/think/topics/multicollinearity)  
11. Measuring Relationships: Types of Correlation Coefficients Explained \- QuantHub, Zugriff am August 21, 2025, [https://www.quanthub.com/what-are-the-different-types-of-correlation-coefficients/](https://www.quanthub.com/what-are-the-different-types-of-correlation-coefficients/)  
12. Pearson Correlation: A Beginner's Guide \- Datatab, Zugriff am August 21, 2025, [https://datatab.net/tutorial/pearson-correlation](https://datatab.net/tutorial/pearson-correlation)  
13. A guide to appropriate use of Correlation coefficient in medical research \- PMC, Zugriff am August 21, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC3576830/](https://pmc.ncbi.nlm.nih.gov/articles/PMC3576830/)  
14. When is Pearson's Correlation Coefficient used? \- Quora, Zugriff am August 21, 2025, [https://www.quora.com/When-is-Pearsons-Correlation-Coefficient-used](https://www.quora.com/When-is-Pearsons-Correlation-Coefficient-used)  
15. Spearman's rank correlation coefficient \- Wikipedia, Zugriff am August 21, 2025, [https://en.wikipedia.org/wiki/Spearman%27s\_rank\_correlation\_coefficient](https://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient)  
16. Kendall's Tau and Spearman's Rank Correlation Coefficient \- Statistics Solutions, Zugriff am August 21, 2025, [https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/kendalls-tau-and-spearmans-rank-correlation-coefficient/](https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/kendalls-tau-and-spearmans-rank-correlation-coefficient/)  
17. www.surveymonkey.com, Zugriff am August 21, 2025, [https://www.surveymonkey.com/market-research/resources/pearson-correlation-vs-spearman-correlation/\#:\~:text=The%20Spearman's%20test%20can%20be,questions%20or%20ordinal%20survey%20questions.](https://www.surveymonkey.com/market-research/resources/pearson-correlation-vs-spearman-correlation/#:~:text=The%20Spearman's%20test%20can%20be,questions%20or%20ordinal%20survey%20questions.)  
18. Kendall rank correlation coefficient \- Wikipedia, Zugriff am August 21, 2025, [https://en.wikipedia.org/wiki/Kendall\_rank\_correlation\_coefficient](https://en.wikipedia.org/wiki/Kendall_rank_correlation_coefficient)  
19. statistics.laerd.com, Zugriff am August 21, 2025, [https://statistics.laerd.com/spss-tutorials/kendalls-tau-b-using-spss-statistics.php\#:\~:text=Kendall's%20tau%2Db%20(%CF%84b,at%20least%20an%20ordinal%20scale.](https://statistics.laerd.com/spss-tutorials/kendalls-tau-b-using-spss-statistics.php#:~:text=Kendall's%20tau%2Db%20\(%CF%84b,at%20least%20an%20ordinal%20scale.)  
20. Data Visualization for Correlation \- Number Analytics, Zugriff am August 21, 2025, [https://www.numberanalytics.com/blog/data-visualization-for-correlation](https://www.numberanalytics.com/blog/data-visualization-for-correlation)  
21. exploratory.io, Zugriff am August 21, 2025, [https://exploratory.io/note/kanaugust/Introduction-to-Correlation-Analysis-ejY4Kqs2QU/note\_content/note.html](https://exploratory.io/note/kanaugust/Introduction-to-Correlation-Analysis-ejY4Kqs2QU/note_content/note.html)  
22. Visualization/Chart Best Practices \- MU Analytics \- University of Missouri, Zugriff am August 21, 2025, [https://udair.missouri.edu/visualization-chart-best-practices/](https://udair.missouri.edu/visualization-chart-best-practices/)  
23. Understanding and Handling Redundant or ... \- CodeSignal, Zugriff am August 21, 2025, [https://codesignal.com/learn/courses/intro-to-data-cleaning-and-preprocessing-with-titanic/lessons/understanding-and-handling-redundant-or-correlated-features-in-datasets](https://codesignal.com/learn/courses/intro-to-data-cleaning-and-preprocessing-with-titanic/lessons/understanding-and-handling-redundant-or-correlated-features-in-datasets)  
24. Mitigating Multicollinearity in Data Analysis for Predictive Accuracy \- Number Analytics, Zugriff am August 21, 2025, [https://www.numberanalytics.com/blog/mitigating-multicollinearity-predictive-accuracy](https://www.numberanalytics.com/blog/mitigating-multicollinearity-predictive-accuracy)  
25. Multicollinearity in Data \- GeeksforGeeks, Zugriff am August 21, 2025, [https://www.geeksforgeeks.org/machine-learning/multicollinearity-in-data/](https://www.geeksforgeeks.org/machine-learning/multicollinearity-in-data/)  
26. What is Multicollinearity in Regression Analysis and How to Detect ..., Zugriff am August 21, 2025, [https://medium.com/@sahin.samia/what-is-multicollinearity-in-regression-analysis-and-how-to-detect-and-handle-it-714ddaeee528](https://medium.com/@sahin.samia/what-is-multicollinearity-in-regression-analysis-and-how-to-detect-and-handle-it-714ddaeee528)  
27. Applying PCA to Logistic Regression to remove Multicollinearity \- GeeksforGeeks, Zugriff am August 21, 2025, [https://www.geeksforgeeks.org/machine-learning/applying-pca-to-logistic-regression-to-remove-multicollinearity/](https://www.geeksforgeeks.org/machine-learning/applying-pca-to-logistic-regression-to-remove-multicollinearity/)  
28. 5.11 Dealing with correlated predictors | Computational Genomics with R, Zugriff am August 21, 2025, [https://compgenomr.github.io/book/dealing-with-correlated-predictors.html](https://compgenomr.github.io/book/dealing-with-correlated-predictors.html)  
29. Understanding Multicollinearity: Definition, Effects, and Solutions, Zugriff am August 21, 2025, [https://www.investopedia.com/terms/m/multicollinearity.asp](https://www.investopedia.com/terms/m/multicollinearity.asp)  
30. www.geeksforgeeks.org, Zugriff am August 21, 2025, [https://www.geeksforgeeks.org/machine-learning/applying-pca-to-logistic-regression-to-remove-multicollinearity/\#:\~:text=for%20the%20coefficients.-,Principal%20Component%20Analysis%20(PCA)%20for%20Multicollinearity,the%20orthogonal%20linear%20transformation%20technique.](https://www.geeksforgeeks.org/machine-learning/applying-pca-to-logistic-regression-to-remove-multicollinearity/#:~:text=for%20the%20coefficients.-,Principal%20Component%20Analysis%20\(PCA\)%20for%20Multicollinearity,the%20orthogonal%20linear%20transformation%20technique.)  
31. What Is Principal Component Analysis (PCA)? \- IBM, Zugriff am August 21, 2025, [https://www.ibm.com/think/topics/principal-component-analysis](https://www.ibm.com/think/topics/principal-component-analysis)  
32. ELI5: Principal Component Analysis (PCA) : r/statistics \- Reddit, Zugriff am August 21, 2025, [https://www.reddit.com/r/statistics/comments/2jlynf/eli5\_principal\_component\_analysis\_pca/](https://www.reddit.com/r/statistics/comments/2jlynf/eli5_principal_component_analysis_pca/)  
33. Ridge \- Overview, Variables Standardization, Shrinkage \- Corporate Finance Institute, Zugriff am August 21, 2025, [https://corporatefinanceinstitute.com/resources/data-science/ridge/](https://corporatefinanceinstitute.com/resources/data-science/ridge/)  
34. Ridge regression \- Wikipedia, Zugriff am August 21, 2025, [https://en.wikipedia.org/wiki/Ridge\_regression](https://en.wikipedia.org/wiki/Ridge_regression)  
35. Mitigating the Multicollinearity Problem and Its Machine Learning Approach: A Review, Zugriff am August 21, 2025, [https://www.mdpi.com/2227-7390/10/8/1283](https://www.mdpi.com/2227-7390/10/8/1283)  
36. Lasso Regression for Data Scientists \- Number Analytics, Zugriff am August 21, 2025, [https://www.numberanalytics.com/blog/lasso-regression-data-scientists-feature-selection](https://www.numberanalytics.com/blog/lasso-regression-data-scientists-feature-selection)  
37. What is lasso regression? \- IBM, Zugriff am August 21, 2025, [https://www.ibm.com/think/topics/lasso-regression](https://www.ibm.com/think/topics/lasso-regression)  
38. en.wikipedia.org, Zugriff am August 21, 2025, [https://en.wikipedia.org/wiki/Autocorrelation\#:\~:text=Autocorrelation%2C%20sometimes%20known%20as%20serial,at%20different%20points%20in%20time.](https://en.wikipedia.org/wiki/Autocorrelation#:~:text=Autocorrelation%2C%20sometimes%20known%20as%20serial,at%20different%20points%20in%20time.)  
39. What is Autocorrelation? | IBM, Zugriff am August 21, 2025, [https://www.ibm.com/think/topics/autocorrelation](https://www.ibm.com/think/topics/autocorrelation)  
40. Autocorrelation: What It Is, How It Works, Tests \- Investopedia, Zugriff am August 21, 2025, [https://www.investopedia.com/terms/a/autocorrelation.asp](https://www.investopedia.com/terms/a/autocorrelation.asp)  
41. How to Use Autocorrelation to Evaluate Investments \- SmartAsset.com, Zugriff am August 21, 2025, [https://smartasset.com/investing/autocorrelation](https://smartasset.com/investing/autocorrelation)  
42. Correlation analysis \- University of St Andrews, Zugriff am August 21, 2025, [https://www.st-andrews.ac.uk/\~wjh/dataview/tutorials/correlation.html](https://www.st-andrews.ac.uk/~wjh/dataview/tutorials/correlation.html)  
43. How Time Series Cross Correlation works—ArcGIS Pro | Documentation, Zugriff am August 21, 2025, [https://pro.arcgis.com/en/pro-app/3.4/tool-reference/space-time-pattern-mining/how-time-series-cross-correlation-works.htm](https://pro.arcgis.com/en/pro-app/3.4/tool-reference/space-time-pattern-mining/how-time-series-cross-correlation-works.htm)  
44. Understanding Correlation \- Technical Articles \- All About Circuits, Zugriff am August 21, 2025, [https://www.allaboutcircuits.com/technical-articles/understanding-correlation/](https://www.allaboutcircuits.com/technical-articles/understanding-correlation/)  
45. Spurious Regression With Stationary Time Series \- MSR Economic Perspectives, Zugriff am August 21, 2025, [https://blog.ms-researchhub.com/2019/10/26/spurious-regression-with-stationary-time-series/](https://blog.ms-researchhub.com/2019/10/26/spurious-regression-with-stationary-time-series/)  
46. en.wikipedia.org, Zugriff am August 21, 2025, [https://en.wikipedia.org/wiki/Spurious\_relationship\#:\~:text=An%20example%20of%20a%20spurious,between%20independent%20non%2Dstationary%20variables.](https://en.wikipedia.org/wiki/Spurious_relationship#:~:text=An%20example%20of%20a%20spurious,between%20independent%20non%2Dstationary%20variables.)  
47. What is the use of autocorrelation and cross-correlation in real life ..., Zugriff am August 21, 2025, [https://www.quora.com/What-is-the-use-of-autocorrelation-and-cross-correlation-in-real-life-situations-What-are-the-advantages-of-using-autocorrelation-and-cross-correlation-over-power-spectra-when-analyzing-signals](https://www.quora.com/What-is-the-use-of-autocorrelation-and-cross-correlation-in-real-life-situations-What-are-the-advantages-of-using-autocorrelation-and-cross-correlation-over-power-spectra-when-analyzing-signals)