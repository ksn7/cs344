"""
This module implements local search on a simple sine function variant.
The function features hills that get progressively bigger towards the right.
Adapted from abs.py by kvlinden for cs344 lab02

@author: ksn7
@version 8feb2019
"""
from tools.aima.search import Problem, hill_climbing, simulated_annealing, \
    exp_schedule, genetic_search
from random import randrange
import math
import time


class SineVariant(Problem):
    """
    State: x value for the sine function variant f(x)
    Move: a new x value delta steps from the current x (in both directions)
    """

    def __init__(self, initial, maximum=30.0, delta=0.0001):
        self.initial = initial
        self.maximum = maximum
        self.delta = delta

    def actions(self, state):
        return [state + self.delta, state - self.delta]

    def result(self, stateIgnored, x):
        return x

    def value(self, x):
        return math.fabs(x * math.sin(x))


if __name__ == '__main__':
    # Formulate a problem with a 2D hill function and a single maximum value.
    maximum = 30
    initial = randrange(0, maximum)
    p = SineVariant(initial, maximum, delta=2.0)
    print('Initial                      x: ' + str(p.initial)
          + '\t\tvalue: ' + str(p.value(initial))
          )

    # Solve the problem using hill-climbing.
    hill_max = hill_climbing(p)
    hill_total = hill_max
    for x in range(12):
        start = randrange(0, maximum)
        p_x = SineVariant(start, maximum, delta=2.0)
        hill_solution = hill_climbing(p_x)
        if hill_solution > hill_max:
            hill_max = hill_solution
        hill_total += hill_solution

    print('Hill-climbing solution       x: ' + str(hill_max)
          + '\tvalue: ' + str(p.value(hill_max)) + '\taverage: ' + str(hill_total / 13)
          )

    # Solve the problem using simulated annealing.
    annealing_max = simulated_annealing(
        p,
        exp_schedule(k=20, lam=0.005, limit=10000)
    )
    annealing_total = annealing_max
    for x in range(12):
        start = randrange(0, maximum)
        p_x = SineVariant(start, maximum, delta = 2.0)
        annealing_solution = simulated_annealing(p_x, exp_schedule(k=20, lam=0.005, limit=10000))
        if annealing_solution > annealing_max:
            annealing_max = annealing_solution
        annealing_total += annealing_solution

    print('Simulated annealing solution x: ' + str(annealing_max)
          + '\tvalue: ' + str(p.value(annealing_max)) + '\taverage: ' + str(annealing_total / 13)
          )
