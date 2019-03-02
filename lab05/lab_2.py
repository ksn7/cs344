'''
This module implements the Bayesian network shown in the lab, showing chances of cancer based on test results.
Modeled after network.py by kvlinden for CS 344 lab05

@author: ksn7
@version Mar 1, 2019
'''

from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# Bayes Net with values from lab
cancer = BayesNet([
    ('Cancer', '', 0.01),
    ('Test1', 'Cancer', {T: 0.9, F: 0.2}),
    ('Test2', 'Cancer', {T: 0.9, F: 0.2})
    ])

# Compute P(Cancer | both tests are positive)
# Computation in photo upload
print("P(Cancer | both tests are positive)")
print(enumeration_ask('Cancer', dict(Test1=T, Test2=T), cancer).show_approx())
print("This result makes sense, since there's a relatively high chance of getting a false positive, and the chance of "
      "cancer is quite low.\n")

# Compute P(Cancer | Test1 is positive, Test2 is negative)
# Computation in photo upload
print("P(Cancer | Test1 is positive, Test2 is negative)")
print(enumeration_ask('Cancer', dict(Test1=T, Test2=F), cancer).show_approx())
print("This makes sense. Since the tests have such a high chance of being positive if cancer is present, a negative"
      "\ntest result indicates that its is likely the patient does not have cancer.")
