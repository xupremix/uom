from uom.unit import Unit
from uom.conversion import Conversions, Triple

trait TimeUnit(Unit): ...

struct second(TimeUnit):
    @staticmethod
    fn to_string() -> String:
        return "second"
struct minute(TimeUnit):
    @staticmethod
    fn to_string() -> String:
        return "minute"
struct hour(TimeUnit):
    @staticmethod
    fn to_string() -> String:
        return "hour"
struct day(TimeUnit):
    @staticmethod
    fn to_string() -> String:
        return "day"

alias TimeConversions = Conversions[
    Triple[second, second, _, 1],
    Triple[second, minute, _, 1 / 60],
    Triple[second, hour, _, 1 / ( 60 * 60 )],
    Triple[second, day, _, 1 / ( 24 * 60 * 60 )],

    Triple[minute, second, _, 60],
    Triple[minute, minute, _, 1],
    Triple[minute, hour, _, 1 / 60],
    Triple[minute, day, _, 1 / ( 24 * 60 )],

    Triple[hour, second, _, 60 * 60],
    Triple[hour, minute, _, 60],
    Triple[hour, hour, _, 1],
    Triple[hour, day, _,  1 / 24],

    Triple[day, second, _, 24 * 60 * 60],
    Triple[day, minute, _, 24 * 60],
    Triple[day, hour, _, 24],
    Triple[day, day, _, 1],
]

@value
struct Time[
    unit: TimeUnit
](Writable):
    var repr: Float64

    @implicit
    fn __init__(out self, repr: IntLiteral):
        self.repr = float(repr)

    @implicit
    fn __init__[F: Floatable](out self, repr: F):
        self.repr = float(repr)
    
    fn write_to[W: Writer](self, mut w: W):
        w.write(unit.to_string() + "[" + str(self.repr) + "]")

    fn to[U: TimeUnit](self) -> Time[U]:
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[unit, U]()
        ].Value
        return self.repr * multiplier

    # ADDITION
    
    fn __add__[Rhs: TimeUnit](self, rhs: Time[Rhs]) -> Self:
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
        ].Value
        return self.repr + rhs.repr * multiplier
    
    fn __iadd__[Rhs: TimeUnit](mut self, rhs: Time[Rhs]):
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

    fn __sub__[Rhs: TimeUnit](self, rhs: Time[Rhs]) -> Self:
        alias multiplier = TimeConversions.__conversions[
            TimeConversions.find[Rhs, unit]()
        ].Value
        return self.repr - rhs.repr * multiplier
    
    fn __isub__[Rhs: TimeUnit](mut self, rhs: Time[Rhs]):
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

    # # MULTIPLICATION
    
    # fn __mul__[Rhs: TimeUnit](self, rhs: Time[Rhs]) -> Self:
    #     alias multiplier = TimeConversions.__conversions[
    #         TimeConversions.find[Rhs, unit]()
    #     ].Value
    #     return self.repr * rhs.repr * multiplier
    
    # fn __imul__[Rhs: TimeUnit](mut self, rhs: Time[Rhs]):
    #     alias multiplier = TimeConversions.__conversions[
    #         TimeConversions.find[Rhs, unit]()
    #     ].Value
    #     self.repr *= rhs.repr * multiplier

    # fn __mul__[F: Floatable](self, rhs: F) -> Self:
    #     return self.repr * float(rhs)
    
    # fn __imul__[F: Floatable](mut self, rhs: F):
    #     self.repr *= float(rhs)

    # fn __mul__(self, rhs: IntLiteral) -> Self:
    #     return self.repr * float(rhs)
    
    # fn __imul__(mut self, rhs: IntLiteral):
    #     self.repr *= float(rhs)
    
    # # DIVISION
    # # TODO: check for division by zero

    # fn __truediv__[Rhs: TimeUnit](self, rhs: Time[Rhs]) -> Self:
    #     alias multiplier = TimeConversions.__conversions[
    #         TimeConversions.find[Rhs, unit]()
    #     ].Value
    #     return self.repr / rhs.repr * multiplier
    
    # fn __itruediv__[Rhs: TimeUnit](mut self, rhs: Time[Rhs]):
    #     alias multiplier = TimeConversions.__conversions[
    #         TimeConversions.find[Rhs, unit]()
    #     ].Value
    #     self.repr /= rhs.repr * multiplier

    # fn __truediv__[F: Floatable](self, rhs: F) -> Self:
    #     return self.repr / float(rhs)
    
    # fn __itruediv__[F: Floatable](mut self, rhs: F):
    #     self.repr /= float(rhs)

    # fn __truediv__(self, rhs: IntLiteral) -> Self:
    #     return self.repr / float(rhs)
    
    # fn __itruediv__(mut self, rhs: IntLiteral):
    #     self.repr /= float(rhs)