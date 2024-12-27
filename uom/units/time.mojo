from uom.unit import Unit, Units
from uom.conversion import Conversions, Conv

struct second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "second"
struct minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "minute"
struct hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hour"
struct day(Unit):
    @staticmethod
    fn to_string() -> String:
        return "day"

alias TimeUnits = Units[
    second,
    minute,
    hour,
    day,
]

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