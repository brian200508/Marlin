/**
 * Create an adapter for connecting a 15x15 square tube to Fischertechnik.
 *
 * @author Brian Schroeder
 * @since 21.04.2020
 */

/* [End Cap length] */
// Fischertechnik compatible end cap length in millimeters
EndCapLength=15; // [15, 30, 45, 60, 75, 90]

/*
 * Create the adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftiEndCapLength end cap length in millimeters (default is 15)
 */
module ftiSpuareTubeAdapter15x15(ftiEndCapLength=15) {

    union() {

        // Fischertechnik connector part
        difference() {
            dFti=4; // axis diameter
            gFtiW=2.5; // with of gap
            gFtiD=2; // depth of gap
            cube([15, 15, ftiEndCapLength]);
            // axis
            translate([7.5,dFti/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([7.5,15-dFti/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([15-dFti/2,7.5,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([dFti/2,7.5,0])cylinder(h=ftiEndCapLength, d=dFti);
            // space
            translate([7.5-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiEndCapLength]);
            translate([7.5-gFtiW/2,15-gFtiD,0])cube([gFtiD, gFtiW, ftiEndCapLength]);
            translate([15-dFti/2,7.5-gFtiW/2,0])cube([gFtiD, gFtiW, ftiEndCapLength]);
            translate([0,7.5-gFtiW/2,0])cube([gFtiD, gFtiW, ftiEndCapLength]);
            // orthoganal axis at end
            translate([7.5, 15, dFti/2])rotate([90, 0, 0])cylinder(h=15, d=dFti);
            translate([7.5-dFti/2, 15-dFti/2, 0])cube([dFti, dFti, dFti]);
            translate([7.5-dFti/2, 0-dFti/2, 0])cube([dFti, dFti, dFti]);
            translate([7.5+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, 15]);
        }

        // square tube connector part
        translate([1, 1, ftiEndCapLength])difference() {
            hTubeConn=(ftiEndCapLength < 60) ? 30 : (ftiEndCapLength < 75 ? 45 : 60);
            dCarveOut=8; // carve out diameter
            oCarveOut=6; // carve out offset
            // corpus
            cube([13, 13, hTubeConn]);
            // space
            translate([6.5,dCarveOut/2-oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([6.5,13-dCarveOut/2+oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([13-dCarveOut/2+oCarveOut,6.5,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dCarveOut/2-oCarveOut,6.5,0])cylinder(h=hTubeConn, d=dCarveOut);
        }
    }
}

ftiSpuareTubeAdapter15x15(EndCapLength);
