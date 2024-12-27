from uom.conversion import Conversions, Conv
from .units import *

alias VelocityConversions = Conversions[
    Conv[meter_per_second, meter_per_second, _, 1],
    Conv[meter_per_second, meter_per_hour, _, 3600],
    Conv[meter_per_second, kilometer_per_second, _, 1e-3],
    Conv[meter_per_second, kilometer_per_hour, _, 3.6],

    Conv[meter_per_hour, meter_per_second, _, 1 / 3600],
    Conv[meter_per_hour, meter_per_hour, _, 1],
    Conv[meter_per_hour, kilometer_per_second, _, 1 / 36e5],
    Conv[meter_per_hour, kilometer_per_hour, _, 1e-3],

    Conv[kilometer_per_second, meter_per_second, _, 1e3],
    Conv[kilometer_per_second, meter_per_hour, _, 36e5],
    Conv[kilometer_per_second, kilometer_per_second, _, 1],
    Conv[kilometer_per_second, kilometer_per_hour, _, 3600],

    Conv[kilometer_per_hour, meter_per_second, _, 1 / 3.6],
    Conv[kilometer_per_hour, meter_per_hour, _, 1e3],
    Conv[kilometer_per_hour, kilometer_per_second, _, 1 / 3600],
    Conv[kilometer_per_hour, kilometer_per_hour, _, 1],
]