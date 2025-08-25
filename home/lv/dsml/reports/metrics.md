---
layout: default1
nav: dsml-reports
title: ML Metrics
is_slide: 0
---



# **A Comprehensive Report on Main Evaluation Metrics in Machine Learning for Regression and Classification**

## **Executive Summary**

The selection and interpretation of evaluation metrics are fundamental to the success of any machine learning project. These metrics serve as objective feedback mechanisms, providing quantitative measures to assess a model's performance, guide the optimization process, and facilitate meaningful comparisons between different algorithms. The choice of an appropriate metric is not merely a technical detail; it is a strategic decision dictated by the specific problem domain, the nature of the data, and, most critically, the asymmetric costs of different types of prediction errors. This report provides a detailed analysis of the most common metrics for both regression and classification tasks, examining their underlying principles, practical use cases, and inherent trade-offs. It is an authoritative guide intended to move practitioners and stakeholders beyond a simplistic view of model performance toward a principled approach to evaluation.

## **1\. Introduction: The Imperative of Strategic Model Evaluation**

### **1.1 The Role of Evaluation Metrics in the ML Lifecycle**

In the life cycle of a machine learning model, evaluation metrics serve as a constructive feedback mechanism.1 After a model is built and trained, these metrics provide the objective criteria necessary to assess its predictive ability, generalization capabilities, and overall quality.1 By offering insights into how well a model is performing, they provide crucial direction for subsequent improvements, such as hyperparameter tuning or feature engineering.2 Without a clear and relevant set of metrics, it is impossible to determine if an algorithm is learning effectively, whether it is generalizing beyond its training data, or if it is suitable for deployment in a real-world application. The selection of an appropriate metric is the first step in ensuring that a model's performance aligns with its intended objective and the desired business outcome.

### **1.2 The Dichotomy of ML Tasks: Regression vs. Classification**

The field of supervised machine learning is broadly divided into two primary categories, each requiring a distinct set of evaluation tools. The first category is **regression**, which involves algorithms designed to predict a continuous numerical value. This could include tasks such as forecasting stock prices, predicting house values, or estimating delivery times.1 The second category is  
**classification**, where the objective is to predict the discrete class to which a data point belongs. This is used in problems like identifying spam emails, detecting fraudulent transactions, or diagnosing a medical condition.1 The fundamental difference between these two tasks—predicting a number versus a category—necessitates entirely different quantitative measures for performance evaluation.

## **2\. A Deep Dive into Regression Metrics: Quantifying Continuous Errors**

Regression metrics are quantitative measures used to evaluate the quality of a model that predicts continuous numerical values.2 These metrics assess how well a model's predictions align with the actual data.

### **2.1 Mean Absolute Error (MAE): The Intuitive and Robust Measure**

The Mean Absolute Error (MAE) is a widely used metric in both statistics and machine learning. It measures the average magnitude of the errors in a set of predictions, without considering their direction.4 Mathematically, it is the average of the absolute differences between the actual values and the predicted values.2 The formula for MAE for a dataset with  
n data points is:  
MAE=n1​∑i=1n​∣yi​−y^​i​∣  
where yi​ is the actual value and y^​i​ is the predicted value.2  
A defining characteristic of MAE is its linear penalization of errors. The use of absolute values means that every error is treated equally, regardless of its size.5 An error of 10 units is penalized twice as much as an error of 5 units, a direct and proportional relationship. This property makes MAE highly robust to outliers.4 In a dataset with a few extreme values, MAE is not disproportionately influenced by them, serving as a reliable metric in environments with significant measurement noise or when occasional large errors are less critical to the overall modeling objective.4 MAE is also intuitively understandable; an MAE of 5, for instance, directly means that, on average, the model's predictions are off by 5 units from their true values.5  
Due to its robustness and straightforward interpretability, MAE is the preferred metric in several practical applications. A prime example is **delivery time estimates**, where the goal is to provide a consistent average prediction error to users.7 In this scenario, a few extreme outlier delays are expected and do not need to disproportionately influence the overall performance metric. Similarly, MAE is widely used in social science research and customer sentiment analysis, fields characterized by high measurement uncertainty, where a uniform measure of error is more valuable than a metric that over-emphasizes rare deviations.5

### **2.2 Mean Squared Error (MSE) and Root Mean Squared Error (RMSE): The Sensitivity to High-Impact Errors**

