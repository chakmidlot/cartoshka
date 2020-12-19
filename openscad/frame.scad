use <back_suspension.scad>

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
    polygon([
        [-40, -27], [-40, 100], [40, 100], [40, -27],
        [-36, -22], [-36, 24], [36, 24], [36, -22],
        [-36, 28], [-36, 50], [36, 50], [36, 28],
    ],
    paths=[
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9, 10, 11],
    ]);
}

union() {
    %back_suspension_assembled();
    frame();
}

