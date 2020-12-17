module gear(n, r, h, l) {
    tooth_angle = 360 / n / 2;
    
    
    for (i = [0: n]) {
        rotate([0, 0, tooth_angle * i * 2])
        union() {
            linear_extrude(l)
            polygon([
                [0, 0],
                [r, 0],
                [r * cos(tooth_angle / 3), r * sin(tooth_angle / 3)],
                [(r-h) * cos(2 * tooth_angle / 3), (r-h) * sin(2 * tooth_angle / 3)],
                [(r-h) * cos(tooth_angle), (r-h) * sin(tooth_angle)]
            ]);
            
            linear_extrude(l)
            rotate([180, 0, 0])
            polygon([
                [0, 0],
                [r, 0],
                [r * cos(tooth_angle / 3), r * sin(tooth_angle / 3)],
                [(r-h) * cos(2 * tooth_angle / 3), (r-h) * sin(2 * tooth_angle / 3)],
                [(r-h) * cos(tooth_angle), (r-h) * sin(tooth_angle)]
            ]);
        }
    }
}

module axis_gears() {
    translate([7, 0, 9])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 8, 2, 2);
    
    translate([-9, 0, 9])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 8, 2, 2);
}

module gears() {
    difference() {
        union() {
            gear(8, 8, 2, 2);

            translate([0, 0, 16])
            gear(8, 8, 2, 2);
        }
        translate([0, 0, -1])
        cylinder(30, 2, 2);
    }
    
}

module spinning_gears() {
    difference() {
        union() {
            translate([-2, -1.5, -4])
            cube([15, 3, 3]);
                        
            translate([-2, -1.5, 19])
            cube([15, 3, 3]);

            translate([13, 0, 9])
            rotate([0, 90, 0])
            gear(12, 16, 3, 2);
        }
        
        translate([0, 0, 9])
        rotate([0, 90, 0])
        cylinder(40, 3.1, 3.1);
    }
    
    translate([1.9, -1.5, 0])
    cube([0.1, 3, 20]);
    
    translate([-2, -1.5, -1])
    cube([4, 3, 1]);
    
    translate([-2, -1.5, -1])
    cube([4, 3, 1]);
    
    translate([-2, -1.5, 18])
    cube([4, 3, 1]);
    
    w = 2.23;
    
    translate([-w / 2, -1.5, 0])
    cube([w, 3, 3.5]);

    translate([-w / 2, -1.5, 14.5])
    cube([w, 3, 3.5]);

    
    translate([w / 2 - 0.1, -1.5, 0])
    cube([0.1, 3, 20]);
}

module gears_holder() {
    difference() {
        translate([0, 0, 2.25])
        cylinder(13.5, 3.5, 3.5);
        
        w = 2.4;
    
        translate([-w / 2, -1.6, 0])
        cube([w, 3.2, 3.5]);
        
        translate([-w / 2, -1.6, 14.5])
        cube([w, 3.2, 3.5]);
    }
}

$fn = 100;

//gears();
//axis_gears();
spinning_gears();
gears_holder();




