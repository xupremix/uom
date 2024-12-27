from uom.unit import Unit
from uom.conversion import Conversions, Triple

trait LengthUnit(Unit): ...

struct millimeter(LengthUnit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter"
struct meter(LengthUnit):
    @staticmethod
    fn to_string() -> String:
        return "meter"
struct kilometer(LengthUnit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer"

alias LengthConversions = Conversions[
    Triple[millimeter, millimeter, _, 1],
    Triple[millimeter, meter, _, 1e-3],
    Triple[millimeter, kilometer, _, 1e-6],

    Triple[meter, millimeter, _, 1e3],
    Triple[meter, meter, _, 1],
    Triple[meter, kilometer, _, 1e-3],

    Triple[kilometer, millimeter, _, 1e6],
    Triple[kilometer, meter, _, 1e3],
    Triple[kilometer, kilometer, _, 1],
]

@value
struct Length[
    unit: LengthUnit
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

    fn to[U: LengthUnit](self) -> Length[U]:
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[unit, U]()
        ].Value
        return self.repr * multiplier

    # ADDITION
    
    fn __add__[Rhs: LengthUnit](self, rhs: Length[Rhs]) -> Self:
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        return self.repr + rhs.repr * multiplier
    
    fn __iadd__[Rhs: LengthUnit](mut self, rhs: Length[Rhs]):
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

    fn __sub__[Rhs: LengthUnit](self, rhs: Length[Rhs]) -> Self:
        alias multiplier = LengthConversions.__conversions[
            LengthConversions.find[Rhs, unit]()
        ].Value
        return self.repr - rhs.repr * multiplier
    
    fn __isub__[Rhs: LengthUnit](mut self, rhs: Length[Rhs]):
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

    # # MULTIPLICATION
    
    # fn __mul__[Rhs: LengthUnit](self, rhs: Length[Rhs]) -> Self:
    #     alias multiplier = LengthConversions.__conversions[
    #         LengthConversions.find[Rhs, unit]()
    #     ].Value
    #     return self.repr * rhs.repr * multiplier
    
    # fn __imul__[Rhs: LengthUnit](mut self, rhs: Length[Rhs]):
    #     alias multiplier = LengthConversions.__conversions[
    #         LengthConversions.find[Rhs, unit]()
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

    # fn __truediv__[Rhs: LengthUnit](self, rhs: Length[Rhs]) -> Self:
    #     alias multiplier = LengthConversions.__conversions[
    #         LengthConversions.find[Rhs, unit]()
    #     ].Value
    #     return self.repr / rhs.repr * multiplier
    
    # fn __itruediv__[Rhs: LengthUnit](mut self, rhs: Length[Rhs]):
    #     alias multiplier = LengthConversions.__conversions[
    #         LengthConversions.find[Rhs, unit]()
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