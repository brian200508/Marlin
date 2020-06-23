/**
 * Remix of http://www.thingiverse.com/thing:3574034 provided as parameterized function.
 * 
 * Fischertechnik blocks generator openscad by grumson is licensed under the Creative Commons - Attribution license.
 * http://creativecommons.org/licenses/by/3.0/.
 *
 * The 'roundedCube' module is taken from https://danielupshaw.com/openscad-rounded-corners/.
 *
 * Male connector is taken from 'Fischer Technik Basic Block' https://www.thingiverse.com/thing:70177.
 */

//translate([0 ,0 , 4 + 7.5])ftBlock(NumberOfSegments = 1, TopConnector = "female", BottomConnector = "male");

/**
 * Create male connector from 'Fischer Technik Basic Block' https://www.thingiverse.com/thing:70177.
 */
module ftConnectorMale() {
    translate([0, 0, -30])difference() {
        import("ft-block-basic.stl");
        cube(size=60, center=true);
    }
}

/**
 * Create Fischertechnik block.
 */
module ftBlock(
    NumberOfSegments = 1,
    Length = 15,
    TopConnector = "female",
    BottomConnector = "female",
    tolerance = 0.05,

    RotateX = 0,
    RotateY = 0,
    RotateZ = 0,

    segments = 100,
    borderDepth = 0.5,
    borderApply = "all",
    topCorrectionW = -0.5,
    topCorrectionD = -0.5,
    bottomCorrectionW = -0.5,
    bottomCorrectionD = -0.5) {

    
    if(NumberOfSegments < 1){NumberOfSegments = 1;}
    else if(NumberOfSegments > 10){NumberOfSegments = 10;}

    
    rotate([RotateX, RotateY, RotateZ]) {

        difference(){

            width = NumberOfSegments * 15;
            offsetY = -(width / 2) - 7.5;

            union() {
                if (TopConnector == "male") {

                    for(i = [1 : NumberOfSegments]){
                        popY = offsetY + i * 15;

                        translate([0, popY, 7.5]) {
                            ftConnectorMale();
                        }
                    }
                }
                roundedCube(size=[ 15, width, Length], radius=borderDepth/2, center=true, apply_to=borderApply);
                if (BottomConnector == "male") {

                    for(i = [1 : NumberOfSegments]){
                        popY = offsetY + i * 15;

                        translate([0, popY, -7.5]) {
                            rotate([180, 0, 0]){
                                ftConnectorMale();
                            }
                        }
                    }
                }
            }

            // START
            translate([0, -width/2 + 2 + tolerance/2, 0]) {
                union(){
                    cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                    translate([0, -2, 0]) {
                        cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                    }
                    // border
                    if (BottomConnector == "female") {
                        translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                    }
                    if (TopConnector == "female") {
                        translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                    }
                }
            }


            // END
            translate([0, width/2 - 2 - tolerance/2, 0]) {
                rotate([180, 0, 0]){
                    union(){
                        cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                        translate([0, -2, 0]) {
                            cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                        }
                        // border
                        if (BottomConnector == "female") {
                            translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                        }
                        if (TopConnector == "female") {
                            translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                        }
                    }
                }
            }
            

            // SIDE
            for(i = [1 : NumberOfSegments]){

                popX = 7.5 - 2 - tolerance / 2;

                // LEFT
                translate([-popX, -width /2  + 7.5, 0]) {
                    rotate([0, 0, -90]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                            translate([0, -2, 0]) {
                                cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                            }
                            // border
                            translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                            translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                        }
                    }
                }

                // RIGHT
                translate([popX, -width /2  + 7.5, 0]) {
                    rotate([0, 0, 90]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                            translate([0, -2, 0]) {
                                cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                            }
                            // border
                            translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                            translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                        }
                    }
                }

                // MULTI SEGMENTS
                if(i > 1){

                    popY = (width / 2) - i * 15 + 7.5;

                    // LEFT
                    translate([-popX, -popY, 0]) {
                        rotate([0, 0, -90]){
                            union(){
                                cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                                translate([0, -2, 0]) {
                                    cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                                }
                                // border
                                translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                                translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                            }
                        }
                    }


                    // RIGHT
                    translate([popX, -popY, 0]) {
                        rotate([0, 0, 90]){
                            union(){
                                cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                                translate([0, -2, 0]) {
                                    cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
                                }
                                // border
                                translate([0, 0, (Length / 2)])cylinder(r1=2 + tolerance / 2, r2=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                                translate([0, 0, -(Length / 2)])cylinder(r2=2 + tolerance / 2, r1=2 + borderDepth + tolerance / 2, h=borderDepth, center=true,$fn = segments);
                            }
                        }
                    }


                }


            }


            // TOP
            if(TopConnector == "female"){

                popY = (Length / 2) - 2 - tolerance / 2;

                translate([0, 0, popY]) {
                    rotate([90, 180, 0]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=width + 2, center=true,$fn = segments);
                            translate([0, -2 + topCorrectionD, 0]) {
                                cube(size=[3 + topCorrectionW + tolerance / 2, 3 + tolerance / 2, width + 2], center=true);
                            };
                            translate([0, -tolerance, -width / 2 + (4 + tolerance) / 2]){
                                cube(size=[4 + tolerance, 4 + tolerance, 4 + tolerance], center=true);
                            };
                            translate([0, -tolerance, width / 2 - (4 + tolerance) / 2]){
                                cube(size=[4 + tolerance, 4 + tolerance, 4 + tolerance], center=true);
                            };
                        }
                    }
                }
            }


            // BOTTOM
            if(BottomConnector == "female"){

                popY = (Length / 2) - 2 - tolerance / 2;

                translate([0, 0, -popY]) {
                    rotate([90, 0, 0]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=width + 2, center=true,$fn = segments);
                            translate([0, -2 + bottomCorrectionD, 0]) {
                                cube(size=[3 + bottomCorrectionW + tolerance / 2, 3 + tolerance / 2, width + 2], center=true);
                            };
                            translate([0, -tolerance, -width / 2 + (4 + tolerance) / 2]){
                                cube(size=[4 + tolerance, 4 + tolerance, 4 + tolerance], center=true);
                            };
                            translate([0, -tolerance, width / 2 - (4 + tolerance) / 2]){
                                cube(size=[4 + tolerance, 4 + tolerance, 4 + tolerance], center=true);
                            };
                        }
                    }
                }
            }

        }

    }
    
    

}// ftBlock()

module roundedCube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}//roundedCube