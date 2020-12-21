module wheel_border() {
    $fn = $preview ? 10 : 200;
    
    rotate([0, -90, 0])
    difference() {
        cube([15, 10, 2]);
        
        translate([1, 1.5, -1])
        cube([12, 7, 5]);
    }

    cube([18, 10, 1]);
    
    translate([18, 0, 0])
    difference() {
        cube([2, 10, 11]);

        translate([-1, 5, 5.5])
        rotate([0, 90, 0])
        cylinder(2, 5, 3.2);
        
        translate([1, 5, 5.5])
        rotate([0, 90, 0])
        cylinder(2, 3.2, 6);
    }
    
    
    translate([18, 3.5, 11])
    rotate([0, 176, 0])
    cube([17, 3, 1]);
    
    translate([0, 2, 0])
    rotate([90, 0, 0])
    linear_extrude(2)
    polygon([[0, 13], [0, 15], [18, 11], [18, 9]]);
    
    translate([0, 10, 0])
    rotate([90, 0, 0])
    linear_extrude(2)
    polygon([[0, 13], [0, 15], [18, 11], [18, 9]]);
    
    translate([20, 0, 0])
    cube([5, 2, 2]);
    
    translate([20, 0, 9])
    cube([5, 2, 2]);
        
    translate([20, 8, 0])
    cube([5, 2, 2]);
        
    translate([20, 8, 9])
    cube([5, 2, 2]);
};

module wheel_axis() {
    $fn = $preview ? 10 : 200;
    
    rotate([0, 90, 0])
    difference() {
        cylinder(40, 3, 3);
        
        translate([1, 1, -1])
        cube([2, 2, 6]);
        
        translate([-3, 1, -1])
        cube([2, 2, 6]);
        
        translate([1, -3, -1])
        cube([2, 2, 6]);
        
        translate([-3, -3, -1])
        cube([2, 2, 6]);
    }
    
    translate([32, 0, 0])
    rotate([0, 90, 0])
    cylinder(2, 4, 3);
    
    translate([34, 0, 0])
    rotate([0, 90, 0])
    cylinder(2, 3, 4);
    
    translate([36, 0, 0])
    rotate([0, 90, 0])
    cylinder(1, 4, 3);
    
    
}

wheel_border();

translate([-15, 5, 5.5])
wheel_axis();