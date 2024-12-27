trait Dim:
    alias L: Int
    alias M: Int
    alias T: Int
    alias E: Int
    alias Th: Int
    alias N: Int
    alias J: Int

struct ISQ[
    l: Int,
    m: Int,
    t: Int,
    e: Int,
    th: Int,
    n: Int,
    j: Int,
](Dim):
    alias L = l
    alias M = m
    alias T = t
    alias E = e
    alias Th = th
    alias N = n
    alias J = j

from .unit import Unit
from .units.length.units import LengthUnits
from .units.time.units import TimeUnits
from .units.velocity.units import VelocityUnits

@parameter
fn check_unit_for_dim[U: Unit, D: Dim]() -> Bool:
    return (
        LengthUnits.find[U]() and
        D.L == 1 and
        D.M == 0 and
        D.T == 0 and 
        D.E == 0 and
        D.Th == 0 and
        D.N == 0 and 
        D.J == 0
    ) or (
        TimeUnits.find[U]() and
        D.L == 0 and
        D.M == 0 and
        D.T == 1 and 
        D.E == 0 and
        D.Th == 0 and
        D.N == 0 and 
        D.J == 0
    ) or (
        VelocityUnits.find[U]() and
        D.L == 1 and
        D.M == 0 and
        D.T == -1 and 
        D.E == 0 and
        D.Th == 0 and
        D.N == 0 and 
        D.J == 0
    )
