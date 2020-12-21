use <utils.scad>

$fn = 100;

module wheel_axis() {
    difference () {
        cylinder(25, 3, 3);
        
        translate([0, 0, 19])
        _plus_axis(3, 1, 7);
    }
    
    gear(7, 8, 2, 3);
    
}

wheel_axis();