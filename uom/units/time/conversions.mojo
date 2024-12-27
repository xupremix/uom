from uom.conversion import Conversions, Conv
from .units import *

# Base is second

alias TimeConversions = Conversions[
    Conv[yottasecond, 1e24],
    Conv[zettasecond, 1e21],
    Conv[exasecond, 1e18],
    Conv[petasecond, 1e15],
    Conv[terasecond, 1e12],
    Conv[gigasecond, 1e9],
    Conv[megasecond, 1e6],
    Conv[kilosecond, 1e3],
    Conv[hectosecond, 1e2],
    Conv[decasecond, 1e1],
    Conv[second, 1e0],
    Conv[decisecond, 1e-1],
    Conv[centisecond, 1e-2],
    Conv[millisecond, 1e-3],
    Conv[microsecond, 1e-6],
    Conv[nanosecond, 1e-9],
    Conv[picosecond, 1e-12],
    Conv[femtosecond, 1e-15],
    Conv[attosecond, 1e-18],
    Conv[zeptosecond, 1e-21],
    Conv[yoctosecond, 1e-24],
    Conv[second_sidereal, 9.972696e-1],
    Conv[day, 8.64e4],
    Conv[day_sidereal, 8.616409e4],
    Conv[hour, 3.6e3],
    Conv[hour_sidereal, 3.59017e3],
    Conv[minute, 6.0e1],
    Conv[shake, 1.0e-8],
    Conv[year, 3.1536e7],
    Conv[year_sidereal, 3.155815e7],
    Conv[year_tropical, 3.155693e7],
]