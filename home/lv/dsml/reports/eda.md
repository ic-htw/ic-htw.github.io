---
layout: default1
nav: dsml-reports
title: Exploratory Data Analysis - DSML
is_slide: 0
---



# **A Comprehensive Report on Exploratory Data Analysis: Methods, Analysis, and Strategic Application**

## **Executive Summary**

Exploratory Data Analysis (EDA) is a foundational discipline in statistics and data science, serving as a critical first step in any analytical workflow. It is an iterative and investigative approach that moves beyond traditional assumptions to discover the inherent characteristics of a dataset. By combining statistical graphics and data visualization with descriptive statistical techniques, EDA provides a holistic understanding of a dataset's main features, including patterns, relationships, and anomalies. This report provides a detailed examination of EDA, its core principles, the most commonly used diagram types and statistical analyses, and the crucial roles of outlier and correlation analysis. The objective is to provide an authoritative guide that illustrates how a methodical approach to EDA can yield profound insights, inform subsequent modeling efforts, and ensure the validity and reliability of all data-driven conclusions.

## **1\. The Foundational Discipline: A Definitive Introduction to Exploratory Data Analysis**

### **1.1. Defining EDA: Beyond a First Look**

Exploratory Data Analysis is a systematic and investigative approach for analyzing datasets to summarize their main characteristics, often utilizing statistical graphics and other data visualization methods.1 EDA is not merely a cursory glance at data; it is an important, and often non-negotiable, first step in any data project.2 Its primary objective is to develop a deep and intuitive understanding of the data's inherent properties. This includes identifying general patterns, uncovering unexpected features, and spotting anomalies that might otherwise go unnoticed.2 By getting a "feel for the data" before applying more advanced techniques, analysts can discover useful patterns and remove irregularities that could compromise the integrity of later analysis.3

### **1.2. Core Principles and Objectives of EDA**

The practice of EDA is guided by a set of core principles that collectively aim to prepare and understand data for subsequent use. These objectives are interconnected, with the successful completion of one step often informing the next.  
A foundational principle is **data quality assessment**. This involves a thorough check of the dataset to identify issues such as errors, missing values, and inconsistencies.4 Unaddressed data quality issues can severely impact downstream analysis and model-building efforts. For example, visualizing variables with histograms can quickly reveal unexpected values that warrant further investigation, while computing summary statistics can highlight variables with a significant number of missing values that need to be handled before analysis.4  
Another key objective is the **discovery of individual variable attributes**. EDA seeks to uncover the main characteristics of each variable in isolation. This includes understanding the distribution of numeric variables—which may be normal, skewed, or multimodal—as well as identifying the range of values and the most frequently occurring values for categorical variables.4 A thorough understanding of each variable is a prerequisite for a meaningful analysis of their relationships.  
Third, EDA aims to **detect relationships and patterns** between variables. This moves beyond the analysis of single variables to investigate associations, correlations, or subgroups that exist within the dataset.4 Visualizations and statistical techniques are employed to explore interactions between two or more variables. For instance, creating scatter plots can reveal correlations between variables, while dimensionality reduction techniques can expose otherwise hidden clusters within high-dimensional data.3  
Finally, the insights gained from EDA are vital for **informing modeling efforts and generating hypotheses**. The findings serve a crucial purpose by guiding the selection of optimal variables for predictive models, helping to choose appropriate machine learning algorithms, and generating new hypotheses about the underlying data structure.4 For example, if a preliminary analysis shows that certain attributes are highly correlated, an analyst may choose to remove one to avoid redundancy in a model.4 This process ensures that the results of more sophisticated analysis are both valid and actionable.3

### **1.3. The Philosophical Divide: EDA vs. Confirmatory Data Analysis**

