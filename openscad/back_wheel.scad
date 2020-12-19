use <utils.scad>

$fn = 100;

module wheel_axis() {
    cylinder(20, 3, 3);
    
    gear(7, 8, 2, 3);
}

wheel_axis();