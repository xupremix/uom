from uom.conversion import Conversions, Conv
from .units import *

# Base = meter per second

alias VelocityConversions = Conversions[
    Conv[meter_per_second, 1],
    Conv[meter_per_hour, 1 / 3600],
    Conv[kilometer_per_second, 1e3],
    Conv[kilometer_per_hour, 1 / 3.6],
]