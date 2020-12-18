use <differential.scad>;
use <axis_back.scad>;

$fn = 100;

module stop_ring() {
    difference() {
        cylinder(2, 4, 4);
    
        rotate([0, 0, 0])
        translate([-4, 0, 1])
        cube([8, 6, 4], true);
    
        cylinder(1, 2, 2);
        
        translate([0, 0, 1])
        cylinder(1, 2, 3);
    }
}

module suspension() {
    intersection() {
        difference() {
            union() {
                translate([-18, -19, -22])
                cube([36, 40, 25]);
                
                rotate([0, 90, 0])
                cylinder(28, 6, 6);
                
                rotate([0, -90, 0])
                cylinder(28, 6, 6);
                
                rotate([-90, 0, 0])
                cylinder(35, 6, 6);
                
                rotate([90, 0, 0])
                cylinder(25, 6, 6);
            }
            
            translate([0, 1, 3])
            cube([28, 34, 40], true);
            
            rotate([0, 90, 0])
            cylinder(90, 3.2, 3.2);
            
            rotate([0, -90, 0])
            cylinder(90, 3.2, 3.2);
            
            rotate([-90, 0, 0])
            cylinder(90, 3.2, 3.2);
            
            translate([0, -3.2, 0])
            cube([90, 6.4, 10]);
            
            rotate([0, 0, 90])
            translate([0, -3.2, 0])
            cube([90, 6.4, 10]);
            
            rotate([0, 0, 180])
            translate([0, -3.2, 0])
            cube([90, 6.4, 10]);
        }
        
        translate([0, 0, -1])
        cube([100, 100, 8], true);
    }
    
    translate([15.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
    
    translate([23.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
    
    rotate([0, 0, 180])
    translate([15.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
    
    rotate([0, 0, 180])
    translate([23.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
}


translate([0, 0, 0])
%differential_assembled();



suspension();