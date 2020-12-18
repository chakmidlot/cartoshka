use <differential.scad>;
use <axis_back.scad>;

$fn = 100;

module suspension() {
    translate([-15, -15, -20])
    cube([35, 30, 3]);
    
}

translate([0, 0, -9])
%differential_assembled();



suspension();