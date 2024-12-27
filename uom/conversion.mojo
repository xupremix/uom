from builtin.constrained import constrained
from sys.intrinsics import _type_is_eq
from collections import Optional
from .unit import Unit

"""
Here the multiplier is going from a given Unit to the Base.
For example for the length:
- base = meter
so for a millimeter the multiplier will be 1e-3
"""
trait Conversion:
    alias Lhs: Unit
    alias multiplier: Float64
    alias Rhs: Unit
    alias Type: Unit

struct Conv[
    _lhs: Unit,
    _multiplier: Float64 = 0,
    _rhs: Unit = _lhs,
    _type: Unit = _lhs,
](Conversion):
    alias Lhs = _lhs
    alias multiplier = _multiplier
    alias Rhs = _rhs
    alias Type = _type

struct Conversions[
    *C: Conversion
]:
    alias get_conv = C
    alias length = len(VariadicList(C))

    @parameter
    @staticmethod
    fn multiplier[U: Unit]() -> Float64:
        @parameter
        fn wrapper[U: Unit]() -> Optional[Float64]:
            @parameter
            for i in range(Self.length):
                alias conv = C[i]
                @parameter
                if _type_is_eq[U, conv.Lhs]():
                    return Optional(conv.multiplier)
            return None
        alias out = wrapper[U]()
        constrained[
            out.__bool__(),
            "\nCould not find type \"" + U.to_string() + "\""
        ]()
        return out.value()


    @parameter
    @staticmethod
    fn find[Lhs: Unit, Rhs: Unit]() -> UInt:
        @parameter
        fn wrapper[Lhs: Unit, Rhs: Unit]() -> Optional[UInt]:
            @parameter
            for i in range(Self.length):
                alias conv = C[i]
                @parameter
                if _type_is_eq[Lhs, conv.Lhs]() and _type_is_eq[Rhs, conv.Rhs]():
                    return Optional(UInt(i))
            return None
        alias out = wrapper[Lhs, Rhs]()
        constrained[
            out.__bool__(),
            "\nCould not find an available conversion with " + Lhs.to_string() +
            " and " + Rhs.to_string() + "."
        ]()
        return out.value()

from .units.length.units import *
from .units.time.units import *
from .units.velocity.units import *

alias UnitConversions = Conversions[
    # Length conversions [meter]
    Conv[yottameter, 1e24],
    Conv[zettameter, 1e21],
    Conv[exameter, 1e18],
    Conv[petameter, 1e15],
    Conv[terameter, 1e12],
    Conv[gigameter, 1e9],
    Conv[megameter, 1e6],
    Conv[kilometer, 1e3],
    Conv[hectometer, 1e2],
    Conv[decameter, 1e1],
    Conv[meter, 1e0],
    Conv[decimeter, 1e-1],
    Conv[centimeter, 1e-2],
    Conv[millimeter, 1e-3],
    Conv[micrometer, 1e-6],
    Conv[nanometer, 1e-9],
    Conv[picometer, 1e-12],
    Conv[femtometer, 1e-15],
    Conv[attometer, 1e-18],
    Conv[zeptometer, 1e-21],
    Conv[yoctometer, 1e-24],
    Conv[angstrom, 1e-10],
    Conv[bohr_radius, 5.29177210903e-11],
    Conv[atomic_unit_of_length, 5.29177210903e-11],
    Conv[astronomical_unit, 1.495979e11],
    Conv[chain, 2.011684e1],
    Conv[fathom, 1.828804],
    Conv[fermi, 1e-15],
    Conv[foot, 3.048e-1],
    Conv[foot_survey, 3.048006e-1],
    Conv[inch, 2.54e-2],
    Conv[light_year, 9.46073e15],
    Conv[microinch, 2.54e-8],
    Conv[micron, 1e-6],
    Conv[mil, 2.54e-5],
    Conv[mile, 1.609344e3],
    Conv[mile_survey, 1.609347e3],
    Conv[nautical_mile, 1.852e3],
    Conv[parsec, 3.085678e16],
    Conv[pica_computer, 4.233333333333333e-3],
    Conv[pica_printers, 4.217518e-3],
    Conv[point_computer, 3.527778e-4],
    Conv[point_printers, 3.514598e-4],
    Conv[rod, 5.02921],
    Conv[yard, 9.144e-1],

    # Time conversions [second]
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

    # Velocity conversions [meter_per_second]
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

alias UnitTypeConversions = Conversions