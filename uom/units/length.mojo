from uom.unit import Unit, Units

# meter based

struct yottameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yottameter"
struct zettameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zettameter"
struct exameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "exameter"
struct petameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "petameter"
struct terameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "terameter"
struct gigameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "gigameter"
struct megameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "megameter"
struct kilometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "kilometer"
struct hectometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "hectometer"
struct decameter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decameter"

struct meter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "meter"

struct decimeter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decimeter"
struct centimeter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "decimeter"
struct millimeter(Unit):
    @staticmethod
    fn to_string() -> String:
        return "millimeter"
struct micrometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "micrometer"
struct nanometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "nanometer"
struct picometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "picometer"
struct femtometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "femtometer"
struct attometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "attometer"
struct zeptometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "zeptometer"
struct yoctometer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yoctometer"

# non meter based
struct angstrom(Unit):
    @staticmethod
    fn to_string() -> String:
        return "angstrom"
struct bohr_radius(Unit):
    @staticmethod
    fn to_string() -> String:
        return "bohr_radius"
struct atomic_unit_of_length(Unit):
    @staticmethod
    fn to_string() -> String:
        return "atomic_unit_of_length"
struct astronomical_unit(Unit):
    @staticmethod
    fn to_string() -> String:
        return "astronomical_unit"
struct chain(Unit):
    @staticmethod
    fn to_string() -> String:
        return "chain"
struct fathom(Unit):
    @staticmethod
    fn to_string() -> String:
        return "fathom"
struct fermi(Unit):
    @staticmethod
    fn to_string() -> String:
        return "fermi"
struct foot(Unit):
    @staticmethod
    fn to_string() -> String:
        return "foot"
struct foot_survey(Unit):
    @staticmethod
    fn to_string() -> String:
        return "foot_survey"
struct inch(Unit):
    @staticmethod
    fn to_string() -> String:
        return "inch"
struct light_year(Unit):
    @staticmethod
    fn to_string() -> String:
        return "light_year"
struct microinch(Unit):
    @staticmethod
    fn to_string() -> String:
        return "microinch"
struct micron(Unit):
    @staticmethod
    fn to_string() -> String:
        return "micron"
struct mil(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mil"
struct mile(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mile"
struct mile_survey(Unit):
    @staticmethod
    fn to_string() -> String:
        return "mile_survey"
struct nautical_mile(Unit):
    @staticmethod
    fn to_string() -> String:
        return "nautical_mile"
struct parsec(Unit):
    @staticmethod
    fn to_string() -> String:
        return "parsec"
struct pica_computer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "pica_computer"
struct pica_printers(Unit):
    @staticmethod
    fn to_string() -> String:
        return "pica_printers"
struct point_computer(Unit):
    @staticmethod
    fn to_string() -> String:
        return "point_computer"
struct point_printers(Unit):
    @staticmethod
    fn to_string() -> String:
        return "point_printers"
struct rod(Unit):
    @staticmethod
    fn to_string() -> String:
        return "rod"
struct yard(Unit):
    @staticmethod
    fn to_string() -> String:
        return "yard"

alias LengthUnits = Units[
    yottameter,
    zettameter,
    exameter,
    petameter,
    terameter,
    gigameter,
    megameter,
    kilometer,
    hectometer,
    decameter,
    meter,
    decimeter,
    centimeter,
    millimeter,
    micrometer,
    nanometer,
    picometer,
    femtometer,
    attometer,
    zeptometer,
    yoctometer,
    angstrom,
    bohr_radius,
    atomic_unit_of_length,
    astronomical_unit,
    chain,
    fathom,
    fermi,
    foot,
    foot_survey,
    inch,
    light_year,
    microinch,
    micron,
    mil,
    mile,
    mile_survey,
    nautical_mile,
    parsec,
    pica_computer,
    pica_printers,
    point_computer,
    point_printers,
    rod,
    yard,
]