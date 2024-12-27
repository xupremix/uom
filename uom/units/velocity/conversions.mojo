from uom.conversion import Conversions, Conv
from .units import *

# Base = meter per second

alias VelocityConversions = Conversions[
    Conv[yottameter_per_second, 1.0e24],
    Conv[zettameter_per_second, 1.0e21],
    Conv[exameter_per_second, 1.0e18],
    Conv[petameter_per_second, 1.0e15],
    Conv[terameter_per_second, 1.0e12],
    Conv[gigameter_per_second, 1.0e9],
    Conv[megameter_per_second, 1.0e6],
    Conv[kilometer_per_second, 1.0e3],
    Conv[hectometer_per_second, 1.0e2],
    Conv[decameter_per_second, 1.0e1],
    Conv[meter_per_second, 1.0],
    Conv[decimeter_per_second, 1.0e-1],
    Conv[centimeter_per_second, 1.0e-2],
    Conv[millimeter_per_second, 1.0e-3],
    Conv[micrometer_per_second, 1.0e-6],
    Conv[nanometer_per_second, 1.0e-9],
    Conv[picometer_per_second, 1.0e-12],
    Conv[femtometer_per_second, 1.0e-15],
    Conv[attometer_per_second, 1.0e-18],
    Conv[zeptometer_per_second, 1.0e-21],
    Conv[yoctometer_per_second, 1.0e-24],
    Conv[foot_per_hour, 8.466666666666667e-5],
    Conv[foot_per_minute, 5.08e-3],
    Conv[foot_per_second, 0.3048],
    Conv[inch_per_second, 0.0254],
    Conv[kilometer_per_hour, 0.2777777777777778],
    Conv[knot, 0.5144444444444445],
    Conv[mile_per_hour, 0.44704],
    Conv[mile_per_minute, 26.8224],
    Conv[mile_per_second, 1609.344],
    Conv[millimeter_per_minute, 1.666666666666667e-5],
]