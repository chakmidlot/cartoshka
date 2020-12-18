use <utils.scad>
use <axis_back.scad>
use <transmission.scad>

module gears() {
    difference() {
        union() {
            translate([0, 0, -8.5])
            gear(8, 8, 2, 2);

            translate([0, 0, 6.5])
            gear(8, 8, 2, 2);
        }
        translate([0, 0, -1])
        cylinder(30, 2, 2);
    }
    
}

module spinning_gears() {
    difference() {
        translate([10.5, 0, 0])
        rotate([0, 90, 0])
        gear(12, 15, 3, 2);
    
        translate([0, 0, 0])
        rotate([0, 90, 0])
        cylinder(40, 3.1, 3.1);
    }
    
    translate([0, 1.5, 5.5])
    rotate([90, 0, 0])
    linear_extrude(3)
    polygon([
        [1.15, 0], [1.15, 3], [5, 3], [5.5, 3.5], [9, 3.5],
        [11, 1.5], [11, 6], [-5, 6], [-5, 3], [-1.15, 3], [-1.15, 0]
    ]);
    
    rotate([180, 0, 0])
    translate([0, 1.5, 5.5])
    rotate([90, 0, 0])
    linear_extrude(3)
    polygon([
        [1.15, 0], [1.15, 3], [5, 3], [5.5, 3.5], [9, 3.5],
        [11, 1.5], [11, 6], [-5, 6], [-5, 3], [-1.15, 3], [-1.15, 0]
    ]);
    
    translate([1.05 - 0.1, -1.5, -9])
    cube([0.2, 3, 20]);
}

module gears_holder() {
    difference() {
        translate([0, 0, -6.25])
        cylinder(12.5, 3.5, 3.5);
        
        w = 3;
    
        translate([-w / 2, -2, -7.5])
        cube([w, 4, 2]);
        
        translate([-w / 2, -2, 5])
        cube([w, 4, 2]);
    }
}

$fn = 100;

module differential_assembled() {   
    gears();
    spinning_gears();
    gears_holder();
    
    translate([6.5, 0, 0])
    %axis_assembled();

    rotate([0, 0, 180])
    translate([6.5, 0, 0])
    %axis_assembled();
    
    translate([0, 14, 0])
    rotate([0, 360 / 16, 0])
    rotate([0, 0, 90])
    %transmission_assembled();
}

differential_assembled();

//printing parts
gears_holder();
spinning_gears();