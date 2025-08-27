---
layout: default1
nav: dsml-reports
title: Cross-Validation in Machine Learning - DSML
is_slide: 0
---


# **An Expert-Level Analysis of Cross-Validation in Machine Learning**

## **Chapter 1: The Imperative of Robust Model Validation**

### **1.1 The Foundational Problem: The Illusion of Perfection**

In the field of machine learning, a fundamental methodological mistake is to train a predictive model and then evaluate its performance using the same data. This practice, known as overfitting, leads to a model that has simply memorized the specific patterns, features, and even noise of its training data, rather than learning the underlying, generalizable relationships. A model subjected to this flawed validation process will often exhibit a perfect or near-perfect score, creating a false sense of security for the practitioner.1 The illusion of perfection is a dangerous one. A practitioner may conclude that their model is robust and ready for production, only for it to fail catastrophically when deployed to make predictions on new, unseen data.3 This failure is a direct consequence of a poor evaluation process. The causal link is clear: an overly optimistic evaluation, stemming from a lack of true separation between training and testing data, leads to a false belief in the model's capabilities, which in turn results in its poor generalization in a real-world setting. A robust validation framework is therefore not a mere technical detail but a critical risk-mitigation strategy to ensure the reliability and utility of any machine learning system.

### **1.2 Why a Simple Train-Test Split is Insufficient**

The most straightforward attempt to circumvent the problem of overfitting is to divide the dataset into two distinct partitions: a training set and a testing set, a method often referred to as the holdout method.4 A model is then trained exclusively on the training set and evaluated on the test set, which it has not previously encountered. While this approach is a significant improvement over in-sample evaluation, it is fundamentally insufficient for providing a reliable performance estimate. The primary drawback of a single train-test split is its high variance, particularly when working with small datasets.4  
The performance metric derived from a single, random partition can be highly dependent on which specific data points happen to fall into the test set. For instance, if the random split places samples that are easy to classify into the test set, the resulting performance score may be unrealistically high and overly optimistic.4 Conversely, if the test set is, by chance, populated with difficult or anomalous data points (outliers), the model's performance may appear to be unfairly low.4 This inherent unreliability means that the single evaluation score cannot be trusted as a stable or representative measure of the model's true capabilities. The problem of high variance is a direct outcome of the random nature of the split, which fails to guarantee a representative test set. This instability highlights the need for a more sophisticated, multi-faceted approach to model evaluation, which cross-validation was specifically developed to provide.4

### **1.3 The Core Purpose of Cross-Validation**

Cross-validation is a statistical technique designed to provide a more accurate and stable assessment of a machine learning model's performance and its ability to generalize to new, unseen data.1 The overarching objective of this methodology is to yield an unbiased and robust estimate of the model's generalization error—a measure of how well it predicts future observations.1 This practice is used to compare and select different models for a specific application, fine-tune their hyperparameters, and ultimately build more reliable and trustworthy algorithms.1  
The concept of an "unbiased" estimate is central to the value of cross-validation. By systematically evaluating a model across multiple, non-overlapping test sets, the final performance metric is shielded from the influence of any single, fortuitous data split. This robust process moves model development from an ad-hoc procedure to a scientifically rigorous one, enabling a fair and consistent comparison of various algorithms under identical conditions.1 This approach empowers practitioners to make informed decisions about which model will perform most effectively and reliably in a production environment.

## **Chapter 2: The Canonical Method: K-Fold Cross-Validation**

### **2.1 Step-by-Step Breakdown of the K-Fold Process**

K-Fold cross-validation is the most widely adopted and foundational method for assessing a model's generalization capability. The procedure is systematic and repeatable, providing a reliable performance estimate. The process begins by partitioning the original dataset into *k* equally sized subsets, commonly referred to as folds.1 The model is then trained and evaluated  
*k* separate times. In each iteration, a unique fold is reserved as the test set, while the remaining k−1 folds are combined to form the training set.1 For each of these  
*k* trials, a performance metric, such as accuracy or error, is computed based on the model's predictions on the designated test fold.1 Once all  
*k* iterations are complete, the individual performance metrics are aggregated, typically by averaging them, to produce a single, final score that serves as the model's overall performance estimate.4 A notable advantage of this procedure is that every data point in the dataset is used for testing exactly once and for training  
k−1 times, ensuring comprehensive utilization of the available data.7

### **2.2 Choosing the Right Value for *k***

