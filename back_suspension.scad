module wheel_border() {
    $fn = 100;

    rotate([0, -90, 0])
    difference() {
        cube([10, 6, 2]);
        
        translate([1,1,-1])
        cube([8, 4, 4]);
    }

    cube([18, 6, 1]);
    
    translate([18, 0, 0])
    difference() {
        cube([2, 6, 7]);

        translate([0, 3, 3])
        rotate([0, 90, 0])
        cylinder(1, 3, 1.6);
        
        translate([1, 3, 3])
        rotate([0, 90, 0])
        cylinder(1, 1.6, 3);
    }
    
    translate([3, 1.5, 6.5])
    cube([15, 3, 0.5]);
    
    translate([3, 1.5, 5])
    cube([1, 3, 2]);
    
};

module wheel_axis() {
    $fn = 100;

    translate([-20, 3, 3])
    rotate([0, 90, 0])
    difference() {
        cylinder(50, 1.5, 1.5);
        
        translate([0.5, 0.5, -1])
        cube([1, 1, 6]);
        
        translate([-1.5, 0.5, -1])
        cube([1, 1, 6]);
        
        translate([0.5, -1.5, -1])
        cube([1, 1, 6]);
        
        translate([-1.5, -1.5, -1])
        cube([1, 1, 6]);
    }
    
    translate([18, 3, 3])
    rotate([0, 90, 0])
    cylinder(1, 2, 1.5);
    
    translate([19, 3, 3])
    rotate([0, 90, 0])
    cylinder(1, 1.5, 2);
    
    
}

wheel_border();

wheel_axis();