use <utils.scad> 

$fn = 100;

module _lock(h) {
    translate([0, 0, h])
    cylinder(1, 3, 4);
    
    translate([0, 0, h+1])
    cylinder(1, 4, 4);
    
    translate([0, 0, h+4])
    cylinder(1, 3, 4);
    
    translate([0, 0, h+5])
    cylinder(1, 4, 4);
}

module back_axis() {
    rotate([0, 90, 0])
    difference() {
        union() {
            cylinder(45, 3, 3);
            
            translate([0, 0, 2])
            cylinder(1, 3, 4);

            translate([0, 0, 3])
            cylinder(1, 4, 4);
            
            _lock(9);
            _lock(30);
        }
        
        translate([1, 1, -1])
        cube([3, 3, 3]);
        
        translate([-4, 1, -1])
        cube([3, 3, 3]);
        
        translate([-4, -4, -1])
        cube([3, 3, 3]);
        
        translate([1, -4, -1])
        cube([3, 3, 3]);
    }
}

module axis_gear() {
    difference() {
        gear(8, 8, 2, 2);
        
        translate([0, 0, -1])
        difference() {
            cylinder(4, 3, 3);
            
            translate([1, 1, -1])
            cube([2, 2, 5]);
            
            translate([1, -3, -1])
            cube([2, 2, 5]);

            translate([-3, 1, -1])
            cube([2, 2, 5]);
            
            translate([-3, -3, -1])
            cube([2, 2, 5]);
        }
    }
}

module axis_assembled() {
    rotate([22.5, 0, 0])
    union() {
        back_axis();
        
        rotate([0, 90, 0])
        %axis_gear();
    }
}

axis_assembled();