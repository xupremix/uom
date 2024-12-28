from .unit import Unit
from .units.prelude import *

trait Dim:
    alias L: Int
    alias M: Int
    alias T: Int
    alias E: Int
    alias H: Int
    alias N: Int
    alias J: Int

    @parameter
    @staticmethod
    fn same_dim[D: Dim]() -> Bool: ...

struct ISQ[
    l: Int,
    m: Int,
    t: Int,
    e: Int,
    h: Int,
    n: Int,
    j: Int,
](Dim):
    alias L = l
    alias M = m
    alias T = t
    alias E = e
    alias H = h
    alias N = n
    alias J = j

    @parameter
    @staticmethod
    fn same_dim[D: Dim]() -> Bool:
        return (
            ( D.L > 0 and l > 0 ) or
            ( D.L < 0 and l < 0 ) or
            ( D.L == l )
        ) and (
            ( D.M > 0 and m > 0 ) or
            ( D.M < 0 and m < 0 ) or
            ( D.M == m )
        ) and (
            ( D.T > 0 and t > 0 ) or
            ( D.T < 0 and t < 0 ) or
            ( D.T == t )
        ) and (
            ( D.E > 0 and e > 0 ) or
            ( D.E < 0 and e < 0 ) or
            ( D.E == e )
        ) and (
            ( D.H > 0 and h > 0 ) or
            ( D.H < 0 and h < 0 ) or
            ( D.H == h )
        ) and (
            ( D.N > 0 and n > 0 ) or
            ( D.N < 0 and n < 0 ) or
            ( D.N == n )
        ) and (
            ( D.J > 0 and j > 0 ) or
            ( D.J < 0 and j < 0 ) or
            ( D.J == j )
        )  

@parameter
fn check_unit_for_dim[U: Unit, D: Dim]() -> Bool:
    return (
        D.L == 0 and
        D.M == 0 and
        D.T == 0 and 
        D.E == 0 and
        D.H == 0 and
        D.N == 0 and 
        D.J == 0
    ) or(
        LengthUnits.find[U]() and
        D.L >= 1 and
        D.M == 0 and
        D.T == 0 and 
        D.E == 0 and
        D.H == 0 and
        D.N == 0 and 
        D.J == 0
    ) or (
        TimeUnits.find[U]() and
        D.L == 0 and
        D.M == 0 and
        D.T >= 1 and 
        D.E == 0 and
        D.H == 0 and
        D.N == 0 and 
        D.J == 0
    ) or (
        VelocityUnits.find[U]() and
        D.L == 1 and
        D.M == 0 and
        D.T == -1 and 
        D.E == 0 and
        D.H == 0 and
        D.N == 0 and 
        D.J == 0
    )