The selection of the parameter *k* is a critical design decision in the K-Fold process, as it directly influences the trade-off between the bias and variance of the performance estimate. Common choices for *k* are 5 or 10, values that have been empirically shown to strike a good balance between these competing forces.1  
A small value for *k*, such as k=2, results in training sets that are a significantly smaller portion of the overall data. A model trained on a small dataset may not have enough information to capture the full complexity of the problem, potentially leading to a biased performance estimate.7 Conversely, a very large value for  
*k* means that the training sets are nearly identical to the full dataset. While this leads to a low-bias estimate of performance, it can also result in high variance, as the performance score becomes highly sensitive to the single unique data point in each test fold.4 The "sweet spot" of  
k=5 or k=10 is not arbitrary; it represents a widely accepted best practice that avoids both excessive bias from small training sets and high variance from an overly fragmented test set.7 A large value of  
*k* also significantly increases the computational cost, as the model must be trained a large number of times.8

### **2.3 Worked Examples and Pseudocode**

To illustrate the K-Fold process, consider a small dataset with 6 samples. If we choose k=3, the dataset is divided into three folds, each containing 2 samples. The cross-validation process would then proceed in three iterations 4:

* **Iteration 1:** The model is trained on folds 2 and 3 and is tested on fold 1\. A performance score is recorded.  
* **Iteration 2:** The model is trained on folds 1 and 3 and is tested on fold 2\. A second performance score is recorded.  
* **Iteration 3:** The model is trained on folds 1 and 2 and is tested on fold 3\. A third performance score is recorded.

Finally, the overall performance estimate is calculated by averaging the three scores obtained from each iteration.4 This procedure ensures that each data point is used for both training and testing, leading to a more reliable assessment.

## **Chapter 3: Advanced Cross-Validation Techniques for Specific Challenges**

### **3.1 Addressing Imbalanced Data: Stratified K-Fold**

Standard K-Fold cross-validation, while effective for many problems, can produce misleading results when applied to imbalanced datasets, where the class labels are not evenly distributed.10 In a dataset with a large disparity between the number of samples in different classes (e.g., 80% Class 0 and 20% Class 1), a random split can, by chance, create training and test sets with skewed class proportions.10 This can result in a situation where the model never has an opportunity to learn to classify the minority class, leading to a deceptively high accuracy score that is not representative of its true performance.10  
The problem with random sampling on imbalanced data is not that it is inherently incorrect, but that it is unreliable in this specific context. A random split might, by chance, place all instances of the minority class into a single fold or even omit them from the training set entirely. This creates a biased evaluation because the model is not fairly tested on its ability to handle the full range of data distributions. Stratified K-Fold cross-validation provides a directed solution to this problem. It is a variation of K-Fold that explicitly ensures each fold maintains the same class distribution as the original dataset.9 By doing so, Stratified K-Fold guarantees that the training and test sets are always representative of the overall data, leading to more accurate and reliable performance metrics, which is crucial for real-world classification tasks.10

### **3.2 The Extreme Case: Leave-One-Out (LOO) Cross-Validation**

Leave-One-Out (LOO) cross-validation represents an extreme variation of the K-Fold method, where the number of folds, *k*, is equal to the total number of samples, *n*, in the dataset.4 In each iteration, a single data point is designated as the test set, while the remaining  
n−1 samples are used for training.4  
A significant advantage of the LOO method is its extremely low bias, as the model is trained on a training set that is nearly identical in size to the full dataset.9 However, this comes at a considerable cost. The method is computationally very expensive, as it requires training and evaluating the model  
*n* times.4 A more subtle and counter-intuitive pitfall is that LOO can lead to a high variance in the performance estimate.9 Because the test set consists of only a single data point, the performance score for each fold is a simple binary outcome (e.g., correct or incorrect prediction). The average score, therefore, becomes highly susceptible to a single outlier data point that happens to be in a test set, which can skew the overall performance estimate.9 This trade-off between low bias and potentially high variance is a critical consideration, and for large datasets, more computationally efficient methods like K-Fold are generally preferred.4

### **3.3 Handling Dependent Data: Group K-Fold**

