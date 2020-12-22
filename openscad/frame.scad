use <back_suspension.scad>
use <front_axis.scad>

$fn = $preview ? 10 : 200;

module rack() {
    linear_extrude(4)
    polygon([
        [-40, -27], [-40, 124], [40, 124], [40, -27],
        [-36, -22], [-36, 24], [36, 24], [36, -22],
        [-36, 28], [-36, 60], [36, 60], [36, 28],
        [-36, 64], [-36, 85], [-25, 98], [25, 98], [36, 85], [36, 64],
        [-25, 102], [-36, 111], [-36, 120], [36, 120], [36, 111], [25, 102],
//        [-40, 88], [-29, 100], [-40, 108],
//        [40, 88], [29, 100], [40, 108],
    ],
    paths=[
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9, 10, 11],
        [12, 13, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23],
//        [24, 25, 26],
//        [27, 28, 29],
    ]);
}

module front_axis_holder() {
    
    // locking cube
    translate([12, 94, 4])
    {
        {
            cube([16, 17, 4]);
            
            cube([16, 5.8, 9.2]);
            
            translate([0, 0, 9.2])
            difference() {
                cube([16, 9, 4]);
                
                translate([5.8, 5.8, 0])
                cube([4.4, 10, 0.1]);
            }
            
            translate([0, 13, 0])
            cube([5.8, 4, 13.2]);
            
            translate([10.2, 13, 0])
            cube([5.8, 4, 13.2]);
            
            translate([10.2, 8, 9.2])
            cube([5.8, 5, 0.1]);
            
            translate([0, 8, 9.2])
            cube([5.8, 5, 0.1]);
        }
    }
    
    // frame joins
    translate([28, 94, 0])
    rotate([0, -90, 0])
        linear_extrude(16)
        polygon([
            [0, 0], [0, 30], [4, 30], [4, 0]
        ]);
    
}

module back_axis_holder() {
    difference() {
        translate([0, -22, 0])
        rotate([90, 0, 0])
        linear_extrude(5)
        polygon([[-15, 0], [-5, 18], [5, 18], [15, 0]]);
        
        translate([0, -20, 8])
        rotate([90, 0, 0])
        cylinder(5, 5.2, 5.2);
        
    }
    
    translate([0, 28, 0])
    difference() {
        rotate([90, 0, 0])
        linear_extrude(3)
        polygon([[-20, 0], [-10, 15], [10, 15], [20, 0]]);
        
        translate([-5.2, -4, 8])
        cube([10.4, 5, 15]);
        
        translate([0, -4, 8])
        rotate([-90, 0, 0])
        cylinder(5, 5.2, 5.2);
        
        translate([8, -6, -1])
        cube([4, 8, 3]);
        
        mirror([1, 0, 0])
        translate([8, -6, -1])
        cube([4, 8, 3]);
    }
}

module frame() {
    difference() {
        rack();
        
        // front axis holder
        translate([36, 96, -1])
        cube([5, 11, 6]);
        
        mirror([1, 0, 0])
        translate([36, 96, -1])
        cube([5, 11, 6]);
        
        
        // back axis holder
        translate([0, -21, 8])
        rotate([90, 0, 0])
        cylinder(4.2, 5.2, 5.2);
        
        translate([0, 29, 8])
        rotate([90, 0, 0])
        cylinder(6, 5.2, 5.2);
        
        translate([0, 25.2, 8])
        rotate([90, 0, 0])
        cylinder(3, 6.2, 6.2);
        
        translate([8, 23, -1])
        cube([4, 8, 3]);
        
        mirror([1, 0, 0])
        translate([8, 23, -1])
        cube([4, 8, 3]);
    }
}

module back_axis_clip_left() {
    translate([0, 31, 0]) {
        rotate([90, 0, 0])
        linear_extrude(3)
        polygon([
            [11.9,-1], [8.1, -1], [8.1, 2], [6, 15], [0, 15],
            [0, 18], [10, 18], [11.9, 2]
        ]);
        
        translate([0, -8, 15])
        cube([10, 5, 3]); 
        
        translate([8.1, -8, -1])
        cube([3.8, 6, 2.9]);
        
        translate([8.1, -8, 1.9])
        cube([3.8, 0.8, 0.2]);
        
        translate([0, -6, 10])
        difference() {
            cube([5, 6, 5]); 
            
            translate([0, -1, -2])
            rotate([-90, 0, 0])
            cylinder(8, 6.2, 6.2);
        }
        
        
    }
}

module back_axis_clip() {
    back_axis_clip_left();
    
    mirror([1, 0, 0])
    back_axis_clip_left();
}

rotate([0, 0, 180])
union() {
    translate([0, 0, 8])
    %back_suspension_assembled();
    
    %
    translate([0, 100, 10.5])
    rotate([180, 0, 0])
    front_axis_assembled();
    
    front_axis_holder();
    
    mirror([1, 0, 0])
    front_axis_holder();
    back_axis_holder();
    
    frame();
    back_axis_clip();
}



