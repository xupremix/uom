from uom.unit import Unit, Units

struct yottameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yottameter_per_second"

struct zettameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zettameter_per_second"

struct exameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "exameter_per_second"

struct petameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "petameter_per_second"

struct terameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "terameter_per_second"

struct gigameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "gigameter_per_second"

struct megameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "megameter_per_second"

struct kilometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer_per_second"

struct hectometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hectometer_per_second"

struct decameter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decameter_per_second"

struct meter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter_per_second"

struct decimeter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decimeter_per_second"

struct centimeter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "centimeter_per_second"

struct millimeter_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter_per_second"

struct micrometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "micrometer_per_second"

struct nanometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "nanometer_per_second"

struct picometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "picometer_per_second"

struct femtometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "femtometer_per_second"

struct attometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "attometer_per_second"

struct zeptometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zeptometer_per_second"

struct yoctometer_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yoctometer_per_second"

struct foot_per_hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "foot_per_hour"

struct foot_per_minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "foot_per_minute"

struct foot_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "foot_per_second"

struct inch_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "inch_per_second"

struct kilometer_per_hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer_per_hour"

struct knot(Unit):
    @staticmethod
    fn to_string() -> String:
        return "knot"

struct mile_per_hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mile_per_hour"

struct mile_per_minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mile_per_minute"

struct mile_per_second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mile_per_second"

struct millimeter_per_minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter_per_minute"

alias VelocityUnits = Units[
    yottameter_per_second,
    zettameter_per_second,
    exameter_per_second,
    petameter_per_second,
    terameter_per_second,
    gigameter_per_second,
    megameter_per_second,
    kilometer_per_second,
    hectometer_per_second,
    decameter_per_second,
    meter_per_second,
    decimeter_per_second,
    centimeter_per_second,
    millimeter_per_second,
    micrometer_per_second,
    nanometer_per_second,
    picometer_per_second,
    femtometer_per_second,
    attometer_per_second,
    zeptometer_per_second,
    yoctometer_per_second,
    foot_per_hour,
    foot_per_minute,
    foot_per_second,
    inch_per_second,
    kilometer_per_hour,
    knot,
    mile_per_hour,
    mile_per_minute,
    mile_per_second,
    millimeter_per_minute
]