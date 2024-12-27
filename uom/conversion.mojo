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
