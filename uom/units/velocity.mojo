from uom.unit import Unit, Units
from uom.conversion import Conversions, Triple

struct meter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter_per_second"
struct meter_per_hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter_per_second"
struct kilometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer_per_second"
struct kilometer_per_hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer_per_hour"

alias VelocityUnits = Units[
    meter_per_second,
    meter_per_hour,
    kilometer_per_second,
    kilometer_per_hour,
]

alias VelocityConversions = Conversions[
    Triple[meter_per_second, meter_per_second, _, 1],
    Triple[meter_per_second, meter_per_hour, _, 3600],
    Triple[meter_per_second, kilometer_per_second, _, 1e-3],
    Triple[meter_per_second, kilometer_per_hour, _, 3.6],

    Triple[meter_per_hour, meter_per_second, _, 1 / 3600],
    Triple[meter_per_hour, meter_per_hour, _, 1],
    Triple[meter_per_hour, kilometer_per_second, _, 1 / 36e5],
    Triple[meter_per_hour, kilometer_per_hour, _, 1e-3],

    Triple[kilometer_per_second, meter_per_second, _, 1e3],
    Triple[kilometer_per_second, meter_per_hour, _, 36e5],
    Triple[kilometer_per_second, kilometer_per_second, _, 1],
    Triple[kilometer_per_second, kilometer_per_hour, _, 3600],

    Triple[kilometer_per_hour, meter_per_second, _, 1 / 3.6],
    Triple[kilometer_per_hour, meter_per_hour, _, 1e3],
    Triple[kilometer_per_hour, kilometer_per_second, _, 1 / 3600],
    Triple[kilometer_per_hour, kilometer_per_hour, _, 1],
]

@value
struct Velocity[
    unit: Unit
](Writable):
    var repr: Float64

    @implicit
    fn __init__(out self, repr: IntLiteral):
        constrained[
            VelocityUnits.find[unit](),
            "\nCannot use type " + unit.to_string() + " to create a \"Velocity\""
        ]()
        self.repr = float(repr)

    @implicit
    fn __init__[F: Floatable](out self, repr: F):
        constrained[
            VelocityUnits.find[unit](),
            "\nCannot use type " + unit.to_string() + " to create a \"Velocity\""
        ]()
        self.repr = float(repr)
    
    fn write_to[W: Writer](self, mut w: W):
        w.write(unit.to_string() + "[" + str(self.repr) + "]")

    fn to[U: Unit](self) -> Velocity[U]:
        constrained[
            VelocityUnits.find[U](),
            "\nCannot use type " + U.to_string() + " to create a \"Velocity\""
        ]()
        alias multiplier = VelocityConversions.__conversions[
            VelocityConversions.find[unit, U]()
        ].Value
        return self.repr * multiplier

    # ADDITION
    
    fn __add__[Rhs: Unit](self, rhs: Velocity[Rhs]) -> Self:
        constrained[
            VelocityUnits.find[Rhs](),
            "\nCannot use type " + Rhs.to_string() + " to create a \"Velocity\""
        ]()
        alias multiplier = VelocityConversions.__conversions[
            VelocityConversions.find[Rhs, unit]()
        ].Value
        return self.repr + rhs.repr * multiplier
    
    fn __iadd__[Rhs: Unit](mut self, rhs: Velocity[Rhs]):
        constrained[
            VelocityUnits.find[Rhs](),
            "\nCannot use type " + Rhs.to_string() + " to create a \"Velocity\""
        ]()
        alias multiplier = VelocityConversions.__conversions[
            VelocityConversions.find[Rhs, unit]()
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

    fn __sub__[Rhs: Unit](self, rhs: Velocity[Rhs]) -> Self:
        constrained[
            VelocityUnits.find[Rhs](),
            "\nCannot use type " + Rhs.to_string() + " to create a \"Velocity\""
        ]()
        alias multiplier = VelocityConversions.__conversions[
            VelocityConversions.find[Rhs, unit]()
        ].Value
        return self.repr - rhs.repr * multiplier
    
    fn __isub__[Rhs: Unit](mut self, rhs: Velocity[Rhs]):
        constrained[
            VelocityUnits.find[Rhs](),
            "\nCannot use type " + Rhs.to_string() + " to create a \"Velocity\""
        ]()
        alias multiplier = VelocityConversions.__conversions[
            VelocityConversions.find[Rhs, unit]()
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