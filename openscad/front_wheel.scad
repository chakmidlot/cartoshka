use <utils.scad>;
use <wheel.scad>;

$fn = 20;

module wheel_axis() {
    difference() {
        cylinder(12, 2.9, 2.9);
        
        translate([2, -5, 3])
        cube([10, 10, 3.5]);

        translate([-12, -5, 3])
        cube([10, 10, 3.5]);
    }
    
    translate([0, 0, 11.5])
    difference() {
        cylinder(12, 4, 4);

        translate([0, 0, 5])
        _plus_axis(4, 3, 8);
    }
}

module front_wheel_clip() {
    difference() {
        cylinder(3, 5, 5);
        
        intersection() {
            cube([8, 4.1, 7], true);
            
            translate([0, 0, -1])
            cylinder(5, 3.1, 3.1);
        }
        
        translate([-4, 0, 0])
        cube([4, 3, 8], true);
        
    }
    
}

module wheel_axis_assembled() {
    wheel_axis();
    
    translate([0, 0, 3.2])
    rotate([0, 0, 90])
    front_wheel_clip();
    
    translate([0, 0, 16])
    wheel_assembled();
}


wheel_axis_assembled();

//wheel_axis();
//front_wheel_clip();