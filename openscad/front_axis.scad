use <front_wheel.scad>

$fn = $preview ? 10 : 200;

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
            linear_extrude(6)
            polygon([[0, 0], [7, 2], [7, 7], [2, 7]]);
            cylinder(6, 7, 7);
        }
        
        translate([0, 0, -1])
        cylinder(4.3, 5.3, 5.3);
    }
}

module symmetry() {
    
    translate([20, -1.5, 0])
    cube([32, 3, 5], true);
    
    translate([0, 20, 0])
    difference() {
        cube([50, 3, 5], true);
        
        translate([0, 0, 2])
        cube([20, 5, 4], true);
    }

    translate([35, 11, 0])
    rotate([0, 0, 28])
    cube([3, 11.5, 5], true);
    
    translate([40, 0, 11])
    cube([4, 5, 15], true);
    
    translate([40, 0, 3.5])
    cylinder(3, 3.7, 5);

    translate([31, 20, -2.5])
    rotate([0, 0, 130])
    joint();
    
    translate([40, 0, -2.5])
    rotate([0, 0, 55])
    joint();

    translate([37.5, 0, 22])
    rotate([0, 90, 0])
    difference() {
        cylinder(5, 6, 6);
        
        translate([0, 0, -1])
        cylinder(7, 3.2, 3.2);
    }
    
    translate([20, -4, -1])
    cube([4, 7, 3], true);
}

module front_axis() {
    symmetry();
    
    mirror([1, 0, 0])
    symmetry();

    
    translate([0, 0, -2.5])
    rotate([0, 0, 45])
    joint();
    
    translate([0, 20, 0])
    cylinder(6, 1.3, 1.3);
    
    translate([-3, 6, -2.5])
    difference() {
        cube([6, 30, 6]);
        
        translate([-1, 7, -1])
        cube([8, 15, 4.3]);
        
        translate([1.5, 7, 2])
        cube([3, 15, 5]);
    }
}

module front_axis_assembled() {
    front_axis();

    %
    translate([31, 0, 22])
    rotate([0, 90, 0])
    wheel_axis_assembled();


    %
    translate([-31, 0, 22])
    rotate([0, -90, 0])
    wheel_axis_assembled();
}

front_axis_assembled();