Standard cross-validation methods, including K-Fold and its variations, operate under the assumption that all data points are independent of one another.14 However, this assumption is often violated in real-world datasets where samples are naturally grouped or clustered. For example, a dataset might contain multiple data points collected from the same individual, patient, or family.15 If these related samples are randomly split across the training and test sets, the model can inadvertently gain access to information from a subject that is also present in its training data. This constitutes a form of data leakage, as the model could learn person-specific features from the training set and use them to "predict" on the test set, leading to an over-optimistic performance evaluation.15  
GroupKFold is a specialized variation of K-Fold designed to address this issue. It ensures that all samples belonging to the same group are kept together, appearing exclusively in either the training set or the test set, but never both.15 This is a critical structural safeguard, preventing the model from "cheating" by learning from related data points in the training set and applying that knowledge to the test set.15 The failure to use GroupKFold in such scenarios can lead to a false positive result where a model appears to generalize well to new data but in reality has only memorized patterns from subjects it has already seen. The causal link is clear: dependent data combined with random splitting leads to information leakage, which produces overestimated performance metrics and ultimately results in a model that fails to generalize to genuinely new, unseen groups in production.15

### **Table 3.4: A Comparison of Cross-Validation Methods**

| Method | Primary Use Case | Key Advantage | Key Disadvantage | Computational Cost |
| :---- | :---- | :---- | :---- | :---- |
| **K-Fold** | General-purpose model evaluation | Reliable, low-bias estimate; widely applicable. | Can be susceptible to imbalanced data distributions. | High (requires *k* model trainings). |
| **Stratified K-Fold** | Classification with imbalanced datasets | Ensures consistent class proportions in each fold. | Slightly more complex to implement than standard K-Fold. | High (requires *k* model trainings). |
| **Leave-One-Out** | Small datasets | Very low bias; uses all data points for training. | High variance; extremely high computational cost. | Very High (requires *n* model trainings). |
| **Group K-Fold** | Data with dependent groups (e.g., from the same subject) | Prevents data leakage between related samples. | Requires group labels to be provided as input. | High (requires *k* model trainings). |

## **Chapter 4: The Critical Pitfall: Data Leakage and Its Prevention**

### **4.1 Defining Data Leakage**

Data leakage is one of the most insidious and dangerous pitfalls in the machine learning workflow. It occurs when a model is trained using information from the validation or test set that would not be available in a real-world, production environment.3 This unintentional exposure to future or unavailable data leads to a model that performs exceptionally well during validation but completely fails to generalize on truly new data. A model affected by data leakage can produce overly optimistic performance estimates, creating a false sense of confidence in its capabilities and rendering it useless in practice.3

### **4.2 Common Causes of Leakage in Cross-Validation**

The most frequently cited cause of data leakage in a cross-validation setting is performing preprocessing steps on the *entire dataset* before it is split into folds.3 For example, if a  
StandardScaler is fitted to the full dataset, it computes the mean and standard deviation using data from both the training and test sets. When this scaler is then applied to the training data, it is transformed using statistical information derived from the test set, effectively contaminating the training process.14 This violates the core principle of cross-validation, which demands that the training data and the test data remain strictly isolated. The root of the problem is a misunderstanding of the workflow: any processing step that depends on the data's overall distribution must be contained within the cross-validation loop and applied only to the data available at that specific point in time.18  
The causal relationship can be understood as follows: Global preprocessing \-\> Training data is transformed using statistics (mean, variance) derived from the entire dataset, including the test set \-\> The model is trained on "leaked" information about the test set's distribution \-\> The model appears to perform well on a contaminated test set \-\> Overly optimistic performance evaluation. The proper way to prevent this is by constructing a robust pipeline that encapsulates the entire data processing and model fitting workflow within each fold.14 Other forms of leakage can arise from improper splitting of time-dependent data or from including features that represent future information.3

### **4.3 The Solution: Implementing a Robust Cross-Validation Pipeline**

To reliably prevent data leakage, every data preprocessing step—such as scaling, normalization, feature selection, or imputation—must be applied *inside each fold* of the cross-validation procedure.14 This ensures that the training data is never influenced by any information from the validation set.14 The most effective and widely adopted approach to achieve this is through the use of a machine learning  
Pipeline.14 A pipeline systematically chains together all the necessary steps, guaranteeing that transformations are fitted and applied independently to the training data within each fold. This approach prevents information from the validation set from bleeding into the training process.14

### **4.4 Key Red Flags for Detecting Leakage**

Fortunately, data leakage often leaves discernible clues that can be detected through careful analysis. Practitioners should be vigilant for certain red flags 3:

