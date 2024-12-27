from uom.conversion import Conversions, Conv
from .units import *

alias TimeConversions = Conversions[
    Conv[second, second, _, 1],
    Conv[second, minute, _, 1 / 60],
    Conv[second, hour, _, 1 / ( 60 * 60 )],
    Conv[second, day, _, 1 / ( 24 * 60 * 60 )],

    Conv[minute, second, _, 60],
    Conv[minute, minute, _, 1],
    Conv[minute, hour, _, 1 / 60],
    Conv[minute, day, _, 1 / ( 24 * 60 )],

    Conv[hour, second, _, 60 * 60],
    Conv[hour, minute, _, 60],
    Conv[hour, hour, _, 1],
    Conv[hour, day, _,  1 / 24],

    Conv[day, second, _, 24 * 60 * 60],
    Conv[day, minute, _, 24 * 60],
    Conv[day, hour, _, 24],
    Conv[day, day, _, 1],
]