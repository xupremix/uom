from uom.unit import Unit
from .conversions import TimeConversions
from .units import TimeUnits

@value
struct Time[
    unit: Unit
](Writable):
    var repr: Float64

    @implicit
    fn __init__(out self, repr: IntLiteral):
        constrained[
            TimeUnits.find[unit](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Time\" instance."
        ]()
        self.repr = float(repr)

    @implicit
    fn __init__[F: Floatable](out self, repr: F):
        constrained[
            TimeUnits.find[unit](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Time\" instance."
        ]()
        self.repr = float(repr)
    
    fn write_to[W: Writer](self, mut w: W):
        w.write(unit.to_string() + "[" + str(self.repr) + "]")

    fn to[U: Unit](self) -> Time[U]:
        constrained[
            TimeUnits.find[U](),
            "\nCannot use type \"" + unit.to_string() + "\" to create a \"Time\" instance."
        ]()
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[unit, U]()
        ].Value
        return self.repr * multiplier

    # ADDITION
    
    fn __add__[Rhs: Unit](self, rhs: Time[Rhs]) -> Self:
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
        ].Value
        return self.repr + rhs.repr * multiplier
    
    fn __iadd__[Rhs: Unit](mut self, rhs: Time[Rhs]):
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
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

    fn __sub__[Rhs: Unit](self, rhs: Time[Rhs]) -> Self:
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
        ].Value
        return self.repr - rhs.repr * multiplier
    
    fn __isub__[Rhs: Unit](mut self, rhs: Time[Rhs]):
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
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