The Mean Squared Error (MSE) is another popular metric in regression analysis.2 It is calculated as the average of the squares of the differences between the actual and predicted values.4 The formula for MSE is:  
MSE=n1​∑i=1n​(yi​−y^​i​)2  
The Root Mean Squared Error (RMSE) is the square root of the MSE.2 Its formula is:  
RMSE=n1​∑i=1n​(yi​−y^​i​)2​  
The key difference between these metrics and MAE lies in the squaring of the errors.4 This mathematical operation gives a disproportionately large weight to larger errors, effectively penalizing them much more heavily than smaller errors.4 For example, a single error of 10 units is squared to 100, while a smaller error of 1 unit is squared to 1\. This characteristic makes both MSE and RMSE highly sensitive to outliers.5  
RMSE is often preferred over MSE for reporting because it is expressed in the same units as the target variable, making it more directly interpretable.4 For instance, in  
**house price prediction**, an RMSE of $20,000 means the model's average error is $20,000, which is a meaningful and intuitive figure for stakeholders to understand the model's performance in a real-world context.7 The sensitivity of RMSE to large errors also makes it ideal for high-stakes scenarios, such as  
**financial forecasting** and **energy consumption forecasting**, where a single large error can have significant financial implications or cause operational failures.5 In such cases, the goal is not just to minimize the average error but to specifically reduce the occurrence of large, high-impact deviations.5

### **2.3 The Coefficient of Determination (R-squared, R²): The Goodness of Fit**

The R-squared (R2) score, also known as the coefficient of determination, is a statistical metric that assesses the goodness of fit of a regression model.2 It quantifies the proportion of the variance in the dependent variable that is predictable from the independent variables.4 The formula is:  
R2=1−SSTSSR​  
where SSR is the sum of squared residuals and SST is the total sum of squares.2  
Unlike MAE and RMSE, which measure the magnitude of absolute error, R2 provides a sense of the model's explanatory power relative to a simple baseline model that just predicts the mean of the dependent variable.4 It is a scale-independent measure, meaning its value is not affected by the magnitude or units of the data.4 This allows for a straightforward comparison of models on different datasets or with different units. A value of  
R2 close to 1 indicates that the model explains a large portion of the variance in the data, suggesting a strong fit.4 In a  
**house price prediction model**, an R2 of 0.85 indicates that 85% of the variance in house prices is explained by the model's features, such as square footage and the number of bedrooms.7 This makes  
R2 an excellent tool for evaluating the overall effectiveness and explanatory power of a model.2

### **Table 1: Core Regression Metrics and Their Characteristics**

| Metric | Formula | Outlier Sensitivity | Interpretation | Primary Use Case |
| :---- | :---- | :---- | :---- | :---- |
| **Mean Absolute Error (MAE)** | $MAE \= \\frac{1}{n} \\sum\_{i=1}^{n} | y\_i \- \\hat{y}\_i | $ | Low / Robust |
| **Mean Squared Error (MSE)** | MSE=n1​∑i=1n​(yi​−y^​i​)2 | High / Sensitive | Average squared error. | High-stakes scenarios where large errors are particularly detrimental. |
| **Root Mean Squared Error (RMSE)** | RMSE=n1​∑i=1n​(yi​−y^​i​)2​ | High / Sensitive | Average error magnitude, in same units as data. | Financial and house price forecasting, or when large errors must be heavily penalized. |
| **R-squared (R²)** | R2=1−SSTSSR​ | Variable / Context-dependent | Proportion of variance explained by the model. | Assessing the overall explanatory power and goodness of fit of a model. |

## **3\. Foundational Metrics for Classification: Navigating Predicted Classes**

Classification metrics are used to evaluate the performance of models that predict discrete classes. These metrics are often derived from a foundational tool called the confusion matrix.

### **3.1 The Confusion Matrix: The Bedrock of Classification Analysis**

The confusion matrix is a fundamental performance measurement for classification problems.1 It is a matrix of size  
N×N, where N is the number of predicted classes.1 For a binary classification problem (e.g., classifying a tumor as malignant or benign), the matrix is  
2×2. It provides a clear, tabular view of how a classification model's predictions align with the actual values.12 This matrix contains four crucial values that form the basis for all other classification metrics:

