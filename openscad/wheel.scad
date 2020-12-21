use <utils.scad>;

$fn = 100;

module wheel() {
    difference() {
        union() {
            cylinder(7, 11, 11);
            
            translate([0, 0, 0.5])
            cylinder(1.5, 11, 12.5);
            
            translate([0, 0, 2])
            cylinder(3, 12.5, 12.5);
            
            translate([0, 0, 5])
            cylinder(1.5, 12.5, 11);
        }
        
        translate([0, 0, -1])
        _plus_gear(4, 3, 9);
    }
}

module tire() {
    intersection() {
        union() {
            n = 20;
            
            for (i = [0: n]) {
                rotate([0, 0, i * 360 / n])
                translate([18, 0, 2.5])
                cube([3, 4, 5], true);
            }
            for (i = [0: n]) {
                rotate([0, 0, (i + 0.5) * 360 / n])
                translate([18, 0, 7.5])
                cube([3, 4, 5], true);
            }
            difference() {
                cylinder(10, 18, 18);
                
                translate([0, 0, 1.5])
                wheel();
                
                translate([0, 0, -1])
                cylinder(12, 11, 11);
                
            }
        }
        
        cylinder(10, 20, 20);
    }
}

module wheel_assembled() {
    translate([0, 0, 1.5])
    wheel();
    
    tire();
}

wheel_assembled();
