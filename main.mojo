from uom.prelude import *


fn main():
    var a: QLength[meter] = 1609.344
    var b: QLength[mile] = a
    c = b * a
    print(c)
