use <utils.scad>

$fn = 100;

module transmission_assembled() {
    rotate([0, 90, 0])
    union() {
        cylinder(40, 3, 3);
        gear(8, 12, 3, 2);
    }
}

transmission_assembled();
