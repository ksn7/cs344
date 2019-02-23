"""
This module contains altered code from joint.py
By kvlinden for lab04 in CS 344

@author Kelsey Brouwer
@version 22feb2019
"""

from probability import JointProbDist, enumerate_joint_ask

# The Joint Probability Distribution Fig. 13.3 (from AIMA Python)
P = JointProbDist(['Toothache', 'Cavity', 'Catch'])
T, F = True, False
P[T, T, T] = 0.108; P[T, T, F] = 0.012
P[F, T, T] = 0.072; P[F, T, F] = 0.008
P[T, F, T] = 0.016; P[T, F, F] = 0.064
P[F, F, T] = 0.144; P[F, F, F] = 0.576

# Compute P(Cavity|Toothache=T)  (see the text, page 493).
PC = enumerate_joint_ask('Cavity', {'Toothache': T}, P)
print("P(Cavity|Toothache): ")
print(PC.show_approx())

# Compute P(Cavity|Catch)
# By hand: P(Cavity|Catch) = P(Cavity ^ Catch) / P(Catch)
#             = (0.108 + 0.072) / (0.108 + 0.072 + 0.016 + 0.144)
#             = 0.180 / 0.340 = .529
PC = enumerate_joint_ask('Cavity', {'Catch': T}, P)
print("P(Cavity|Catch): ")
print(PC.show_approx())

P = JointProbDist(['Coin1', 'Coin2'])
P[T, T] = .25; P[T, F] = .25
P[F, T] = .25; P[F, F] = .25
PC = enumerate_joint_ask('Coin2', {'Coin1': T}, P)
print("Assuming T to be heads, F to be tails, P(Coin2|Coin1): ")
print(PC.show_approx())

# This seems correct to me, since two coins flipping should be independent events
