from uom.unit import Unit, Units

struct yottasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yottasecond"

struct zettasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zettasecond"

struct exasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "exasecond"

struct petasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "petasecond"

struct terasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "terasecond"

struct gigasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "gigasecond"

struct megasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "megasecond"

struct kilosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilosecond"

struct hectosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hectosecond"

struct decasecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decasecond"

struct second(Unit):
    @staticmethod
    fn to_string() -> String:
        return "second"

struct decisecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decisecond"

struct centisecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "centisecond"

struct millisecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millisecond"

struct microsecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "microsecond"

struct nanosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "nanosecond"

struct picosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "picosecond"

struct femtosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "femtosecond"

struct attosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "attosecond"

struct zeptosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zeptosecond"

struct yoctosecond(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yoctosecond"

struct second_sidereal(Unit):
    @staticmethod
    fn to_string() -> String:
        return "second_sidereal"

struct day(Unit):
    @staticmethod
    fn to_string() -> String:
        return "day"

struct day_sidereal(Unit):
    @staticmethod
    fn to_string() -> String:
        return "day_sidereal"

struct hour(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hour"

struct hour_sidereal(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hour_sidereal"

struct minute(Unit):
    @staticmethod
    fn to_string() -> String:
        return "minute"

struct shake(Unit):
    @staticmethod
    fn to_string() -> String:
        return "shake"

struct year(Unit):
    @staticmethod
    fn to_string() -> String:
        return "year"

struct year_sidereal(Unit):
    @staticmethod
    fn to_string() -> String:
        return "year_sidereal"

struct year_tropical(Unit):
    @staticmethod
    fn to_string() -> String:
        return "year_tropical"

alias TimeUnits = Units[
    yottasecond,
    zettasecond,
    exasecond,
    petasecond,
    terasecond,
    gigasecond,
    megasecond,
    kilosecond,
    hectosecond,
    decasecond,
    second,
    decisecond,
    centisecond,
    millisecond,
    microsecond,
    nanosecond,
    picosecond,
    femtosecond,
    attosecond,
    zeptosecond,
    yoctosecond,
    second_sidereal,
    day,
    day_sidereal,
    hour,
    hour_sidereal,
    minute,
    shake,
    year,
    year_sidereal,
    year_tropical,
]