* **True Positives (TP):** The number of cases where the model correctly predicted the positive class.  
* **True Negatives (TN):** The number of cases where the model correctly predicted the negative class.  
* **False Positives (FP):** The number of cases where the model incorrectly predicted the positive class when the actual value was negative. This is also known as a Type I Error.  
* **False Negatives (FN):** The number of cases where the model incorrectly predicted the negative class when the actual value was positive. This is also known as a Type II Error.

These four values from the confusion matrix are used to calculate the various metrics that provide a more nuanced understanding of a model's performance than a single number could ever offer.12

### **Table 2: The Confusion Matrix Explained**

|  | Predicted Negative | Predicted Positive |
| :---- | :---- | :---- |
| **Actual Negative** | True Negatives (TN) | False Positives (FP) |
| **Actual Positive** | False Negatives (FN) | True Positives (TP) |

### **3.2 Accuracy: Simplicity and its Deceptive Nature**

Accuracy is the most straightforward classification metric and is defined as the proportion of all correct predictions out of all predictions made by the model.10 The formula is:  
Accuracy=TP+TN+FP+FNTP+TN​  
While accuracy is simple to understand, it can be a highly deceptive metric, particularly when dealing with **imbalanced datasets**.11 An imbalanced dataset is one where one class significantly outweighs the other. Consider a medical diagnosis model for a rare disease that affects only 1% of the population. A naive model that simply predicts "no disease" for every patient would achieve a 99% accuracy score.13 While this number appears excellent on the surface, the model would have completely failed its primary purpose: to correctly identify individuals with the disease. This demonstrates that accuracy alone can mask a catastrophic failure to correctly classify the minority, yet most critical, class.10

### **3.3 Precision: The Focus on Minimizing False Positives**

Precision, also known as Positive Predictive Value, answers the question: "Of all the positive predictions made by the model, how many were actually correct?".11 It measures the accuracy of the model's positive predictions and focuses on minimizing False Positives (FP).8 The formula for precision is:  
Precision=TP+FPTP​  
Precision is the crucial metric in scenarios where the cost of a false positive is high.8 For example, in a  
**spam email filter**, a false positive would mean a legitimate and potentially critical email is incorrectly classified as spam, causing inconvenience and potential financial loss for the user.8 In a  
**fraud detection system**, a false positive would flag a legitimate transaction as fraudulent, inconveniencing the customer and leading to a poor user experience.15 Maximizing precision is therefore a primary goal in these applications, as it directly reduces these costly false alarms.13

### **3.4 Recall (Sensitivity): The Focus on Minimizing False Negatives**

Recall, also known as sensitivity or the True Positive Rate, answers the question: "Of all the actual positive cases, how many did the model correctly identify?".10 It measures the model's ability to capture all relevant positive instances and focuses on minimizing False Negatives (FN).8 The formula for recall is:  
Recall=TP+FNTP​  
Recall is the most important metric when the cost of a false negative is extremely high.8 The most cited example is  
**medical diagnosis**, such as **cancer detection**.8 In this context, a false negative—a patient with cancer is incorrectly diagnosed as healthy—could delay critical treatment and have severe or fatal consequences. The goal is to identify every single positive case, even if it results in some false positives that require additional, albeit non-fatal, testing.12 Similarly, in a  
**security threat detection system**, a false negative would mean a genuine threat is missed, which could lead to significant harm or loss.11

### **3.5 The F1-Score: The Harmonic Mean of Trade-offs**

The F1-Score is the harmonic mean of precision and recall.10 The formula is:  
F1=2⋅Precision+RecallPrecision⋅Recall​  
The F1-Score is particularly useful in situations where a balance between precision and recall is required, as it combines both into a single number.10 A high F1-Score indicates that the model has a strong performance on both metrics, with neither being disproportionately low. This metric is a preferred alternative to accuracy when dealing with imbalanced datasets because it provides a more robust and honest evaluation of the model's performance on the minority class.11  
A key application of the F1-Score is in **medical imaging systems**, where a high F1-Score is crucial.15 A high recall is needed to ensure all disease cases are identified, while high precision is necessary to avoid unnecessary treatments and anxiety caused by false alarms. The F1-Score provides a single value that represents the model's ability to navigate this critical trade-off.15 It also finds widespread use in other contexts with imbalanced data, such as credit card fraud detection.8

### **3.6 The ROC Curve and AUC: The Threshold-Independent Performance View**

