from builtin.constrained import constrained
from sys.intrinsics import _type_is_eq
from collections import Optional
from .unit import Unit

trait Conversion:
    alias From: Unit
    alias To: Unit
    alias Type: AnyType
    alias Value: Float64

struct Triple[
    _from: Unit,
    _to: Unit,
    _type: AnyType = _from,
    _value: Float64 = 0,
](Conversion):
    alias From = _from
    alias To = _to
    alias Type = _type
    alias Value = _value

struct Conversions[
    *C: Conversion
]:
    alias __conversions = C
    alias length = len(VariadicList(C))

    @parameter
    @staticmethod
    fn find[From: Unit, To: Unit]() -> UInt:
        @parameter
        fn wrapper[From: Unit, To: Unit]() -> Optional[UInt]:
            @parameter
            for i in range(Self.length):
                alias conv = C[i]
                @parameter
                if _type_is_eq[From, conv.From]() and _type_is_eq[To, conv.To]():
                    return Optional[UInt](UInt(i))
            return Optional[UInt](None)
        alias out = wrapper[From, To]()
        constrained[
            out.__bool__(),
            "\nCould not find an available conversion from " + From.to_string() +
            " to " + To.to_string() + "."
        ]()
        return out.value()
