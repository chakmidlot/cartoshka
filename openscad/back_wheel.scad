use <utils.scad>;
use <wheel.scad>;

$fn = $preview ? 10 : 200;

module wheel_axis() {
    difference () {
        cylinder(25, 3, 3);
        
        translate([0, 0, 19])
        _plus_axis(3, 3, 7);
    }
    
    gear(7, 8, 2, 3);
    
}

module wheel_axis_assembled() {
    wheel_axis();
    
    translate([0, 0, 18])
    wheel_assembled();
}

wheel_axis_assembled();