Exploratory Data Analysis is fundamentally different from traditional hypothesis testing, also known as confirmatory data analysis (CDA). The distinction lies in their core philosophical approaches to data. In CDA, a model or hypothesis is selected *before* the data is even seen, and the analysis is a formal process of testing that predefined assumption.1 In contrast, EDA's primary purpose is to see what the data can reveal  
*beyond* formal modeling.5 This is an approach of discovery, where the analyst is encouraged to explore the data freely and possibly formulate new hypotheses that can then be tested formally in a later stage.1  
This difference in methodology highlights a critical shift in the analytical mindset. The EDA practitioner is an explorer, searching for the unknown and allowing the data to guide the investigation. The CDA practitioner is a validator, using the data to confirm or deny a specific, pre-existing theory. This philosophical contrast underscores the essential, preliminary role of EDA. By first engaging in a discovery-oriented process, analysts can identify underlying structures, detect anomalies, and determine relationships between variables.3 The knowledge gained from this exploration directly informs and enhances the quality and validity of any subsequent confirmatory analysis, ensuring that the questions being asked are the right ones.6

## **2\. The Visual Lexicon: Common Diagram Types for EDA**

Data visualization is an indispensable component of EDA, as it allows analysts to "look at" their data and quickly grasp variables and the relationships between them.7 The choice of diagram depends on the type of data and the specific analytical question.

### **2.1. Univariate Visualizations: Understanding Single Variables**

These visualizations are used to understand the characteristics and distribution of a single variable.

* **Histograms:** A histogram is a fundamental tool that summarizes a data distribution by placing observations into defined intervals, or "bins," and then counting the number of observations within each interval.2 Histograms are excellent for visualizing the shape of a distribution—identifying if it is normally distributed, skewed, or multimodal—and for spotting common or unusual values.8 The appearance of a histogram can be highly dependent on the number or width of the bins chosen, and a careful selection can reveal subtle but interesting features. For instance, a histogram of tip amounts might show unusual peaks at whole and half-dollar values, revealing a behavioral pattern of customers rounding their tips.1  
* **Boxplots:** A box-and-whisker plot provides a compact, powerful summary of a variable's distribution using five key numbers: the minimum, the first quartile (Q1), the median, the third quartile (Q3), and the maximum.2 Boxplots are particularly useful for visually identifying potential outliers, which are often plotted as individual points beyond the "whiskers" of the box.2 They are also highly effective for comparing the distributions of different subsets of a variable side-by-side.2  
* **Q-Q Plots and Cumulative Distribution Functions (CDFs):** These graphical methods are used to assess a variable's distribution against a theoretical one, such as a normal distribution.2 A Q-Q plot compares the quantiles of a variable to the quantiles of a theoretical distribution. If the data closely approximates the theoretical distribution, the points will fall on a straight line. This is a critical step for checking whether assumptions underlying specific statistical methods, such as least-squares regression, are supported by the data.2 A CDF, in contrast, shows the probability that an observation of a variable is not larger than a specified value.2

### **2.2. Bivariate and Multivariate Visualizations: Revealing Relationships**

These visualizations are used to explore the relationships between two or more variables.

* **Scatter Plots:** The scatter plot is the primary tool for visualizing the relationship between two variables.9 It plots data points on a two-dimensional plane with one variable on the horizontal axis and another on the vertical axis.2 Scatter plots are invaluable for visualizing linear or nonlinear associations between variables and for identifying outliers that deviate significantly from the main cluster of data points.2  
* **Heatmaps and Correlation Matrices:** A heatmap is a graphical representation where values are depicted by color.6 When used as a correlation matrix, a heatmap provides a comprehensive, at-a-glance view of the pairwise correlation coefficients between numerous numerical features.6 This allows analysts to quickly uncover dependencies and highly correlated variables within the dataset.13  
* **Scatter Matrix Plots:** Also known as a pair plot, a scatter matrix displays a grid of pairwise scatter plots for all numerical variables in a dataset.6 This provides a systematic way to identify relationships between multiple variables at once.

The selection of the appropriate visualization is a contingent decision based on the type of data and the specific analytical question. A standard process involves beginning with univariate plots to understand the individual characteristics of each variable. This foundational step is a necessary prerequisite for moving to bivariate and multivariate analyses. By understanding the distribution and properties of each variable in isolation, an analyst can then effectively interpret the more complex relationships revealed by a scatter plot or a correlation matrix. This structured, step-by-step approach ensures that insights are derived logically and are not the result of misleading patterns.

