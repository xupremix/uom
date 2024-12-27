from uom.prelude import *

fn main():
    var v: Velocity[meter_per_hour] = 20
    var v2: Velocity[second] = 20
    ris = v + v2
    print(ris)
