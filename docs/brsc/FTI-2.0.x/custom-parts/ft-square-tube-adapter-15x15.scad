/**
 * Create an adapter for connecting a 15x15 square tube to Fischertechnik.
 *
 * @author Brian Schroeder
 * @since 18.06.2020
 */

include <ft-block.scad>;

//ftSpuareTubeAdapter15x15(15);


/*
 * Create the adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftEndCapLength end cap length in millimeters (default is 15)
 */
module ftSpuareTubeAdapter15x15(ftEndCapLength=15) {

    dBlock=15;
    hTubeConn=(ftEndCapLength < 60) ? 30 : (ftEndCapLength < 75 ? 45 : 60);
    dCarveOut=8; // carve out diameter
    oCarveOut=6; // carve out offset
    dBorder=1; // the square tube border diameter
    dConnector=dBlock-2*dBorder; // connector (max) diameter

    translate([0, 0, ftEndCapLength/2])union() {

        // Fischertechnik connector part
        ftBlock(Length=ftEndCapLength, TopConnector = false);

        // square tube connector part
        translate([0, 0, ftEndCapLength])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }
    }
}// ftSpuareTubeAdapter15x15
