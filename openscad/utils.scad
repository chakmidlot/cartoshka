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

gear(8, 10, 3, 2);