| Category | Diagram Type | Primary Purpose | Key Insights Provided |
| :---- | :---- | :---- | :---- |
| **Univariate** | Histogram | Visualize the distribution and frequency of a single variable. | Shape (normal, skewed), central tendency, frequency of values, multimodality. |
|  | Boxplot | Provide a compact, five-number summary of a distribution. | Median, quartiles, range, spread, and potential outliers. |
|  | Q-Q Plot | Compare a variable's distribution against a theoretical one. | Adherence to a specific distribution (e.g., normality), deviations from theory. |
|  | CDF | Show the cumulative probability of a variable's observations. | Probability that a value is less than or equal to a specified value. |
| **Bivariate** | Scatter Plot | Visualize the relationship and correlation between two variables. | Linear or nonlinear relationships, trends, direction of association, outliers. |
| **Multivariate** | Heatmap/Correlation Matrix | Visualize the correlation between numerous numerical features. | Strength and direction of pairwise correlations, dependencies between variables. |
|  | Scatter Matrix Plot | Display pairwise relationships for multiple variables simultaneously. | A comprehensive view of all bivariate relationships in a dataset. |

## **3\. The Analytical Toolkit: Statistical Analyses in EDA**

### **3.1. Descriptive Statistics: The Quantitative Summary**

Descriptive statistics are a cornerstone of EDA, providing a numerical summary of a dataset's main characteristics.1 They are so integral that EDA methods are often referred to as descriptive statistics because they simply describe the data at hand.15 John Tukey, the pioneer of EDA, promoted the use of the five-number summary—the two extremes (min, max), the median, and the quartiles—because these measures are robust and defined for all distributions, unlike the mean and standard deviation which are sensitive to outliers and skewness.1

* **Measures of Central Tendency:** These measures provide a snapshot of the "center" or "typical" value of a dataset.  
  * **Mean:** The average value, calculated by summing all data points and dividing by the count.3 It is sensitive to outliers.  
  * **Median:** The middle value of a sorted dataset.3 It is highly robust to extreme values, making it a reliable measure for skewed distributions.  
  * **Mode:** The most frequently occurring value in a dataset.14 It is useful for both numerical and categorical data.  
* **Measures of Dispersion:** These measures quantify the spread or variability of the data.  
  * **Standard Deviation and Variance:** Quantify the average deviation of data points from the mean.3 They are sensitive to outliers.  
  * **Interquartile Range (IQR):** The range of the middle half of the data, calculated as the difference between the 75th percentile (Q3) and the 25th percentile (Q1).10 The IQR is particularly robust to outliers and is a key component in the statistical method for identifying them.

The emphasis on robust statistics like the median and IQR demonstrates a fundamental principle of EDA: to avoid making assumptions about the data's underlying distribution until it has been thoroughly explored. Using these measures mitigates the risk of drawing misleading conclusions from skewed or outlier-ridden data, which is precisely the type of information EDA is designed to uncover. This deliberate choice of measures is a proactive analytical step that ensures the validity of initial findings.

### **3.2. Advanced Statistical Methods**

Beyond descriptive statistics, more advanced techniques are also part of the EDA toolkit, especially when dealing with high-dimensional datasets. These methods often serve a dual purpose of both analysis and visualization.

* **Dimensionality Reduction:** Techniques such as Principal Component Analysis (PCA) and t-SNE are used to reduce the number of variables to a more manageable size (e.g., two or three dimensions).1 This allows for the graphical display of complex, multi-variable data, which would otherwise be impossible to visualize.6  
* **Clustering Analysis:** Unsupervised learning algorithms, such as k-means clustering, are employed to automatically identify clusters or subgroups within a dataset.3 This can reveal hidden patterns or segmentations that are not apparent from simpler analyses.1

| Measure Type | Measure | Calculation/Description | Key Advantage | Primary Use Case |
| :---- | :---- | :---- | :---- | :---- |
| **Central Tendency** | Mean | The average value of a dataset. | Intuitive, widely understood. | Normally distributed data. |
|  | Median | The middle value of a sorted dataset. | Robust to outliers and skewness. | Skewed or non-normal data. |
|  | Mode | The most frequently occurring value. | Applicable to categorical data. | Identifying common categories or values. |
| **Dispersion** | Standard Deviation | A measure of data spread from the mean. | Indicates data variability. | Normally distributed data. |
|  | Variance | The square of the standard deviation. | Provides a quantitative measure of spread. | Formal statistical calculations. |
|  | Interquartile Range (IQR) | The range of the middle 50% of the data. | Robust to outliers. | Identifying data spread in skewed data. |

