from utils._visualizers import lldb_formatter_wrapping_type
from builtin.constrained import constrained
from .dimension import Dim, ISQ, check_unit_for_dim
from .conversion import UnitConversions, UnitTypeConversions
from .unit import Unit

@lldb_formatter_wrapping_type
@value
@register_passable("trivial")
struct Quantity[
    name: StringLiteral,
    dim: Dim,
    unit: Unit,
](Writable, CollectionElement):
    alias Dimension = dim
    alias Unit = unit

    var repr: Float64

    @implicit
    fn __init__(out self, repr: Float64):
        constrained[
            check_unit_for_dim[unit, dim](),
            "\nCannot build a \"" + name + "\" from a \"" + unit.to_string() + "\""
        ]()
        self.repr = int(repr)

    @implicit
    fn __init__[I: Intable](out self, repr: I):
        constrained[
            check_unit_for_dim[unit, dim](),
            "\nCannot build a \"" + name + "\" from a \"" + unit.to_string() + "\""
        ]()
        self.repr = int(repr)
    
    @implicit
    fn __init__[U: Unit](out self, repr: Quantity[name, dim, U]):
        constrained[
            check_unit_for_dim[unit, dim](),
            "\nCannot build a \"" + name + "\" from a \"" + unit.to_string() + "\""
        ]()
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr = repr.repr * mul
    
    fn write_to[W: Writer](self, mut w: W):
        w.write(name + "[" + unit.to_string() + "](" + str(self.repr) + ")")
    
    fn __add__[U: Unit](self, rhs: Quantity[name, dim, U]) -> Self:
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        return self.repr + rhs.repr * mul

    fn __sub__[U: Unit](self, rhs: Quantity[name, dim, U]) -> Self:
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        return self.repr - rhs.repr * mul

    fn __iadd__[U: Unit](mut self, rhs: Quantity[name, dim, U]):
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr += rhs.repr * mul

    fn __isub__[U: Unit](mut self, rhs: Quantity[name, dim, U]):
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr -= rhs.repr * mul


alias QLength = Quantity["Length", ISQ[1, 0, 0, 0, 0, 0, 0]]
alias QTime = Quantity["Time", ISQ[0, 0, 1, 0, 0, 0, 0]]
alias QVelocity = Quantity["Velocity", ISQ[1, 0, -1, 0, 0, 0, 0]]