The ROC (Receiver Operating Characteristic) curve is a graphical representation of a binary classifier's performance across all possible classification thresholds.8 It plots the True Positive Rate (TPR, or recall) against the False Positive Rate (FPR) at various thresholds.10 The AUC (Area Under the Curve) is a single number that summarizes the overall performance of the classifier.17 It measures the area under the ROC curve and ranges from 0 to 1, with a score of 0.5 indicating a model that performs no better than random guessing and a score of 1.0 representing a perfect model.8  
The primary value of AUC lies in its threshold-independent nature.17 While precision, recall, and the F1-Score are all "snapshots" of performance at a single, fixed threshold, AUC provides an aggregate measure of a model's ability to discriminate between positive and negative classes across all possible thresholds.17 This makes it a particularly suitable metric for  
**imbalanced datasets**, as it measures the model's discriminative power regardless of the class distribution.17 It is an excellent metric for  
**comparing different models**, as it provides a single, reliable number to summarize their overall performance without being skewed by class imbalance or a specific threshold setting.17

### **Table 3: Core Classification Metrics and Formulas**

| Metric | Formula | What It Measures | Primary Use Case | Suitability for Imbalanced Data |
| :---- | :---- | :---- | :---- | :---- |
| **Accuracy** | TP+TN+FP+FNTP+TN​ | Overall proportion of correct predictions. | Simple, balanced datasets. | Misleading; avoid as a single metric. |
| **Precision** | TP+FPTP​ | Proportion of positive predictions that were correct. | When minimizing false positives is critical (e.g., spam detection, fraud detection). | Good, if the goal is to minimize FP. |
| **Recall** | TP+FNTP​ | Proportion of actual positives correctly identified. | When minimizing false negatives is critical (e.g., medical diagnosis, security systems). | Good, if the goal is to minimize FN. |
| **F1-Score** | 2⋅Precision+RecallPrecision⋅Recall​ | Harmonic mean of precision and recall. | When a balance between false positives and false negatives is needed. | Ideal; robust measure for the minority class. |
| **ROC AUC** | Area under ROC Curve | Discriminative ability across all thresholds. | Model comparison, imbalanced datasets, when class balance may shift. | Excellent; measures class separability regardless of frequency. |

## **4\. Advanced Comparative Analysis: A Strategic Framework for Metric Selection**

### **4.1 The Regression Metric Trade-off: MAE vs. RMSE**

The choice between MAE and RMSE is a classic dilemma in regression analysis. The fundamental difference lies in how they penalize errors.5 MAE treats all errors equally, while RMSE heavily penalizes large errors due to the squaring of the residuals.5 This makes RMSE a powerful tool for applications where high-impact errors are particularly detrimental, such as in finance or quality control.5  
However, the true value of these metrics is often revealed when they are used in tandem. A crucial diagnostic signal arises when a model shows a **low MAE but a high RMSE**.5 This specific combination of values indicates that while the model's average error is small and its predictions are generally close to the actual values, it is occasionally making a few severe, high-impact prediction errors. In this scenario, the squaring of those few large errors in the RMSE calculation inflates the overall score, while the MAE, which is more robust to these extremes, remains low.5 This analysis suggests that the model may have a high variance and is failing to handle a small number of outlying data points, which are either noise or represent a genuine, but rare, phenomenon. Understanding this distinction can direct the next steps in model development, prompting a focus on outlier detection, data preprocessing, or the selection of a more robust algorithm.5

### **Table 4: Regression Metrics: MAE vs. RMSE vs. R²**

| Metric | Outlier Sensitivity | What it Emphasizes | Interpretability | Key Diagnostic Insight |
| :---- | :---- | :---- | :---- | :---- |
| **MAE** | Low | Error magnitude | Directly corresponds to average prediction error. | A low MAE suggests the model is generally on target. |
| **RMSE** | High | Variance of errors | Expressed in the same units as the data. | A high RMSE suggests the presence of a few high-impact errors. |
| **R²** | Context-dependent | Explanatory power | A value from 0 to 1 indicating goodness of fit. | A low R² can signal a high-bias model that fails to capture the data's variance. |

### **4.2 The Classification Dilemma: Precision vs. Recall**

