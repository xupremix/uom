from utils._visualizers import lldb_formatter_wrapping_type
from builtin.constrained import constrained
from .dimension import Dim, ISQ, check_unit_for_dim
from .conversion import UnitConversions, UnitMulTypeConversions
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
    
    fn write_to[W: Writer](self, mut w: W):
        exponent = String("")
        @parameter
        if dim.L < 0 or dim.L > 1:
            exponent += "^" + str(dim.L)
        elif dim.M < 0 or dim.M > 1:
            exponent += "^" + str(dim.M)
        elif dim.T < 0 or dim.T > 1:
            exponent += "^" + str(dim.T)
        elif dim.E < 0 or dim.E > 1:
            exponent += "^" + str(dim.E)
        elif dim.H < 0 or dim.H > 1:
            exponent += "^" + str(dim.H)
        elif dim.N < 0 or dim.N > 1:
            exponent += "^" + str(dim.N)
        elif dim.J < 0 or dim.J > 1:
            exponent += "^" + str(dim.J)
        w.write("[" + unit.to_string() + exponent + "](" + str(self.repr) + ")")
    
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
        U: Unit,
    ](self, rhs: Quantity[dim, unit]) 
        -> Quantity[
            ISQ[
                dim.L * 2,
                dim.M * 2,
                dim.T * 2,
                dim.E * 2,
                dim.H * 2,
                dim.N * 2,
                dim.J * 2,
            ],
            UnitMulTypeConversions.get_conv[
                UnitMulTypeConversions.find[unit, U]()
            ].Type,
        ]:
        alias mul = UnitConversions.multiplier[U]() /
                    UnitConversions.multiplier[unit]()
        print("Entered Specific one")
        return self.repr * rhs.repr * mul
    
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
        alias mul = UnitConversions.multiplier[rhs_unit]() /
                    UnitConversions.multiplier[unit]()
        print("Entered Specific one")
        return self.repr * rhs.repr * mul


alias QLength = Quantity[ISQ[1, 0, 0, 0, 0, 0, 0]]
alias QTime = Quantity[ISQ[0, 0, 1, 0, 0, 0, 0]]
alias QVelocity = Quantity[ISQ[1, 0, -1, 0, 0, 0, 0]]