## **4\. Outlier Analysis: Detecting and Understanding Anomalies**

### **4.1. The Critical Role of Outlier Identification**

Outliers are data points that deviate significantly from the majority of observations in a dataset.12 Their identification is a core objective of EDA, as they can reveal unexpected patterns or features that might otherwise be missed.2 Outliers have a disproportionate influence on statistical measures, particularly the mean, and can lead to misleading conclusions if not properly handled.12  
A critical aspect of outlier analysis is the distinction between two types of extreme values:

1. **True Outliers:** These values represent natural variations within the population.16 For example, a professional athlete's running time would be an outlier in a sample of college students, but it is a valid data point that should be retained.  
2. **Errors:** These outliers result from incorrect data entry, equipment malfunction, or other measurement errors.16 For instance, a typo in a data entry field could produce a value that is far outside the reasonable range.

Because an outlier isn't always incorrect data, an analyst must be cautious and determine its most likely cause before taking action.16

### **4.2. Methodologies for Outlier Detection**

Analysts can use a combination of visual and statistical methods to identify outliers.

* **Visual Methods:**  
  * **Boxplots:** As previously discussed, boxplots are an excellent visual tool for detecting outliers, which are often plotted as individual points that lie beyond the whiskers.12  
  * **Scatter Plots:** Outliers can be easily spotted in a scatter plot as data points that are isolated and lie far from the main cluster of data.12  
* **Statistical Methods:**  
  * **Z-Score Method:** This method measures how many standard deviations a data point is from the mean.16 A common rule of thumb is to consider any value with a z-score greater than 3 or less than \-3 to be a potential outlier.16  
  * **Interquartile Range (IQR) Method:** This is a more robust method that uses the IQR to define "fences" around the data.16 Any value that falls outside the upper fence (  
    Q3+1.5×IQR) or the lower fence (Q1−1.5×IQR) is flagged as an outlier.16

### **4.3. Strategic Handling of Outliers**

The decision of how to handle an outlier is a crucial, strategic decision point in the analytical process. The choice depends entirely on the outlier's probable cause.16

* **Retention:** True outliers, which represent natural variations, should always be retained in the dataset.16 Removing them would create a biased sample and lead to inaccurate conclusions about the population.  
* **Removal or Transformation:** If an outlier is determined to be a measurement or data entry error, it may be necessary to remove or transform it.19 Other methods for handling error-based outliers include reducing their weight, changing their values (e.g., Winsorisation), or using imputation to replace them with a more representative value like the median.20

The process of outlier analysis is a clear example of how EDA bridges technical execution with contextual understanding. An analyst's role is not just to detect an anomaly, but to interpret its meaning in the context of the data and the problem domain. The decision of whether to keep or discard an outlier is a critical output of this process, directly impacting the integrity and validity of all subsequent analysis.

| Detection Method | Data Visualization Example | Handling Strategy | Recommended Action Based on Cause |
| :---- | :---- | :---- | :---- |
| **Visual** | Boxplot, Scatter Plot | Keep, Remove, or Transform | **True Variation:** Keep and analyze further. |
|  |  |  | **Measurement/Entry Error:** Remove or transform. |
| **Statistical** | Z-Score, IQR Method | Keep, Remove, or Transform | **True Variation:** Keep and use robust statistical measures. |
|  |  |  | **Measurement/Entry Error:** Remove or replace with a corrected value. |

## **5\. Correlation Analysis: Quantifying Variable Relationships**

### **5.1. The Purpose and Value of Correlation in EDA**

Correlation analysis is a statistical method for measuring the covariance, or degree of association, between two or more variables in a matched data set.2 In EDA, correlation is primarily a data exploration technique used to reveal the strength and direction of these associations.2 It serves several key purposes:

* **Feature Selection:** Correlation helps identify which variables are important for a predictive model and which might be redundant.24 If two attributes are highly correlated, an analyst may choose to remove one to simplify the model and avoid issues like multicollinearity.4  
* **Gaining Business Insights:** Correlation can quickly reveal relationships that are valuable for business strategies, such as how customer demographics relate to purchasing behavior or how wait times relate to patient satisfaction in a hospital setting.17