The relationship between precision and recall presents a fundamental trade-off in classification problems.12 A model can be tuned to maximize recall, thereby catching all positive cases, but this will often lead to an increase in false positives and a subsequent drop in precision.12 Conversely, tuning a model for high precision may lead to an increase in false negatives and a decrease in recall. The decision of which metric to prioritize is a strategic one that must be directly tied to the specific business objective and the relative costs of different types of errors.8  
Consider the problem of **spam detection**.8 Here, a false positive (a legitimate email classified as spam) is far more costly than a false negative (a spam email getting through). Therefore, the business objective is to minimize false positives, which means  
**prioritizing precision**. The model must be highly confident in its positive predictions.  
Now consider **medical diagnosis**, specifically cancer detection.12 A false negative (a patient with a disease is missed) is far more catastrophic than a false positive (a healthy patient is flagged and requires further, non-fatal tests). In this context, the objective is to ensure no positive case is missed, which means  
**prioritizing recall**. The model's metric choice is a direct reflection of its risk tolerance and the business's core purpose.13

### **Table 5: Classification Metrics: Aligning to Business Objectives**

| Business Objective | Corresponding Metric to Prioritize | Example Application |
| :---- | :---- | :---- |
| **Minimize False Alarms** | Precision | Spam detection, fraud detection, quality control. |
| **Ensure No Positive Case is Missed** | Recall | Medical diagnosis, security threat detection. |
| **Achieve a Balanced Performance** | F1-Score | Medical imaging, imbalanced datasets where both error types are costly. |
| **Assess Overall Discriminative Power** | ROC AUC | Model comparison, customer churn prediction. |

## **5\. Conclusion: Towards a Principled Approach to Model Evaluation**

Evaluation metrics are the cornerstone of effective machine learning. This report has demonstrated that their selection is far from a trivial exercise; it is a strategic decision that reflects a deep understanding of the problem domain and the real-world costs of misclassification.  
It is a common pitfall to rely on a single metric, particularly accuracy, as a universal indicator of model quality.8 This practice can lead to a dangerously incomplete and misleading assessment of performance, especially with imbalanced data. Instead, a robust and principled approach to model evaluation necessitates the use of a combination of metrics. For regression, a joint analysis of MAE and RMSE can provide powerful diagnostic insights into the nature of prediction errors.5 For classification, moving beyond accuracy to the confusion matrix, precision, recall, and F1-Score is essential for understanding the nuanced trade-offs and ensuring the model's performance aligns with its intended business objective.12 The ultimate choice of metric is not merely a technical decision but a strategic one, deeply rooted in the problem's business context and the asymmetric costs of errors.

#### **Referenzen**

