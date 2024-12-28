from uom.prelude import *

fn main():
    var l: QLength[mile] = 4
    var l2: QLength[meter] = 1609.344 * 2
    ris = l / l2
    print(ris)