* **Unusually High Performance:** If a model's performance on the validation data is significantly higher than expected or seems too good to be true, it may be a sign of leakage.  
* **Discrepancy between Training and Test Performance:** A large gap in performance between the training set and the test set can indicate that the model is overfitting due to leaked information.  
* **Inconsistent Cross-Validation Results:** If the performance across different cross-validation folds varies wildly or is unusually high, it could be a sign of improper data splitting or train-test leakage.  
* **Unexpected Model Behavior:** A model that relies heavily on features that have no logical connection to the target variable can be a strong indicator of leakage.

## **Chapter 5: Specialized Application: Cross-Validation for Time-Series Data**

### **5.1 Why Standard Cross-Validation Fails for Temporal Data**

Traditional cross-validation methods, such as K-Fold, rely on the core assumption that the data points are independent and can be randomly shuffled without compromising the integrity of the evaluation.14 This assumption is fundamentally violated in time series data, where samples are inherently dependent on their temporal order.20 For example, a stock price at time  
t+1 is directly influenced by its value at time t. Applying a standard random cross-validation split to time series data would be a methodological error, as it could result in the model being trained on future data points to predict past events. This is a severe form of data leakage that leads to a fundamentally flawed and non-sensical model performance.3  
The failure of standard cross-validation for time series data is a perfect illustration of a methodological mismatch. The causal chain is as follows: A violation of the random shuffling assumption, due to the temporal dependency in the data, leads to future data leaking into the training set, which in turn results in an overly optimistic and nonsensical model performance. This model, having been exposed to future information, will inevitably fail to generalize when deployed in a real-world, future-facing scenario.20 A different approach is therefore mandatory.

### **5.2 Walk-Forward Validation: A Mimic of Reality**

Walk-forward validation, also known as rolling-forward validation, is a specialized form of cross-validation designed specifically for time series data.20 This method's strength lies in its ability to accurately simulate a real-world scenario where a model is trained on historical data and used to make predictions on future, unseen data.22 It meticulously preserves the temporal order of the data, ensuring that the model is only ever trained on data from a period  
*before* the data it is asked to predict.14

### **5.3 The Expanding Window Approach**

One of the most common implementations of walk-forward validation is the expanding window method. This technique begins with an initial training dataset. For each subsequent iteration, the training window expands to include the most recent data points, while the model is evaluated on a fixed validation set that consists of the next data points in the sequence.23 For example, if the initial training set contains data from months 1-3, it is used to predict month 4\. In the next iteration, the training set expands to include data from months 1-4, which is then used to predict month 5, and so on.20 This process ensures that the model always has access to all available historical data up to the point of prediction, which can be beneficial for capturing long-term trends and dependencies.

### **5.4 The Rolling Window Approach**

An alternative implementation is the rolling window approach, also known as the sliding window. Unlike the expanding window, the training window in this method maintains a fixed size. As the window "rolls" forward in time, the oldest data is dropped as new data is added.20 This approach is often more suitable for data with non-stationary trends or concept drift, where older data may become less relevant over time. For example, a model trained on stock market data from the last 12 months might be more relevant for predicting the next month's prices than a model trained on data from the last 10 years. The choice between expanding and rolling windows is a strategic decision rooted in the nature of the data itself: the expanding window assumes that all historical data is equally relevant, while the rolling window assumes that only the most recent historical data is relevant.

### **5.5 Practical Examples and Visualization with scikit-learn**

The scikit-learn library provides a dedicated class, TimeSeriesSplit, to facilitate the implementation of these time series validation strategies.24 This class generates the necessary train/test indices while ensuring that the temporal order is respected and that future data is not used for training.24 The use of such a tool is crucial for practitioners, as it standardizes the process and helps to prevent the common pitfall of temporal data leakage.24

## **Chapter 6: Synthesis and Strategic Recommendations**

### **6.1 A Decision-Making Framework**

The selection of an appropriate cross-validation strategy is not a one-size-fits-all problem; it is a critical decision that depends on the specific characteristics of the dataset and the problem at hand. A practitioner should approach this choice with a structured decision-making framework, guided by a series of key questions:

1. **Is the data time-dependent?** If the answer is yes, then all standard, random-splitting methods are inappropriate. The only valid approaches are specialized time series techniques like walk-forward validation with either an expanding or a rolling window.14  
2. **Is the data imbalanced?** For classification problems with skewed class distributions, standard K-Fold may lead to biased evaluations. The correct approach is to use Stratified K-Fold to ensure each fold maintains the original class proportions.10  
3. **Are there dependent groups in the data?** If data points are related (e.g., multiple observations from the same subject), a simple random split can lead to data leakage and an overly optimistic evaluation. In such cases, Group K-Fold is the necessary method to ensure that all samples from a group are kept together in a single fold.15

