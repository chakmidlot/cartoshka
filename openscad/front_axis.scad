$fn = 100;

module joint() {
    difference() {
        cylinder(6, 5, 5);
        
        translate([0, 0, -0.005])
        cylinder(3.01, 4, 2);
        
        translate([0, 0, 2.995])
        cylinder(3.01, 2, 4);
        
        rotate([0, 0, 30])
        translate([0, 0, 3])
        cube([5, 5, 4]);
        
        rotate([0, 0, -30])
        translate([0, 0, 3])
        cube([5, 5, 4]);
    }
    
    cylinder(3, 3.7, 1.7);
    
    translate([0, 0, 3])
    cylinder(3, 1.7, 3.7);

    difference() {
        intersection() {
            cube([7, 7, 6]);
            cylinder(6, 7, 7);
        }
        
        translate([0, 0, -1])
        cylinder(4.3, 5.3, 5.3);
    }
}

module symmetry() {
    translate([19, 0, 0])
    cube([30, 3, 3], true);
    
    translate([0, 20, 0])
    cube([68, 3, 3], true);

    translate([40, 10, 0])
    cube([3, 11, 3], true);
    
    translate([40, 0, 10])
    cube([3, 3, 15], true);
    
    translate([40, 20, -1.5])
    rotate([0, 0, 110])
    joint();
    
    translate([40, 0, -1.5])
    rotate([0, 0, 160])
    joint();
    
    translate([38.5, 0, 22])
    rotate([0, 90, 0])
    difference() {
        cylinder(3, 5, 5);
        
        translate([0, 0, -1])
        cylinder(5, 3, 3);
    }
}

module front_axis() {
    symmetry();
    
    mirror([1, 0, 0])
    symmetry();

    
    translate([0, 0, -1.5])
    rotate([0, 0, 45])
    joint();
    
    translate([0, 20, 0])
    cylinder(6, 1.3, 1.3);
    
    translate([-3, 6, -1.5])
    difference() {
        cube([6, 30, 6]);
        
        translate([-1, 7, -1])
        cube([8, 15, 4.3]);
        
        translate([1.5, 7, 2])
        cube([3, 15, 5]);
    }
}

front_axis();