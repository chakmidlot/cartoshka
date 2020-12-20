use <utils.scad>;

$fn = 20;

module wheel_axis() {
    difference() {
        cylinder(12, 2.9, 2.9);
        
        translate([2, -5, 3])
        cube([10, 10, 3.5]);

        translate([-12, -5, 3])
        cube([10, 10, 3.5]);
    }
    
    translate([0, 0, 11.5])
    difference() {
        cylinder(12, 4, 4);

        translate([0, 0, 5])
        _plus_axis(4, 3, 8);
    }
}

module front_wheel_clip() {
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

module wheel() {
    difference() {
        union() {
            cylinder(5, 11, 11);
            
            translate([0, 0, 0.5])
            cylinder(1.5, 11, 12.5);
            
            translate([0, 0, 2])
            cylinder(1, 12.5, 12.5);
            
            translate([0, 0, 3])
            cylinder(1.5, 12.5, 11);
        }
        
        translate([0, 0, -1])
        _plus_gear(4, 3, 8);
    }
}

module tire() {
    intersection() {
        union() {
            n = 20;
            
            for (i = [0: n]) {
                rotate([0, 0, i * 360 / n])
                translate([18, 0, 1.75])
                cube([3, 4, 3.5], true);
            }
            for (i = [0: n]) {
                rotate([0, 0, (i + 0.5) * 360 / n])
                translate([18, 0, 5.25])
                cube([3, 4, 3.5], true);
            }
            difference() {
                cylinder(7, 18, 18);
                
                translate([0, 0, -1])
                cylinder(9, 11, 11);
                
                translate([0, 0, 1.5])
                cylinder(1.5, 11, 12.5);
                
                translate([0, 0, 3])
                cylinder(1, 12.5, 12.5);
                
                translate([0, 0, 4])
                cylinder(1.5, 12.5, 11);
                
            }
        }
        
        cylinder(7, 20, 20);
    }
    
//    translate([0, 0, 5])
//    cylinder(0.1, 15, 15);
}

module wheel_axis_assembled() {
    wheel_axis();
    
    translate([0, 0, 3.2])
    rotate([0, 0, 90])
    front_wheel_clip();
    
    translate([0, 0, 17])
    wheel();
    
    translate([0, 0, 16])
    tire();
}


wheel_axis_assembled();

//wheel_axis();
//front_wheel_clip();