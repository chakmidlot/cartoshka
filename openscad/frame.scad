use <back_suspension.scad>
use <front_axis.scad>

$fn = 100;

module frame2() {
    difference() {
        union() {
            difference() {
                translate([0, 1, 3])
                cube([76, 54, 5], true);
                
                translate([0, 1.5, 3])
                cube([70, 47, 7], true);
            }
            
            translate([0, -26, 1])
            rotate([-90, 0, 0])
            rotate([0, 0, 90])
            linear_extrude(4)
            polygon([
                [0, 10], [8, 5], 
                [8, -5], [0, -10]
            ]);
            
            translate([0, 25, 1])
            rotate([-90, 0, 0])
            rotate([0, 0, 90])
            linear_extrude(3)
            polygon([
                [0, 12], [8, 5], 
                [8, -5], [0, -12]
            ]);
            
            

        }
        
        translate([0, -20, 0])
        rotate([90, 0, 0])
        cylinder(5, 4, 4);
    
        translate([0, 29, 0])
        rotate([90, 0, 0])
        cylinder(5, 5, 5);
        
        translate([0, 26, 3.5])
        cube([10, 5, 7], true);
        
        
    }
}

module frame() {
    linear_extrude(4)
    polygon([
        [-40, -27], [-40, 124], [40, 124], [40, -27],
        [-36, -22], [-36, 24], [36, 24], [36, -22],
        [-36, 28], [-36, 60], [36, 60], [36, 28],
        [-36, 64], [-36, 85], [-25, 98], [25, 98], [36, 85], [36, 64],
        [-25, 102], [-36, 111], [-36, 120], [36, 120], [36, 111], [25, 102],
        [-40, 88], [-29, 100], [-40, 108],
        [40, 88], [29, 100], [40, 108],
    ],
    paths=[
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9, 10, 11],
        [12, 13, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23],
        [24, 25, 26],
        [27, 28, 29],
    ]);
}

union() {
    translate([0, 0, 3])
    %back_suspension_assembled();
    
    %
    translate([0, 100, 10.5])
    rotate([180, 0, 0])
    front_axis();
    frame();
}

