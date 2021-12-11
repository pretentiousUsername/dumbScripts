import numpy as np
import sys
import string

# Cosmological constant
Λ = 1.1056e-52 # meters^(-2)

# Planck length
Lp = 1.616255e-35 # meters

# Planck time
Tp = 5.391248e-44 # seconds

# Assumed "just after creation" speed of light
c0 = 1 / (Λ * Lp * Tp) # m/s

# Speed of light (the *actual* one)
c = 2.99792458e8 # m/s

t0 = 6.0000e3 # years
# Decay rate for the speed of light

t = float(sys.argv[1])

u = -1/t0
A = c/c0
B = np.log(A)
λ = u * B

c1 = c0 * np.exp(-λ * t)
D = "{:.8e}".format(c1 / c)
C1 = "{:.4e}".format(np.around(c1, decimals=4))
C = "{:.4e}".format(np.around(c, decimals=4))

print("The initial speed of light c0 = ", np.around(c0, decimals=4), "\n")
print("The *real* speed of light is c = ", C, "\n")
print("The speed of light is", C1, "m/s. c'/c =", D)
# Since Λ has four significant digits, the calculation needs to be rounded.
