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
    translate([8, 0, 10])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 10, 2, 2);
    
    translate([-10, 0, 10])
    rotate([22.5, 0, 0])
    rotate([0, 90, 0])
    gear(8, 10, 2, 2);
}

module gears() {
    gear(8, 10, 2, 2);

    translate([0, 0, 18])
    gear(8, 10, 2, 2);
}

module spinning_gears() {
    difference() {
        union() {
            translate([-2.5, -2.5, 0])
            rotate([-90, 0, 0])
            linear_extrude(5)
            polygon([
                [0, 0], [5, 5], [15, 5], [20, 0], [20, -20], [15, -25],
                [5, -25], [0, -20], [5, -20], [7.5, -22.5], [12.5, -22.5], 
                [15, -20], [15, 0], [12.5, 2.5], [7.5, 2.5], [5, 0]
            ]);
            
            translate([17.5, 0, 10])
            rotate([0, 90, 0])
            gear(8, 20, 4, 2);
        }
        
        translate([0, 0, 10])
        rotate([0, 90, 0])
        cylinder(40, 6.2, 6.2);
    }
    
    translate([1.4, -1.5, 0])
    cube([0.1, 3, 20]);
    
    translate([-1.5, -1.5, 0])
    cube([3, 3, 5]);
    
    translate([-1.5, -1.5, 15])
    cube([3, 3, 5]);

}

$fn = $preview ? 10 : 200;

//gears();
axis_gears();
spinning_gears();

//difference() {
//    gear(8, 10, 3, 2);
//    cylinder(2, 3, 3);
//}
//
//translate([20, 0, 0])
//difference() {
//    gear(8, 8, 2, 2);
//    cylinder(2, 3, 3);
//}
//
//translate([35, 0, 0])
//difference() {
//    gear(8, 5, 1.5, 2);
//    cylinder(2, 1.5, 1.5);
//}
//
//
//translate([45, 0, 0])
//difference() {
//    gear(8, 3, 1, 2);
//    cylinder(2, 1, 1);
//}




