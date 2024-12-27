from uom.unit import Unit, Units
from uom.conversion import Conversions, Conv
from .time import *
from .velocity import *

struct millimeter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter"
struct meter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter"
struct kilometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer"

alias LengthUnits = Units[
    millimeter,
    meter,
    kilometer,
]

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

@value
struct Length[
    unit: Unit
](Writable):
    var repr: Float64

    @implicit
    fn __init__(out self, repr: IntLiteral):
        constrained[
            LengthUnits.find[unit](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Length\" instance."
        ]()
        self.repr = float(repr)

    @implicit
    fn __init__[F: Floatable](out self, repr: F):
        constrained[
            LengthUnits.find[unit](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Length\" instance."
        ]()
        self.repr = float(repr)
    
    fn write_to[W: Writer](self, mut w: W):
        w.write(unit.to_string() + "[" + str(self.repr) + "]")

    fn to[U: Unit](self) -> Length[U]:
        constrained[
            LengthUnits.find[U](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Length\" instance."
        ]()
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[unit, U]()
        ].Value
        return self.repr * multiplier

    # ADDITION
    
    fn __add__[Rhs: Unit](self, rhs: Length[Rhs]) -> Self:
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        return self.repr + rhs.repr * multiplier
    
    fn __iadd__[Rhs: Unit](mut self, rhs: Length[Rhs]):
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        self.repr += rhs.repr * multiplier

    fn __add__[F: Floatable](self, rhs: F) -> Self:
        return self.repr + float(rhs)
    
    fn __iadd__[F: Floatable](mut self, rhs: F):
        self.repr += float(rhs)

    fn __add__(self, rhs: IntLiteral) -> Self:
        return self.repr + float(rhs)
    
    fn __iadd__(mut self, rhs: IntLiteral):
        self.repr += float(rhs)

    # SUBTRACTION

    fn __sub__[Rhs: Unit](self, rhs: Length[Rhs]) -> Self:
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        return self.repr - rhs.repr * multiplier
    
    fn __isub__[Rhs: Unit](mut self, rhs: Length[Rhs]):
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        self.repr -= rhs.repr * multiplier

    fn __sub__[F: Floatable](self, rhs: F) -> Self:
        return self.repr + float(rhs)
    
    fn __isub__[F: Floatable](mut self, rhs: F):
        self.repr -= float(rhs)

    fn __sub__(self, rhs: IntLiteral) -> Self:
        return self.repr - float(rhs)
    
    fn __isub__(mut self, rhs: IntLiteral):
        self.repr -= float(rhs)
    
    # TODO change error message from Conversions to take in an arbitrary string literal?
    # or just make it less specific
    fn __truediv__[Rhs: Unit](self, rhs: Time[Rhs])
        -> Velocity[
            ToVelocityConversions.__conversions[
                ToVelocityConversions.find[unit, Rhs]()
            ].Type
        ]:
        return self.repr / rhs.repr
