from uom.conversion import Conversions, Conv
from .units import *
from uom.units.time.units import *
from uom.units.velocity.units import *

alias LengthConversions = Conversions[
    Conv[millimeter, millimeter, _, 1],
    Conv[millimeter, meter, _, 1e-3],
    Conv[millimeter, kilometer, _, 1e-6],

    Conv[meter, millimeter, _, 1e3],
    Conv[meter, meter, _, 1],
    Conv[meter, kilometer, _, 1e-3],

    Conv[kilometer, millimeter, _, 1e6],
    Conv[kilometer, meter, _, 1e3],
    Conv[kilometer, kilometer, _, 1],
]

alias ToVelocityConversions = Conversions[
    Conv[meter, second, meter_per_second],
    Conv[meter, hour, meter_per_hour],
    Conv[kilometer, second, kilometer_per_second],
    Conv[kilometer, hour, kilometer_per_hour],
]