from uom.prelude import *

fn main():
    var l: Length[mile] = 4
    var l2: Length[millimeter] = 1609.344 * 2 * 1e3
    ris = l / l2
    print(ris)
