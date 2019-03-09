'''
This module practices using NumPy with the
   Keras version of the Boston Housing Price dataset

@author ksn7
@version Mar 8, 2019
'''

import numpy
from keras.datasets import boston_housing

(train_ex, train_labels), (test_ex, test_labels) = boston_housing.load_data()

print(f'training examples \n\tcount: {len(train_ex)}'
      f'\n\trank: {train_ex.ndim}'
      f'\n\tshape: {train_ex.shape}'
      f'\n\tdata type: {train_ex.dtype}')
print(f'\ntesting examples count: {len(test_labels)}'
      f'\n\trank: {test_labels.ndim}'
      f'\n\tshape: {test_labels.shape}'
      f'\n\tdata type: {test_labels.dtype}')
