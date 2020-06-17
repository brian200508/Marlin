/**
 * Remix of http://www.thingiverse.com/thing:3574034
 * Fischertechnik blocks generator openscad by grumson is licensed under the Creative Commons - Attribution license.
 * http://creativecommons.org/licenses/by/3.0/
 */


NumberOfSegments = 1;
Length = 15;
TopConnector = true;
BottomConnector = true;
tolerance = 0.05;

RotateX = 0;
RotateY = 0;
RotateZ = 0;

segments = 100;

Main();



// MAIN
module Main() {

    Settings();
    Block();

}// Main()



// SETTINGS
module Settings() {
    
    if(NumberOfSegments < 1){NumberOfSegments = 1;}
    else if(NumberOfSegments > 10){NumberOfSegments = 10;}

}// Settings()



module Block() {
    
    rotate([RotateX, RotateY, RotateZ]) {

        difference(){

            width = NumberOfSegments * 15;

            cube(size=[ 15, width, Length], center=true);


            // START
            translate([0, -width/2 + 2 + tolerance/2, 0]) {
                union(){
                    cylinder(r=2 + tolerance / 2, h=Length + 1, center=true,$fn = segments);
                    translate([0, -2, 0]) {
                        cube(size=[3 + tolerance / 2, 3 + tolerance / 2, Length + 1], center=true);
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
                            }
                        }
                    }


                }


            }


            // TOP
            if(TopConnector){

                popY = (Length / 2) - 2 - tolerance / 2;

                translate([0, 0, popY]) {
                    rotate([90, 180, 0]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=width + 2, center=true,$fn = segments);
                            translate([0, -2, 0]) {
                                cube(size=[3 + tolerance / 2, 3 + tolerance / 2, width + 2], center=true);
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
            if(BottomConnector){

                popY = (Length / 2) - 2 - tolerance / 2;

                translate([0, 0, -popY]) {
                    rotate([90, 0, 0]){
                        union(){
                            cylinder(r=2 + tolerance / 2, h=width + 2, center=true,$fn = segments);
                            translate([0, -2, 0]) {
                                cube(size=[3 + tolerance / 2, 3 + tolerance / 2, width + 2], center=true);
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
    
    

}// Block()
