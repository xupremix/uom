from uom.unit import Unit, Units

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