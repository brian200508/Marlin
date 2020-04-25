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
        dBlock=15 + 1; // block (max) diameter + some more around (adjust to Your printer)

        // Fischertechnik connector part
        difference() {
            dFti=4 + .8; // axis diameter 4mm + some space around
            gFtiW=3; // with of gap
            gFtiD=2; // depth of gap
            cube([dBlock, dBlock, ftiEndCapLength]);
            // axis
            translate([dBlock/2,dFti/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([dBlock/2,dBlock-dFti/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([dBlock-dFti/2,dBlock/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            translate([dFti/2,dBlock/2,0])cylinder(h=ftiEndCapLength, d=dFti);
            // space
            translate([dBlock/2-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiEndCapLength]);
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,0])cube([gFtiW, gFtiD, ftiEndCapLength]);
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiEndCapLength]);
            translate([0,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiEndCapLength]);
            // orthoganal axis at end
            translate([dBlock/2, dBlock, dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dFti);
            translate([dBlock/2-dFti/2, dBlock-dFti/2, 0])cube([dFti, dFti, dFti]);
            translate([dBlock/2-dFti/2, 0-dFti/2, 0])cube([dFti, dFti, dFti]);
            translate([dBlock/2+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
        }

        // square tube connector part
        translate([1, 1, ftiEndCapLength])difference() {
            hTubeConn=(ftiEndCapLength < 60) ? 30 : (ftiEndCapLength < 75 ? 45 : 60);
            dCarveOut=8; // carve out diameter
            oCarveOut=6; // carve out offset
            dConnector=12.5 + 1; // connector (max) diameter + some more around (adjust to Your printer)
            // corpus
            cube([dConnector, dConnector, hTubeConn]);
            // space
            translate([dConnector/2,dCarveOut/2-oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector/2,dConnector-dCarveOut/2+oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector-dCarveOut/2+oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dCarveOut/2-oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
        }

        // square tube connector part
        rotate([90, 0, 90])translate([1, 1, ftiEndCapLength])difference() {
            hTubeConn=(ftiEndCapLength < 60) ? 30 : (ftiEndCapLength < 75 ? 45 : 60);
            dCarveOut=8; // carve out diameter
            oCarveOut=6; // carve out offset
            dConnector=12.5 + 1; // connector (max) diameter + some more around (adjust to Your printer)
            // corpus
            cube([dConnector, dConnector, hTubeConn]);
            // space
            translate([dConnector/2,dCarveOut/2-oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector/2,dConnector-dCarveOut/2+oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector-dCarveOut/2+oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dCarveOut/2-oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
        }

        // square tube connector part
        translate([dBlock, 0, 0])rotate([90, 0, 180])translate([1, 1, ftiEndCapLength])difference() {
            hTubeConn=(ftiEndCapLength < 60) ? 30 : (ftiEndCapLength < 75 ? 45 : 60);
            dCarveOut=8; // carve out diameter
            oCarveOut=6; // carve out offset
            dConnector=12.5 + 1; // connector (max) diameter + some more around (adjust to Your printer)
            // corpus
            cube([dConnector, dConnector, hTubeConn]);
            // space
            translate([dConnector/2,dCarveOut/2-oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector/2,dConnector-dCarveOut/2+oCarveOut,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dConnector-dCarveOut/2+oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
            translate([dCarveOut/2-oCarveOut,dConnector/2,0])cylinder(h=hTubeConn, d=dCarveOut);
        }
    }
}

ftiSpuareTubeAdapter15x15(EndCapLength);