It is important to understand that correlation analysis identifies associations, not causation. An analyst uses correlation as a signpost, pointing toward potential relationships that require further investigation with more rigorous methods, such as regression analysis, to determine if a causal link exists.2

### **5.2. A Technical Guide to Correlation Coefficients**

The choice of correlation coefficient is a technical decision that depends on the data's distribution and type.27

* **Pearson's Product-Moment Correlation Coefficient (r):**  
  * **Use Case:** This is the most common coefficient and is appropriate when both variables are normally distributed.27  
  * **What it Measures:** It quantifies the strength and direction of a *linear* relationship, with a value ranging from \-1 (perfect negative linear correlation) to \+1 (perfect positive linear correlation).27 A value of 0 indicates no linear relationship.  
  * **Sensitivity:** A key limitation is its high sensitivity to extreme values, which can either exaggerate or dampen the perceived strength of the relationship.28  
* **Spearman's Rank Correlation Coefficient (rs​):**  
  * **Use Case:** This non-parametric alternative is appropriate when one or both variables are skewed, ordinal, or when the data contains extreme values.28  
  * **What it Measures:** It measures the strength of a monotonic relationship between the ranked values of two variables.  
  * **Robustness:** Unlike Pearson's coefficient, Spearman's is robust to outliers, meaning that the presence of extreme values will have little to no effect on the correlation value.28

The choice between Pearson's and Spearman's coefficient is not arbitrary. It is a direct result of the prior EDA steps, particularly the analysis of variable distributions and the identification of outliers. The use of Spearman's coefficient is a deliberate response to the detection of non-normal distributions or anomalies, demonstrating an analyst's nuanced understanding of the data's characteristics. This process of using earlier findings to inform later analytical choices is central to effective EDA.

| Coefficient | Assumptions | Sensitivity to Outliers | What it Measures |
| :---- | :---- | :---- | :---- |
| **Pearson's r** | Both variables are normally distributed. | High | The strength of a linear relationship. |
| **Spearman's rs​** | Variables can be skewed, ordinal, or contain outliers. | Low/Robust | The strength of a monotonic relationship between ranks. |

## **6\. The Practical Application of EDA: A Synthesis**

### **6.1. A Practical Workflow for EDA**

EDA is best performed as a structured, iterative process. While the steps can be fluid, a typical workflow includes:

1. **Understand the Problem and the Data:** Begin by clearly defining the business or research question and familiarizing yourself with the dataset's variables, their meaning, and their data types.29  
2. **Data Sourcing and Cleaning:** Collect data from various sources and perform initial cleaning to handle missing values, duplicates, and correct data types.3  
3. **Univariate Analysis:** Explore each variable individually using a combination of descriptive statistics and visualizations like histograms and boxplots.31  
4. **Bivariate and Multivariate Analysis:** Investigate relationships between variables using scatter plots, correlation matrices, and other multivariate plots.31  
5. **Outlier Handling:** Identify and strategically address anomalies based on their likely cause, documenting the decision process.29  
6. **Data Transformation and Feature Engineering:** Prepare the data for modeling by scaling numeric variables, encoding categorical ones, or creating new features from existing data.4  
7. **Communicate Findings:** Summarize and present the findings using a combination of descriptive statistics, visualizations, and a clear narrative for stakeholders.3

### **6.2. Case Study: EDA in Healthcare for Disease Prediction**

Healthcare is a prime example of a field where EDA is a vital tool for turning complex data into actionable insights.26 In a hospital setting, EDA can be applied to a dataset to identify trends, patterns, and correlations related to variables such as patient wait times, age, and satisfaction scores.17  
The process begins by examining the raw data. A histogram of patient satisfaction scores can reveal their distribution, indicating if feedback is generally high, low, or follows a normal pattern.17 This is an example of univariate analysis. From there, an analyst may formulate a hypothesis, such as "patient wait times are related to their satisfaction," and then investigate this association with a bivariate analysis. A scatter plot of  
age versus wait\_time can visualize this relationship, and a correlation matrix can be calculated to quantify the degree of association between wait\_time, age, and satisfaction\_score.17  
The findings from these steps can provide profound insights. For instance, the analysis may reveal that older patients are associated with longer wait times, which can inform hospital management to investigate resource allocation and staffing in certain departments. The application of more advanced techniques, like k-means clustering on patient age and wait\_time data, can uncover distinct patient subgroups with different needs, motivating the creation of specialized care models.17  
This case study demonstrates how EDA is not a linear, one-and-done process but a dynamic, iterative cycle. The findings from one step—a visual discovery from a histogram—inform the next analytical choice, such as the need for a specific statistical test. This iterative cycle of observation, hypothesis generation, and targeted analysis ultimately allows a researcher to draw meaningful connections that lead to improved patient outcomes and more effective preventive care.26

