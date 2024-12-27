from uom.conversion import Conversions, Conv
from .units import *

# Base is second

alias TimeConversions = Conversions[
    Conv[second, 1],
    Conv[minute, 60],
    Conv[hour, 3600],
    Conv[day, 24 * 3600],
]