1. Evaluating machine learning models-metrics and techniques \- AI Accelerator Institute, Zugriff am August 20, 2025, [https://www.aiacceleratorinstitute.com/evaluating-machine-learning-models-metrics-and-techniques/](https://www.aiacceleratorinstitute.com/evaluating-machine-learning-models-metrics-and-techniques/)  
2. Regression Metrics \- GeeksforGeeks, Zugriff am August 20, 2025, [https://www.geeksforgeeks.org/machine-learning/regression-metrics/](https://www.geeksforgeeks.org/machine-learning/regression-metrics/)  
3. cohere.com, Zugriff am August 20, 2025, [https://cohere.com/blog/classification-eval-metrics\#:\~:text=Classification%20Evaluation%20Metrics%3A%20Accuracy%2C%20Precision,Recall%2C%20and%20F1%20Visually%20Explained\&text=How%20do%20you%20evaluate%20the,commonly%20used%20classification%20evaluation%20metrics.\&text=In%20machine%20learning%2C%20classification%20is,to%20which%20input%20data%20belongs.](https://cohere.com/blog/classification-eval-metrics#:~:text=Classification%20Evaluation%20Metrics%3A%20Accuracy%2C%20Precision,Recall%2C%20and%20F1%20Visually%20Explained&text=How%20do%20you%20evaluate%20the,commonly%20used%20classification%20evaluation%20metrics.&text=In%20machine%20learning%2C%20classification%20is,to%20which%20input%20data%20belongs.)  
4. MSE vs RMSE vs MAE vs MAPE vs R-Squared: When to Use?, Zugriff am August 20, 2025, [https://vitalflux.com/mse-vs-rmse-vs-mae-vs-mape-vs-r-squared-when-to-use/](https://vitalflux.com/mse-vs-rmse-vs-mae-vs-mape-vs-r-squared-when-to-use/)  
5. RMSE vs. MAE: 6 Statistical Insights for Data Accuracy, Zugriff am August 20, 2025, [https://www.numberanalytics.com/blog/rmse-vs-mae-6-statistical-insights-for-data-accuracy](https://www.numberanalytics.com/blog/rmse-vs-mae-6-statistical-insights-for-data-accuracy)  
6. Which Evaluation metrics serves better, RMSE or MAE? \- Kaggle, Zugriff am August 20, 2025, [https://www.kaggle.com/discussions/questions-and-answers/389844](https://www.kaggle.com/discussions/questions-and-answers/389844)  
7. Understanding MSE, MAE, RMSE and Their ... \- CodeSignal, Zugriff am August 20, 2025, [https://codesignal.com/learn/courses/deep-dive-into-regression-and-classification-metrics/lessons/understanding-mse-mae-rmse-and-their-differences](https://codesignal.com/learn/courses/deep-dive-into-regression-and-classification-metrics/lessons/understanding-mse-mae-rmse-and-their-differences)  
8. How to Choose the Right Metric for Your Model \- Codefinity, Zugriff am August 20, 2025, [https://codefinity.com/blog/How-to-Choose-the-Right-Metric-for-Your-Model](https://codefinity.com/blog/How-to-Choose-the-Right-Metric-for-Your-Model)  
9. Know The Best Evaluation Metrics for Your Regression Model \- Analytics Vidhya, Zugriff am August 20, 2025, [https://www.analyticsvidhya.com/blog/2021/05/know-the-best-evaluation-metrics-for-your-regression-model/](https://www.analyticsvidhya.com/blog/2021/05/know-the-best-evaluation-metrics-for-your-regression-model/)  
10. Evaluation Metrics in Machine Learning \- GeeksforGeeks, Zugriff am August 20, 2025, [https://www.geeksforgeeks.org/machine-learning/metrics-for-machine-learning-model/](https://www.geeksforgeeks.org/machine-learning/metrics-for-machine-learning-model/)  
11. Performance Metrics: Confusion matrix, Precision, Recall, and F1 Score, Zugriff am August 20, 2025, [https://towardsdatascience.com/performance-metrics-confusion-matrix-precision-recall-and-f1-score-a8fe076a2262/](https://towardsdatascience.com/performance-metrics-confusion-matrix-precision-recall-and-f1-score-a8fe076a2262/)  
12. Confusion Matrix Made Simple: Accuracy, Precision, Recall & F1 ..., Zugriff am August 20, 2025, [https://towardsdatascience.com/confusion-matrix-made-simple-accuracy-precision-recall-f1-score/](https://towardsdatascience.com/confusion-matrix-made-simple-accuracy-precision-recall-f1-score/)  
13. Classification: Accuracy, recall, precision, and related metrics | Machine Learning, Zugriff am August 20, 2025, [https://developers.google.com/machine-learning/crash-course/classification/accuracy-precision-recall](https://developers.google.com/machine-learning/crash-course/classification/accuracy-precision-recall)  
14. Classification Metrics. When it comes to solving problems in… | by Vyankatesh Kulkarni | Medium, Zugriff am August 20, 2025, [https://medium.com/@vyankatesh.kulkarni20/classification-metrics-63c635852995](https://medium.com/@vyankatesh.kulkarni20/classification-metrics-63c635852995)  
15. What is F1 Score? A Computer Vision Guide. \- Roboflow Blog, Zugriff am August 20, 2025, [https://blog.roboflow.com/f1-score/](https://blog.roboflow.com/f1-score/)  
16. Guide to AUC ROC Curve in Machine Learning \- Analytics Vidhya, Zugriff am August 20, 2025, [https://www.analyticsvidhya.com/blog/2020/06/auc-roc-curve-machine-learning/](https://www.analyticsvidhya.com/blog/2020/06/auc-roc-curve-machine-learning/)  
17. How to explain the ROC AUC score and ROC curve? \- Evidently AI, Zugriff am August 20, 2025, [https://www.evidentlyai.com/classification-metrics/explain-roc-curve](https://www.evidentlyai.com/classification-metrics/explain-roc-curve)  
18. Precision and recall \- Wikipedia, Zugriff am August 20, 2025, [https://en.wikipedia.org/wiki/Precision\_and\_recall](https://en.wikipedia.org/wiki/Precision_and_recall)