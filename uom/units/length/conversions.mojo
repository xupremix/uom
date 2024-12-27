from uom.conversion import Conversions, Conv
from .units import *
from uom.units.time.units import *
from uom.units.velocity.units import *

# Base is meter

alias LengthConversions = Conversions[
    Conv[millimeter, 1e-3],
    Conv[meter, 1],
    Conv[kilometer, 1e3],
]

alias ToVelocityConversions = Conversions[
    Conv[meter, _, second, meter_per_second],
    Conv[meter, _, hour, meter_per_hour],
    Conv[kilometer, _, second, kilometer_per_second],
    Conv[kilometer, _, hour, kilometer_per_hour],
]