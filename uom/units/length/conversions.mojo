from uom.conversion import Conversions, Conv
from .units import *
from uom.units.time.units import *
from uom.units.velocity.units import *

# Base is meter

alias LengthConversions = Conversions

alias ToVelocityConversions = Conversions[
    Conv[yottameter, _, second, yottameter_per_second],
    Conv[zettameter, _, second, zettameter_per_second],
    Conv[exameter, _, second, exameter_per_second],
    Conv[petameter, _, second, petameter_per_second],
    Conv[terameter, _, second, terameter_per_second],
    Conv[gigameter, _, second, gigameter_per_second],
    Conv[megameter, _, second, megameter_per_second],
    Conv[kilometer, _, second, kilometer_per_second],
    Conv[hectometer, _, second, hectometer_per_second],
    Conv[decameter, _, second, decameter_per_second],
    Conv[meter, _, second, meter_per_second],
    Conv[decimeter, _, second, decimeter_per_second],
    Conv[centimeter, _, second, centimeter_per_second],
    Conv[millimeter, _, second, millimeter_per_second],
    Conv[micrometer, _, second, micrometer_per_second],
    Conv[nanometer, _, second, nanometer_per_second],
    Conv[picometer, _, second, picometer_per_second],
    Conv[femtometer, _, second, femtometer_per_second],
    Conv[attometer, _, second, attometer_per_second],
    Conv[zeptometer, _, second, zeptometer_per_second],
    Conv[yoctometer, _, second, yoctometer_per_second],
    Conv[foot, _, hour, foot_per_hour],
    Conv[foot, _, minute, foot_per_minute],
    Conv[foot, _, second, foot_per_second],
    Conv[inch, _, second, inch_per_second],
    Conv[kilometer, _, hour, kilometer_per_hour],
    Conv[knot, _, second, knot],
    Conv[mile, _, hour, mile_per_hour],
    Conv[mile, _, minute, mile_per_minute],
    Conv[mile, _, second, mile_per_second],
    Conv[millimeter, _, minute, millimeter_per_minute],
]