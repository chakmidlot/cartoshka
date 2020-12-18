use <utils.scad> 
use <axis_back.scad>

module axis_gears() {
    translate([7, 0, 9])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 8, 2, 2);
    
    translate([-9, 0, 9])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 8, 2, 2);
}

module gears() {
    difference() {
        union() {
            gear(8, 8, 2, 2);

            translate([0, 0, 16])
            gear(8, 8, 2, 2);
        }
        translate([0, 0, 0])
        cylinder(30, 2, 2);
    }
    
}

module spinning_gears() {
    difference() {
        union() {
            translate([-2, -1.5, -4])
            cube([15, 3, 3]);
                        
            translate([-2, -1.5, 19])
            cube([15, 3, 3]);

            translate([13, 0, 9])
            rotate([0, 90, 0])
            gear(16, 16, 3, 2);
        }
        
        translate([0, 0, 9])
        rotate([0, 90, 0])
        cylinder(40, 3.1, 3.1);
    }
    
    translate([1.9, -1.5, 0])
    cube([0.1, 3, 20]);
    
    translate([-2, -1.5, -1])
    cube([4, 3, 1]);
    
    translate([-2, -1.5, -1])
    cube([4, 3, 1]);
    
    translate([-2, -1.5, 18])
    cube([4, 3, 1]);
    
    w = 2.23;
    
    translate([-w / 2, -1.5, 0])
    cube([w, 3, 3.5]);

    translate([-w / 2, -1.5, 14.5])
    cube([w, 3, 3.5]);

    
    translate([w / 2 - 0.1, -1.5, 0])
    cube([0.1, 3, 20]);
}

module gears_holder() {
    difference() {
        translate([0, 0, 2.25])
        cylinder(13.5, 3.5, 3.5);
        
        w = 2.4;
    
        translate([-w / 2, -1.6, 0])
        cube([w, 3.2, 3.5]);
        
        translate([-w / 2, -1.6, 14.5])
        cube([w, 3.2, 3.5]);
    }
}

$fn = 100;

module differential_assembled() {   
    gears();
    axis_gears();
    spinning_gears();
    gears_holder();
    
    translate([9, 0, 9])
    %back_axis();

    rotate([0, 0, 180])
    translate([9, 0, 9])
    %back_axis();

}

differential_assembled();
