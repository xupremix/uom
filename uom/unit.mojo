from sys.intrinsics import _type_is_eq

trait Unit:
    @staticmethod
    fn to_string() -> String: ...

struct Units[
    *U: Unit
]:
    alias __conversions = U
    alias length = len(VariadicList(U))

    @parameter
    @staticmethod
    fn find[T: Unit]() -> Bool:
        @parameter
        for i in range(Self.length):
            @parameter
            if _type_is_eq[T, U[i]]():
                return True
        return False