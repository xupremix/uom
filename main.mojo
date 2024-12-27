from uom.prelude import *

fn main():
    var l: Length[meter] = 60
    var t: Time[second] = 60 * 24 - 1
    ris = l / t
    print(ris)