## **7\. Conclusion and Strategic Recommendations**

Exploratory Data Analysis is more than a simple set of statistical techniques; it is a strategic imperative that underpins all robust data analysis. Its fundamental purpose is to provide a comprehensive, unbiased view of the data before any assumptions are made or formal models are built. By prioritizing data quality, understanding variable distributions, and identifying relationships and anomalies, EDA ensures that all subsequent analysis is valid and reliable.  
Based on the evidence presented in this report, the following recommendations are essential for effective EDA:

* **Embrace a Holistic Approach:** Blend visual and non-graphical statistical methods to gain a multi-faceted understanding of the data. Use graphical representations to quickly spot trends and anomalies, and then use descriptive statistics to provide a precise, quantitative summary.  
* **Prioritize Data Quality:** Treat the assessment of data quality as the most critical first step. The integrity of all subsequent findings rests on the accuracy of the underlying data.  
* **Treat Outlier Analysis as a Strategic Decision:** Do not automatically remove outliers. Instead, first investigate their cause to determine if they represent a true anomaly or a data error. The decision to retain, remove, or transform them should be a deliberate, documented choice.  
* **Use Correlation to Inform, Not to Prove:** Employ correlation analysis to identify potential relationships that are worth investigating further. It is a signpost for future analysis, not a final conclusion about causation.  
* **Leverage EDA to Drive New Hypotheses:** Beyond simply preparing data for a predetermined model, use EDA as a tool for discovery. The patterns and anomalies it reveals can lead to new, powerful hypotheses that drive innovative solutions and business value.

#### **Referenzen**

