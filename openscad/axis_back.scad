use <utils.scad> 

$fn = 100;

module _lock(h) {
    difference() {
        translate([0, 0, h])
        cylinder(2, 5, 5);
        
        translate([0, 0, h])
        cylinder(1, 2, 2);
        
        translate([0, 0, h + 1])
        cylinder(1, 2, 3);
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

module back_axis() {
    rotate([0, 90, 0])
    intersection() {
        difference() {
            union() {
                cylinder(27, 3, 3);
                
                translate([0, 0, 3])
                cylinder(1, 4, 4);
                
                cylinder(4, 4, 4);
                
            }
            
            translate([0, 0, -0.5])
            _plus_axis(4, 2, 3);
            
            _lock(9);
            _lock(17);
            
            translate([0, 0, 21.5])
            _plus_axis(3, 2, 6);
        }
    }
}

module diff_gear() {
    difference() {
        gear(8, 8, 2, 2);
        
        translate([0, 0, -1])
        _plus_gear(4, 2, 4);
    }
}

module wheel_gear() {
    difference() {
        gear(8, 10, 3, 3);
        
        translate([0, 0, -1])
        _plus_gear(3, 2, 5);
    }
}

module axis_assembled() {
    rotate([22.5, 0, 0])
    union() {
        back_axis();
        
        rotate([0, 90, 0])
        diff_gear();
        
        translate([22, 0, 0])
        rotate([0, 90, 0])
        wheel_gear();
    }
}

// printing parts
back_axis();
axis_gear();

axis_assembled();
