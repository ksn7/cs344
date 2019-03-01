'''
This module implements the Bayesian network shown in the text, Figure 14.2.
It's taken from the AIMA Python code.

@author: kvlinden
@version Jan 2, 2013

Modified for in-lab exercises
@author: ksn7
@version Mar 1, 2019
'''

from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# From AIMA code (probability.py) - Fig. 14.2 - burglary example
burglary = BayesNet([
    ('Burglary', '', 0.001),
    ('Earthquake', '', 0.002),
    ('Alarm', 'Burglary Earthquake', {(T, T): 0.95, (T, F): 0.94, (F, T): 0.29, (F, F): 0.001}),
    ('JohnCalls', 'Alarm', {T: 0.90, F: 0.05}),
    ('MaryCalls', 'Alarm', {T: 0.70, F: 0.01})
    ])

''' Examples left by Prof VL '''
# Compute P(Burglary | John and Mary both call).
# elimination_ask() is a dynamic programming version of enumeration_ask().
# print(elimination_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# gibbs_ask() is an approximation algorithm helps Bayesian Networks scale up.
# print(gibbs_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# See the explanation of the algorithms in AIMA Section 14.4.

# Compute P(Alarm | burglary but no earthquake)
print("P(Alarm | burglary but no earthquake")
print(elimination_ask('Alarm', dict(Burglary=T, Earthquake=F), burglary).show_approx())
print("This makes sense, since this is an explicit value in the table.")

# Compute P(JohnCalls | burglary but no earthquake)
print("\nP(JohnCalls | burglary but no earthquake")
print(elimination_ask('JohnCalls', dict(Burglary=T, Earthquake=F), burglary).show_approx())
print("The high value is correct, since John usually calls if the alarm goes off, and more than likely if the alarm"
      "goes off it is a burglary.")

# Compute P(Burglary | alarm)
print("\nP(Burglary | alarm)")
print(elimination_ask('Burglary', dict(Alarm=T), burglary).show_approx())
print("This is correct, since there is a chance the alarm went off because of an earthquake or for no reason.")

# Compute P(Burglary | John and Mary both call)
print("\nP(Burglary } John and Mary both call")
print(elimination_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
print("John and Mary both calling is already pretty rare, and both have a chance of calling even without the alarm "
      "going off! \nSince there's also the chance that the alarm is going off for a reason other than a burglary, this "
      "isn't very high.")