1. Exploratory data analysis \- Wikipedia, Zugriff am August 29, 2025, [https://en.wikipedia.org/wiki/Exploratory\_data\_analysis](https://en.wikipedia.org/wiki/Exploratory_data_analysis)  
2. Exploratory Data Analysis | US EPA, Zugriff am August 29, 2025, [https://www.epa.gov/caddis/exploratory-data-analysis](https://www.epa.gov/caddis/exploratory-data-analysis)  
3. What is Exploratory Data Analysis| Data Preparation Guide 2024 \- Simplilearn.com, Zugriff am August 29, 2025, [https://www.simplilearn.com/tutorials/data-analytics-tutorial/exploratory-data-analysis](https://www.simplilearn.com/tutorials/data-analytics-tutorial/exploratory-data-analysis)  
4. A Comprehensive Guide to Mastering Exploratory Data Analysis, Zugriff am August 29, 2025, [https://www.dasca.org/world-of-data-science/article/a-comprehensive-guide-to-mastering-exploratory-data-analysis](https://www.dasca.org/world-of-data-science/article/a-comprehensive-guide-to-mastering-exploratory-data-analysis)  
5. en.wikipedia.org, Zugriff am August 29, 2025, [https://en.wikipedia.org/wiki/Exploratory\_data\_analysis\#:\~:text=A%20statistical%20model%20can%20be,before%20the%20data%20is%20seen.](https://en.wikipedia.org/wiki/Exploratory_data_analysis#:~:text=A%20statistical%20model%20can%20be,before%20the%20data%20is%20seen.)  
6. What is Exploratory Data Analysis? \- IBM, Zugriff am August 29, 2025, [https://www.ibm.com/think/topics/exploratory-data-analysis](https://www.ibm.com/think/topics/exploratory-data-analysis)  
7. www.codecademy.com, Zugriff am August 29, 2025, [https://www.codecademy.com/article/eda-data-visualization\#:\~:text=Data%20visualization%20is%20an%20important,variables%20and%20relationships%20between%20them.](https://www.codecademy.com/article/eda-data-visualization#:~:text=Data%20visualization%20is%20an%20important,variables%20and%20relationships%20between%20them.)  
8. 10 Exploratory data analysis \- R for Data Science (2e) \- Hadley Wickham, Zugriff am August 29, 2025, [https://r4ds.hadley.nz/EDA.html](https://r4ds.hadley.nz/EDA.html)  
9. Different Plots Used in Exploratory Data Analysis (EDA) \- Comet, Zugriff am August 29, 2025, [https://www.comet.com/site/blog/different-plots-used-in-exploratory-data-analysis-eda/](https://www.comet.com/site/blog/different-plots-used-in-exploratory-data-analysis-eda/)  
10. Perform Exploratory Data Analysis, Zugriff am August 29, 2025, [https://gro-1.itrcweb.org/perform-exploratory-data-analysis/](https://gro-1.itrcweb.org/perform-exploratory-data-analysis/)  
11. www.stratascratch.com, Zugriff am August 29, 2025, [https://www.stratascratch.com/blog/using-visualizations-for-your-exploratory-data-analysis/\#:\~:text=The%20most%20common%20are%3A,box%20plots](https://www.stratascratch.com/blog/using-visualizations-for-your-exploratory-data-analysis/#:~:text=The%20most%20common%20are%3A,box%20plots)  
12. What are Outliers in Data? \- GeeksforGeeks, Zugriff am August 29, 2025, [https://www.geeksforgeeks.org/machine-learning/what-are-outliers-in-data/](https://www.geeksforgeeks.org/machine-learning/what-are-outliers-in-data/)  
13. The Power of Visualization in EDA \- DZone, Zugriff am August 29, 2025, [https://dzone.com/articles/the-power-of-visualization-in-exploratory-data-ana](https://dzone.com/articles/the-power-of-visualization-in-exploratory-data-ana)  
14. Small Note on Descriptive Statistics, Exploratory Data Analysis, Zugriff am August 29, 2025, [https://unacademy.com/content/csir-ugc/study-material/mathematical-sciences/descriptive-statistics-exploratory-data-analysis/](https://unacademy.com/content/csir-ugc/study-material/mathematical-sciences/descriptive-statistics-exploratory-data-analysis/)  
15. stats.libretexts.org, Zugriff am August 29, 2025, [https://stats.libretexts.org/Bookshelves/Applied\_Statistics/Biostatistics\_-\_Open\_Learning\_Textbook/Unit\_1%3A\_Exploratory\_Data\_Analysis\#:\~:text=Exploratory%20data%20analysis%20(EDA)%20methods,about%20the%20population%20under%20study.](https://stats.libretexts.org/Bookshelves/Applied_Statistics/Biostatistics_-_Open_Learning_Textbook/Unit_1%3A_Exploratory_Data_Analysis#:~:text=Exploratory%20data%20analysis%20\(EDA\)%20methods,about%20the%20population%20under%20study.)  
16. How to Find Outliers | 4 Ways with Examples & Explanation \- Scribbr, Zugriff am August 29, 2025, [https://www.scribbr.com/statistics/outliers/](https://www.scribbr.com/statistics/outliers/)  
17. Exploratory Data Analysis (EDA) Report on Hospital Data | by Helen-Nellie Adigwe, Zugriff am August 29, 2025, [https://medium.com/@helennellieadigwe/exploratory-data-analysis-eda-report-on-hospital-data-c9ab2d4a6eb8](https://medium.com/@helennellieadigwe/exploratory-data-analysis-eda-report-on-hospital-data-c9ab2d4a6eb8)  
18. www.coursera.org, Zugriff am August 29, 2025, [https://www.coursera.org/articles/what-are-outliers\#:\~:text=Outliers%20are%20data%20points%20that%20lie%20outside%20the%20majority%20of,that%20misrepresent%20the%20data%20sample.](https://www.coursera.org/articles/what-are-outliers#:~:text=Outliers%20are%20data%20points%20that%20lie%20outside%20the%20majority%20of,that%20misrepresent%20the%20data%20sample.)  
19. medium.com, Zugriff am August 29, 2025, [https://medium.com/@heysan/understanding-and-handling-outliers-in-data-analysis-727a768650fe\#:\~:text=To%20detect%20outliers%20in%20data,or%20replace%20the%20outlier%20data.](https://medium.com/@heysan/understanding-and-handling-outliers-in-data-analysis-727a768650fe#:~:text=To%20detect%20outliers%20in%20data,or%20replace%20the%20outlier%20data.)  
20. Outlier detection and treatment \- The World Bank, Zugriff am August 29, 2025, [https://thedocs.worldbank.org/en/doc/20f02031de132cc3d76b91b5ed8737d0-0050012017/related/lecture-12-1.pdf](https://thedocs.worldbank.org/en/doc/20f02031de132cc3d76b91b5ed8737d0-0050012017/related/lecture-12-1.pdf)  
21. Understanding and Handling Outliers in Data Analysis | by Sandy ..., Zugriff am August 29, 2025, [https://medium.com/@heysan/understanding-and-handling-outliers-in-data-analysis-727a768650fe](https://medium.com/@heysan/understanding-and-handling-outliers-in-data-analysis-727a768650fe)  
22. What is Correlation Analysis? Definition, Types & How to Measure, Zugriff am August 29, 2025, [https://www.questionpro.com/features/correlation-analysis.html](https://www.questionpro.com/features/correlation-analysis.html)  
23. pmc.ncbi.nlm.nih.gov, Zugriff am August 29, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC8572982/\#:\~:text=The%20correlation%20coefficient%20is%20a,the%20agreement%20between%20two%20methods.](https://pmc.ncbi.nlm.nih.gov/articles/PMC8572982/#:~:text=The%20correlation%20coefficient%20is%20a,the%20agreement%20between%20two%20methods.)  
24. medium.com, Zugriff am August 29, 2025, [https://medium.com/@dinanksoni5/correlation-analysis-in-eda-for-machine-learning-a-simple-guide-92d4a1a87651\#:\~:text=Correlation%20helps%20the%20computer%20learn,also%20helps%20us%20spot%20problems.](https://medium.com/@dinanksoni5/correlation-analysis-in-eda-for-machine-learning-a-simple-guide-92d4a1a87651#:~:text=Correlation%20helps%20the%20computer%20learn,also%20helps%20us%20spot%20problems.)  
25. Speed Up Exploratory Data Analysis (EDA) with the Correlation Funnel • correlationfunnel, Zugriff am August 29, 2025, [https://business-science.github.io/correlationfunnel/](https://business-science.github.io/correlationfunnel/)  
26. Exploratory Data Analysis: Real-World Examples for Researchers ..., Zugriff am August 29, 2025, [https://insight7.io/exploratory-data-analysis-real-world-examples-for-researchers/](https://insight7.io/exploratory-data-analysis-real-world-examples-for-researchers/)  
27. Correlation (Coefficient, Partial, and Spearman Rank) and ... \- NCBI, Zugriff am August 29, 2025, [https://www.ncbi.nlm.nih.gov/books/NBK606101/](https://www.ncbi.nlm.nih.gov/books/NBK606101/)  
28. A guide to appropriate use of Correlation coefficient in medical ..., Zugriff am August 29, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC3576830/](https://pmc.ncbi.nlm.nih.gov/articles/PMC3576830/)  
29. Steps for Mastering Exploratory Data Analysis | EDA Steps \- GeeksforGeeks, Zugriff am August 29, 2025, [https://www.geeksforgeeks.org/data-analysis/steps-for-mastering-exploratory-data-analysis-eda-steps/](https://www.geeksforgeeks.org/data-analysis/steps-for-mastering-exploratory-data-analysis-eda-steps/)  
30. Complete Exploratory Data Analysis: Step by step guide for Data Analyst | by Ankush Mulkar, Zugriff am August 29, 2025, [https://ankushmulkar.medium.com/complete-exploratory-data-analysis-step-by-step-guide-for-data-analyst-34a07156217a](https://ankushmulkar.medium.com/complete-exploratory-data-analysis-step-by-step-guide-for-data-analyst-34a07156217a)  
31. What is Exploratory Data Analysis: Types, Tools, & Examples | Airbyte, Zugriff am August 29, 2025, [https://airbyte.com/data-engineering-resources/exploratory-data-analysis](https://airbyte.com/data-engineering-resources/exploratory-data-analysis)