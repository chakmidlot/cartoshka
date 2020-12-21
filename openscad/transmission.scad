use <utils.scad>

$fn = $preview ? 10 : 200;

module transmission() {
    rotate([0, 90, 0])
    difference() {
        union() {
            cylinder(30, 3, 3);
            cylinder(4, 5, 5);
            gear(8, 12, 3, 2);
        }
        
        translate([0, 0, 26])
        _plus_axis(3, 2, 5);
        
        translate([2, -5, 19.1])
        cube([10, 10, 3.5]);
        
        translate([-12, -5, 19.1])
        cube([10, 10, 3.5]);
    }
}

module transmission_clip() {
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

module transmission_assembled() {
    transmission();
    
    translate([19.5, 0, 0])
    rotate([90, 0, 0])
    rotate([0, 90, 0])
    transmission_clip();
}

transmission_assembled();