By answering these questions, a practitioner can quickly and confidently navigate to the most appropriate and robust validation strategy for their specific problem, moving from a general understanding of cross-validation to a targeted application.

### **6.2 Best Practices for Implementation**

Beyond selecting the correct method, proper implementation is paramount to a successful validation process. The single most important best practice is to always use a Pipeline to wrap the entire machine learning workflow, including all preprocessing steps.14 This practice is a robust safeguard against data leakage, as it ensures that all transformations are fitted and applied independently within each cross-validation fold.14 For time series data, it is also essential to split the data chronologically to prevent future data from leaking into the training process.3 Finally, continuous monitoring for red flags, such as unusually high performance or inconsistent cross-validation scores, is crucial for self-diagnosing potential problems and ensuring the integrity of the model's evaluation.3

### **6.3 Conclusion: The Mindset of a Data Scientist**

In conclusion, cross-validation is a cornerstone of modern machine learning. Its purpose transcends the simple calculation of a performance metric; its true value lies in providing a reliable, robust, and trustworthy assessment of a model's true capabilities on unseen data.1 The journey from a basic understanding of a train-test split to a mastery of advanced techniques like walk-forward validation and Group K-Fold reflects the evolution from a novice to a seasoned practitioner. This expertise is not just about knowing the techniques but about understanding  
*why* they are necessary, the specific risks they mitigate, and the nuanced trade-offs involved in their application. Ultimately, a commitment to rigorous and thoughtful validation is a defining characteristic of a professional who builds reliable, trustworthy, and effective machine learning systems.

#### **Referenzen**

