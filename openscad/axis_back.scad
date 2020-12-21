use <utils.scad> 

$fn = $preview ? 10 : 200;

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

module left_axis() {
    rotate([0, 90, 0])
    intersection() {
        difference() {
            union() {
                cylinder(27, 3, 3);
                
                translate([0, 0, 3])
                cylinder(1, 4, 4);
                
                cylinder(4, 4, 4);
                
            }
            
            translate([0, 0, -1])
            _plus_axis(4, 2, 3);
            
            _lock(8);
            _lock(15);
            
            translate([0, 0, 21.5])
            _plus_axis(3, 2, 6);
        }
    }
    
    rotate([0, 90, 0])
    diff_gear();
}

module right_axis() {
    left_axis();
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
        gear(7, 8, 2, 3);
        
        translate([0, 0, -1])
        _plus_gear(3, 2, 5);
    }
}

module left_axis_assembled() {
    rotate([22.5, 0, 0])
    union() {
        left_axis();
        
        translate([22, 0, 0])
        rotate([0, 90, 0])
        wheel_gear();
    }
}

module right_axis_assembled() {
    rotate([22.5, 0, 0])
    union() {
        right_axis();
        
        translate([22, 0, 0])
        rotate([0, 90, 0])
        wheel_gear();
    }
}

// printing parts
//left_axis();
//wheel_gear();

left_axis_assembled();
