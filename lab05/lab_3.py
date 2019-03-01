'''
This module implements the Bayesian network shown in the lab, showing chances of happiness as caused by factors.
Modeled after network.py by kvlinden for CS 344 lab05

@author: ksn7
@version Mar 1, 2019
'''

from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# Bayes Net with values from lab
happy = BayesNet([
    ('Sunny', '', 0.7),
    ('Raise', '', 0.01),
    ('Happy', 'Sunny Raise', {(T, T): 1.0, (T, F): 0.7, (F, T): 0.9, (F, F): 0.1})
    ])

# Compute P(Raise | sunny)
print("P(Raise | sunny)")
print(elimination_ask('Raise', dict(Sunny=T), happy).show_approx())
print("This makes sense since these are independent events and have no effect on each other's probability."
      "\nThe probability comes directly from the table.\n")

# Compute P(Raise | happy ^ sunny)
print("P(Raise | happy and sunny)")
print(elimination_ask('Raise', dict(Sunny=T, Happy=T), happy).show_approx())
print("Again, sunny has no effect on the raise, but the effect happy could be because of a raise. Thus the presence"
      " of the happy condition \nmakes a slight difference. However, the chance of a raise is so small that it makes"
      " very little difference.\n")

# Compute P(Raise | happy)
print("P(Raise | happy)")
print(elimination_ask('Raise', dict(Happy=T), happy).show_approx())
print("It makes sense that this probability is slightly higher than the last probability. This is because last time "
      "we knew it was sunny, which is a \nprobable cause for the happiness. This time, since we don't know that "
      "it's sunny, there's a higher chance that the happiness is caused by a raise. \nBut similarly to last time, "
      "this chance is quite low, so this probability is not much higher than the last one.\n")

# Compute P(Raise | happy ^ -sunny)
print("P(Raise | happy and not sunny)")
print(elimination_ask('Raise', dict(Happy=T, Sunny=F), happy).show_approx())
print("This probability also makes sense. In this case we know that the happiness is NOT caused by it being sunny, "
      "so the chance that the happiness is the \nresult of a raise and not just random happiness is proportionally much"
      " higher. However, the chance of a raise is so small that this probability remains under 10%.\n")
