from uom.prelude import *

fn main():
    var l: Length[meter] = 1609.344
    print(l.to[mile]())
