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
        cube([2, 6, 7.5]);

        translate([0, 3, 3.5])
        rotate([0, 90, 0])
        cylinder(1, 3, 1.6);
        
        translate([1, 3, 3.5])
        rotate([0, 90, 0])
        cylinder(1, 1.6, 3);
    }
    
    translate([18, 1.5, 7.5])
    rotate([0, 176, 0])
    cube([17, 3, 1]);
    
    translate([0, 1, 0])
    rotate([90, 0, 0])
    linear_extrude(1)
    polygon([[0, 9], [0, 10], [18, 7.5], [18, 6.5]]);
    
    translate([0, 6, 0])
    rotate([90, 0, 0])
    linear_extrude(1)
    polygon([[0, 9], [0, 10], [18, 7.5], [18, 6.5]]);
};

module wheel_axis() {
    $fn = 100;

    translate([-15, 3, 3.5])
    rotate([0, 90, 0])
    difference() {
        cylinder(35, 1.5, 1.5);
        
        translate([0.5, 0.5, -1])
        cube([1, 1, 6]);
        
        translate([-1.5, 0.5, -1])
        cube([1, 1, 6]);
        
        translate([0.5, -1.5, -1])
        cube([1, 1, 6]);
        
        translate([-1.5, -1.5, -1])
        cube([1, 1, 6]);
    }
    
    translate([18, 3, 3.5])
    rotate([0, 90, 0])
    cylinder(1, 2, 1.5);
    
    translate([19, 3, 3.5])
    rotate([0, 90, 0])
    cylinder(1, 1.5, 2);
    
    
}

wheel_border();

wheel_axis();