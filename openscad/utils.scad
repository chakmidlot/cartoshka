module gear(n, r, h, l) {
    tooth_angle = 360 / n / 2;
    
    
    for (i = [0: n]) {
        rotate([0, 0, tooth_angle * i * 2])
        union() {
            linear_extrude(l)
            polygon([
                [0, 0],
                [r, 0],
                [r * cos(tooth_angle * .15), r * sin(tooth_angle * .15)],
                [(r-h) * cos(tooth_angle * .5), (r-h) * sin(tooth_angle * .5)],
                [(r-h) * cos(tooth_angle), (r-h) * sin(tooth_angle)]
            ]);
            
            linear_extrude(l)
            rotate([180, 0, 0])
            polygon([
                [0, 0],
                [r, 0],
                [r * cos(tooth_angle * .15), r * sin(tooth_angle * .15)],
                [(r-h) * cos(tooth_angle * .5), (r-h) * sin(tooth_angle * .5)],
                [(r-h) * cos(tooth_angle), (r-h) * sin(tooth_angle)]
            ]);
        }
    }
}

module _plus_axis(r, w, h) {
    translate([w/2, w/2, 0])
    cube([r, r, h]);
    
    translate([-w/2 - r, w/2, 0])
    cube([r, r, h]);
 
    translate([-w/2 - r, -w/2 - r, 0])
    cube([r, r, h]);
    
    translate([w/2, -w/2 - r, 0])
    cube([r, r, h]);
}

module _plus_gear(r, w, h) {
    difference() {
        cylinder(h, r, r);
        
        translate([w/2, w/2, -1])
        cube([r, r, h]);
        
        translate([-w/2 - r, w/2, -1])
        cube([r, r, h]);
        
        translate([-w/2 - r, -w/2 - r, -1])
        cube([r, r, h]);
        
        translate([w/2, -w/2 - r, -1])
        cube([r, r, h]);
    }
}

gear(8, 10, 4, 2);