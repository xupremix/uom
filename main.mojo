from uom.prelude import *

fn main():
    var v: Length[meter] = 24 * 60
    var v2: Length[millimeter] = 2e5
    ris = v + v2 + 200
    print(ris.to[kilometer]())
