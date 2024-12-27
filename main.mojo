from uom.prelude import *

fn main():
    var l: Length[meter] = 60
    var t: Time[second] = 20
    ris = l / t
    print(ris.to[kilometer_per_hour]())