1. What Is Cross-Validation in Machine Learning? | Coursera, Zugriff am August 27, 2025, [https://www.coursera.org/articles/what-is-cross-validation-in-machine-learning](https://www.coursera.org/articles/what-is-cross-validation-in-machine-learning)  
2. 3.1. Cross-validation: evaluating estimator performance \- Scikit-learn, Zugriff am August 27, 2025, [https://scikit-learn.org/stable/modules/cross\_validation.html](https://scikit-learn.org/stable/modules/cross_validation.html)  
3. What is Data Leakage in Machine Learning? | IBM, Zugriff am August 27, 2025, [https://www.ibm.com/think/topics/data-leakage-machine-learning](https://www.ibm.com/think/topics/data-leakage-machine-learning)  
4. Cross-Validation: K-Fold vs. Leave-One-Out | Baeldung on ..., Zugriff am August 27, 2025, [https://www.baeldung.com/cs/cross-validation-k-fold-loo](https://www.baeldung.com/cs/cross-validation-k-fold-loo)  
5. Cross-Validation \- MATLAB & Simulink \- MathWorks, Zugriff am August 27, 2025, [https://www.mathworks.com/discovery/cross-validation.html](https://www.mathworks.com/discovery/cross-validation.html)  
6. What is Cross Validation and its types in Machine learning? Great Learning, Zugriff am August 27, 2025, [https://www.mygreatlearning.com/blog/cross-validation/](https://www.mygreatlearning.com/blog/cross-validation/)  
7. A Gentle Introduction to k-fold Cross-Validation \- MachineLearningMastery.com, Zugriff am August 27, 2025, [https://machinelearningmastery.com/k-fold-cross-validation/](https://machinelearningmastery.com/k-fold-cross-validation/)  
8. K- Fold Cross Validation Technique in Machine Learning, Zugriff am August 27, 2025, [https://www.analyticsvidhya.com/blog/2022/02/k-fold-cross-validation-technique-and-its-essentials/](https://www.analyticsvidhya.com/blog/2022/02/k-fold-cross-validation-technique-and-its-essentials/)  
9. Cross Validation: Key Concepts. Cross-validation is a crucial ..., Zugriff am August 27, 2025, [https://medium.com/@Mandeep2002/cross-validation-key-concepts-e089abfd7962](https://medium.com/@Mandeep2002/cross-validation-key-concepts-e089abfd7962)  
10. Stratified K Fold Cross Validation \- GeeksforGeeks, Zugriff am August 27, 2025, [https://www.geeksforgeeks.org/machine-learning/stratified-k-fold-cross-validation/](https://www.geeksforgeeks.org/machine-learning/stratified-k-fold-cross-validation/)  
11. Stratified Cross-Validation \- Clearly Explained \- Kaggle, Zugriff am August 27, 2025, [https://www.kaggle.com/code/ksvmuralidhar/stratified-cross-validation-clearly-explained](https://www.kaggle.com/code/ksvmuralidhar/stratified-cross-validation-clearly-explained)  
12. Cross Validation in Machine Learning \- GeeksforGeeks, Zugriff am August 27, 2025, [https://www.geeksforgeeks.org/machine-learning/cross-validation-machine-learning/](https://www.geeksforgeeks.org/machine-learning/cross-validation-machine-learning/)  
13. LeaveOneOut — scikit-learn 1.7.1 documentation, Zugriff am August 27, 2025, [https://scikit-learn.org/stable/modules/generated/sklearn.model\_selection.LeaveOneOut.html](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.LeaveOneOut.html)  
14. Avoiding Data Leakage in Cross-Validation | by Silva.f.francis ..., Zugriff am August 27, 2025, [https://medium.com/@silva.f.francis/avoiding-data-leakage-in-cross-validation-ba344d4d55c0](https://medium.com/@silva.f.francis/avoiding-data-leakage-in-cross-validation-ba344d4d55c0)  
15. Difference between KFolds and GroupKFolds \- Kaggle, Zugriff am August 27, 2025, [https://www.kaggle.com/discussions/questions-and-answers/361116](https://www.kaggle.com/discussions/questions-and-answers/361116)  
16. sklearn.model\_selection.GroupKFold — scikit-learn 1.0.2 documentation, Zugriff am August 27, 2025, [https://scikit-learn.org/1.0/modules/generated/sklearn.model\_selection.GroupKFold.html](https://scikit-learn.org/1.0/modules/generated/sklearn.model_selection.GroupKFold.html)  
17. GroupKFold — scikit-learn 1.7.1 documentation, Zugriff am August 27, 2025, [https://scikit-learn.org/stable/modules/generated/sklearn.model\_selection.GroupKFold.html](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.GroupKFold.html)  
18. medium.com, Zugriff am August 27, 2025, [https://medium.com/@silva.f.francis/avoiding-data-leakage-in-cross-validation-ba344d4d55c0\#:\~:text=To%20prevent%20data%20leakage%2C%20preprocessing,influenced%20by%20the%20validation%20data.](https://medium.com/@silva.f.francis/avoiding-data-leakage-in-cross-validation-ba344d4d55c0#:~:text=To%20prevent%20data%20leakage%2C%20preprocessing,influenced%20by%20the%20validation%20data.)  
19. Preventing Data Leakage in Machine Learning: A Guide | by Shashank Singhal \- Medium, Zugriff am August 27, 2025, [https://medium.com/geekculture/preventing-data-leakage-in-machine-learning-a-guide-51445af9fbaf](https://medium.com/geekculture/preventing-data-leakage-in-machine-learning-a-guide-51445af9fbaf)  
20. Walk forward validation : r/datascience \- Reddit, Zugriff am August 27, 2025, [https://www.reddit.com/r/datascience/comments/18pxc6x/walk\_forward\_validation/](https://www.reddit.com/r/datascience/comments/18pxc6x/walk_forward_validation/)  
21. GapRollForward — Time Series Cross-Validation 0.1.3 documentation, Zugriff am August 27, 2025, [https://tscv.readthedocs.io/en/latest/tutorial/roll\_forward.html](https://tscv.readthedocs.io/en/latest/tutorial/roll_forward.html)  
22. XGBoost Evaluate Model for Time Series using Walk-Forward Validation, Zugriff am August 27, 2025, [https://xgboosting.com/xgboost-evaluate-model-for-time-series-using-walk-forward-validation/](https://xgboosting.com/xgboost-evaluate-model-for-time-series-using-walk-forward-validation/)  
23. Illustration of expanding window walk-forward validation method ..., Zugriff am August 27, 2025, [https://www.researchgate.net/figure/llustration-of-expanding-window-walk-forward-validation-method\_fig3\_371672466](https://www.researchgate.net/figure/llustration-of-expanding-window-walk-forward-validation-method_fig3_371672466)  
24. TimeSeriesSplit — scikit-learn 1.7.1 documentation, Zugriff am August 27, 2025, [https://scikit-learn.org/stable/modules/generated/sklearn.model\_selection.TimeSeriesSplit.html](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.TimeSeriesSplit.html)