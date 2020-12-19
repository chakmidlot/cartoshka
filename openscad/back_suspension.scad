use <differential.scad>;
use <axis_back.scad>;
use <back_wheel.scad>;

$fn = 100;

module stop_ring() {
    difference() {
        cylinder(2, 4, 4);
        
        rotate([0, 0, 0])
        translate([-4, 0, 1])
        cube([8, 7, 4], true);
    
        cylinder(1, 2, 2);
        
        translate([0, 0, 1])
        cylinder(1, 2, 3);
    }
}

module transmission_path() {
    difference() {
        union() {
            difference() {
                translate([0, 18, 0])
                rotate([-90, 0, 0])
                cylinder(15, 6, 6);
                
                translate([0, 24.9, 0])
                rotate([-90, 0, 0])
                cylinder(3.2, 7, 7);
            }
            
            translate([0, 24.9, 0])
            rotate([-90, 0, 0])
            cylinder(3.2, 5, 5);
        }
    }
}

module wheel_tunnel() {
    difference() {
        union() {
            translate([0, 0, 9])
            cube([9, 20, 10]);
            
            translate([0, 10, 9])
            rotate([0, 90, 0])
            cylinder(9, 11, 11);
            
            translate([8, 0, 15.5])
            cube([1, 2, 13]);
            
            translate([8, 18, 15.5])
            cube([1, 2, 13]);
            
            translate([0, 0, 15.5])
            cube([3, 6.7, 13]);
            
            translate([0, 13.3, 15.5])
            cube([3, 6.7, 13]);
            
            translate([0, 18, 13.5])
            cube([9, 3, 15]);
            
            translate([0, -1, 13.5])
            cube([9, 3, 15]);
            
        }
        
        translate([7, 4, 19])
        cube([3, 13, 3]);
        
        translate([1, 10, 9])
        rotate([0, 90, 0])
        cylinder(9, 3.1, 3.1);
        
        translate([2, 10, 25])
        rotate([0, 90, 0])
        cylinder(6, 10, 10);
        
        translate([-2, 10, 9])
        rotate([0, 90, 0])
        cylinder(9, 9, 9);
        
    }
}

module symmetry() {
    intersection() {
        difference() {
            union() {
                
                translate([-18, -19, -18])
                cube([36, 40, 25]);
                
                translate([18, -5, -5])
                cube([10, 10, 10]);
                
                transmission_path();
            }
            
            translate([0, 1, 3])
            cube([28, 34, 40], true);
            
            rotate([0, 90, 0])
            cylinder(90, 3.2, 3.2);
            
            rotate([0, -90, 0])
            cylinder(90, 3.2, 3.2);
            
            translate([0, -3.2, 0])
            cube([90, 6.4, 10]);
            
            rotate([0, 0, 180])
            translate([0, -3.2, 0])
            cube([90, 6.4, 10]);
            
            translate([21.5, -10, 7])
            rotate([-90, 0, 0])
            linear_extrude(20)
            polygon([
                [0, 4], [2, 4], [3, 4], 
                [3, 0], [-1, 0], [-1, 4], 
            ]);
            
            translate([19.5, -10, -6])
            cube([5, 20, 2]);
            
            translate([-100, -50, -30])
            cube([100, 100, 50]);
            
            rotate([-90, 0, 0])
            cylinder(35, 3.2, 3.2);
            
        }
       
        translate([0, 0, 0])
        cube([100, 100, 10], true);
    }
    
    translate([0, -19, 0])
    rotate([90, 0, 0])
    cylinder(6, 5, 5);
    
    translate([14.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
    
    translate([21.5, 0, 0])
    rotate([0, 90, 0])
    stop_ring();
    
    translate([26, -10, -23.5])
    wheel_tunnel();
}

module suspension() {
    symmetry();
    
    mirror([1, 0, 0]) 
    symmetry();
    
    translate([12.5, 7, -5])
    cube([2, 3, 10]);
    
    translate([12.5, -10, -5])
    cube([2, 3, 10]);
    
    
    translate([-15, 7, -5])
    cube([2, 3, 10]);
    
    translate([-15, -10, -5])
    cube([2, 3, 10]);
}

module axis_clip() {
    cube([4, 3, 12]);
    
    cube([4, 16, 2]);
    
    translate([0, 0, 9])
    cube([4, 16, 3]);
    
    translate([0, 14, 2])
    rotate([0, 90, 0])
    cylinder(4, 1, 1);
}

module back_suspension_assembled() {
    translate([0, 0, 0])
    differential_assembled();

    translate([-28.5, 0, -14.5])
    rotate([0, -90, 0])
    %wheel_axis();

    translate([28.5, 0, -14.5])
    rotate([0, 90, 0])
    %wheel_axis();
    
    translate([20.5, -8, -6])
    axis_clip();
    
    translate([-24.5, -8, -6])
    axis_clip();

    suspension();
}

//axis_clip();
back_suspension_assembled();

//suspension();