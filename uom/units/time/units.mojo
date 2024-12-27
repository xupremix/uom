from uom.unit import Unit, Units

struct second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "second"
struct minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "minute"
struct hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hour"
struct day(Unit):
    @staticmethod
    fn to_string() -> String:
        return "day"

alias TimeUnits = Units[
    second,
    minute,
    hour,
    day,
]