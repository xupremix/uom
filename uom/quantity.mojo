from utils._visualizers import lldb_formatter_wrapping_type
from builtin.constrained import constrained
from .dimension import Dim, ISQ, check_unit_for_dim
from .conversion import UnitConversions
from .mul_conversions import UnitMulTypeConversions
from .div_conversions import UnitDivTypeConversions
from .unit import Unit

@lldb_formatter_wrapping_type
@value
@register_passable("trivial")
struct Quantity[
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
            "\nCannot build a \"Quantity\" from a \"" + unit.to_string() + "\""
        ]()
        self.repr = int(repr)

    @implicit
    fn __init__[I: Intable](out self, repr: I):
        constrained[
            check_unit_for_dim[unit, dim](),
            "\nCannot build a \"Quantity\" from a \"" + unit.to_string() + "\""
        ]()
        self.repr = int(repr)
    
    @implicit
    fn __init__[U: Unit](out self, repr: Quantity[dim, U]):
        constrained[
            check_unit_for_dim[unit, dim](),
            "\nCannot build a \"Quantity\" from a \"" + unit.to_string() + "\""
        ]()
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr = repr.repr * mul
    
    fn to[U: Unit](self) -> Quantity[dim, U]:
        constrained[
            check_unit_for_dim[U, dim](),
            "\nCannot build a \"Quantity\" from a \"" + U.to_string() + "\""
        ]()
        alias mul = UnitConversions.multiplier[unit]() / 
                    UnitConversions.multiplier[U]()
        return self.repr * mul
    
    fn write_to[W: Writer](self, mut w: W):
        w.write("[" + unit.to_string() + "](" + str(self.repr) + ")")
    
    fn __add__[U: Unit](self, rhs: Quantity[dim, U]) -> Self:
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        return self.repr + rhs.repr * mul

    fn __sub__[U: Unit](self, rhs: Quantity[dim, U]) -> Self:
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        return self.repr - rhs.repr * mul

    fn __iadd__[U: Unit](mut self, rhs: Quantity[dim, U]):
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr += rhs.repr * mul

    fn __isub__[U: Unit](mut self, rhs: Quantity[dim, U]):
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        self.repr -= rhs.repr * mul
    
    fn __mul__[
        rhs_dim: Dim,
        rhs_unit: Unit,
    ](self, rhs: Quantity[rhs_dim, rhs_unit]) 
        -> Quantity[
            ISQ[
                dim.L + rhs_dim.L,
                dim.M + rhs_dim.M,
                dim.T + rhs_dim.T,
                dim.E + rhs_dim.E,
                dim.H + rhs_dim.H,
                dim.N + rhs_dim.N,
                dim.J + rhs_dim.J,
            ],
            UnitMulTypeConversions.get_conv[
                UnitMulTypeConversions.find[unit, rhs_unit]()
            ].Type,
        ]:
        @parameter
        if dim.same_dim[rhs_dim]():
            return self.repr * rhs.to[unit]().repr
        else:
            return self.repr * rhs.repr

    fn __truediv__[
        rhs_dim: Dim,
        rhs_unit: Unit,
    ](self, rhs: Quantity[rhs_dim, rhs_unit]) 
        -> Quantity[
            ISQ[
                dim.L - rhs_dim.L,
                dim.M - rhs_dim.M,
                dim.T - rhs_dim.T,
                dim.E - rhs_dim.E,
                dim.H - rhs_dim.H,
                dim.N - rhs_dim.N,
                dim.J - rhs_dim.J,
            ],
            UnitDivTypeConversions.get_conv[
                UnitDivTypeConversions.find[unit, rhs_unit]()
            ].Type,
        ]:
        @parameter
        if dim.same_dim[rhs_dim]():
            return self.repr / rhs.to[unit]().repr
        else:
            return self.repr / rhs.repr


alias Dimensionless = Quantity[ISQ[0, 0, 0, 0, 0, 0, 0]]
alias Length = Quantity[ISQ[1, 0, 0, 0, 0, 0, 0]]
alias Time = Quantity[ISQ[0, 0, 1, 0, 0, 0, 0]]
alias Velocity = Quantity[ISQ[1, 0, -1, 0, 0, 0, 0]]