from uom.unit import Unit, Units

struct millimeter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter"
struct meter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter"
struct kilometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer"

alias LengthUnits = Units[
    millimeter,
    meter,
    kilometer,
]