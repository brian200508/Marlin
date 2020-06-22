/**
 * Create an adapter for connecting a 15x15 square tube to Fischertechnik.
 *
 * @author Brian Schroeder
 * @since 18.06.2020
 */

include <ft-block.scad>;

//ftSpuareTubeAdapter15x15(15);

/**
 * Create Fischertechnik block with aligned Z-coordinate.
 */
module ftBlockAlignedZ(
    NumberOfSegments = 1,
    Length = 15,
    TopConnector = "female",
    BottomConnector = "female",
    tolerance = 0.05,

    RotateX = 0,
    RotateY = 0,
    RotateZ = 0,

    segments = 100,
    borderDepth = 0.4,
    borderApply = "all") {

    offsetZ1 = (TopConnector == "male") ? 4 : 0;
    offsetZ2 = (BottomConnector == "male") ? 4 : 0;
    offsetZ = offsetZ1 + offsetZ2;

    translate([ 0, 0, offsetZ + Length/2])ftBlock(
        NumberOfSegments = NumberOfSegments,
        Length = Length,
        TopConnector = TopConnector,
        BottomConnector = BottomConnector,
        tolerance = tolerance,

        RotateX = RotateX,
        RotateY = RotateY,
        RotateZ = RotateZ,

        segments = segments,
        borderDepth = borderDepth,
        borderApply = borderApply
    );

}// ftBlockAligned


/*
 * Create the adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftEndCapLength end cap length in millimeters (default is 15)
 */
module ftSpuareTubeAdapter15x15(ftEndCapLength=15) {

    dBlock=15;
    hTubeConn=(ftEndCapLength < 60) ? 30 : (ftEndCapLength < 75 ? 45 : 60);
    hOffsetTC=(ftEndCapLength < hTubeConn) ? ftEndCapLength : hTubeConn;
    dCarveOut=8; // carve out diameter
    oCarveOut=6; // carve out offset
    dBorder=1; // the square tube border diameter
    dConnector=dBlock-2*dBorder; // connector (max) diameter

    translate([0, 0, ftEndCapLength/2])union() {

        // Fischertechnik connector part
        ftBlock(Length=ftEndCapLength, TopConnector = false);

        // square tube connector part
        translate([0, 0, hOffsetTC])difference() {
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

/*
 * Create a double ended adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftEndCapLength end cap length in millimeters (default is 15)
 */
module ftSpuareTubeAdapter15x15de(ftEndCapLength=15) {

    dBlock=15;
    hTubeConn=(ftEndCapLength < 60) ? 30 : (ftEndCapLength < 75 ? 45 : 60);
    hOffsetTC=(ftEndCapLength < hTubeConn) ? ftEndCapLength : hTubeConn;
    dCarveOut=8; // carve out diameter
    oCarveOut=6; // carve out offset
    dBorder=1; // the square tube border diameter
    dConnector=dBlock-2*dBorder; // connector (max) diameter

    translate([0, 0, hOffsetTC + ftEndCapLength/2])union() {

        // square tube connector part
        translate([0, 0, -hOffsetTC])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }

        // Fischertechnik connector part
        ftBlock(Length=ftEndCapLength);

        // square tube connector part
        translate([0, 0, hOffsetTC])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }
    }
}// ftSpuareTubeAdapter15x15de

/*
 * Create a double ended L-style adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftEndCapLength end cap length in millimeters (default is 15)
 */
module ftSpuareTubeAdapter15x15dl(ftEndCapLength=15) {

    dBlock=15;
    hTubeConn=(ftEndCapLength < 60) ? 30 : (ftEndCapLength < 75 ? 45 : 60);
    hOffsetTC=(ftEndCapLength < hTubeConn) ? ftEndCapLength : hTubeConn;
    dCarveOut=8; // carve out diameter
    oCarveOut=6; // carve out offset
    dBorder=1; // the square tube border diameter
    dConnector=dBlock-2*dBorder; // connector (max) diameter

    translate([0, 0, ftEndCapLength/2])union() {

        // square tube connector part
        rotate([0, 90, 0])translate([0, 0, -hOffsetTC - 7.5])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }

        // Fischertechnik connector part
        ftBlock(Length=ftEndCapLength, TopConnector="none", RotateZ=90);

        // square tube connector part
        translate([0, 0, hOffsetTC + 7.5])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }
    }
}// ftSpuareTubeAdapter15x15dl

/*
 * Create the adapter with Fischertechnik compatible end cap length passed by the argument.
 *
 * @param ftEndCapLength end cap length in millimeters (default is 15)
 */
module ftSpuareTubeAdapter15x15c30(ftEndCapLength=15) {

    dBlock=15;
    hTubeConn=25;
    hOffsetTC=ftEndCapLength/2 + 10;
    dCarveOut=8; // carve out diameter
    oCarveOut=6; // carve out offset
    dBorder=1; // the square tube border diameter
    dConnector=dBlock-2*dBorder; // connector (max) diameter

    translate([0, 0, ftEndCapLength/2])union() {

        // Fischertechnik connector part
        ftBlock(Length=ftEndCapLength, TopConnector = false);

        // square tube connector part
        translate([0, 0, hOffsetTC])difference() {
            // corpus
            cube([dConnector, dConnector, hTubeConn], center=true);
            // space
            translate([dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([-dConnector/2, 0, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
            translate([0, -dConnector/2, 0])cylinder(h=hTubeConn, d=dCarveOut, center=true);
        }
    }
}// ftSpuareTubeAdapter15x15c30

module ftSquareTubeAdapter15x15_L(
    ftEndCapLength = 30,
    ftBasementLength = 15,
    ftNumberOfSegments = 2) {

    union() {

        translate([0, (ftNumberOfSegments - 1) * 15 / 2, 0])ftBlockAlignedZ(
            Length = ftBasementLength,
            NumberOfSegments = ftNumberOfSegments,
            borderApply = "all");
        ftSpuareTubeAdapter15x15(ftEndCapLength);
        for (i = [0 : ftNumberOfSegments - 1]) {
            if (i == ftNumberOfSegments) {
                translate([i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "xmax");
            } else {
                translate([i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "x");
            }
        }
    };
}// ftSquareTubeAdapter15x15_L

module ftSquareTubeAdapter15x15_Lc30(
    ftEndCapLength = 30,
    ftBasementLength = 15,
    ftNumberOfSegments = 2) {

    union() {

        translate([0, (ftNumberOfSegments - 1) * 15 / 2, 0])ftBlockAlignedZ(
            Length = ftBasementLength,
            NumberOfSegments = ftNumberOfSegments,
            borderApply = "all");
        ftSpuareTubeAdapter15x15c30(ftEndCapLength);
        for (i = [0 : ftNumberOfSegments - 1]) {
            if (i == ftNumberOfSegments) {
                translate([i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "xmax");
            } else {
                translate([i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "x");
            }
        }
    };
}// ftSquareTubeAdapter15x15_Lc30

module ftSquareTubeAdapter15x15_R(
    ftEndCapLength = 30,
    ftBasementLength = 15,
    ftNumberOfSegments = 2) {

    union() {

        translate([0, (ftNumberOfSegments - 1) * 15 / 2, 0])ftBlockAlignedZ(
            Length = ftBasementLength,
            NumberOfSegments = ftNumberOfSegments,
            borderApply = "all");
        ftSpuareTubeAdapter15x15c30(ftEndCapLength);
        for (i = [0 : ftNumberOfSegments - 1]) {
            if (i == ftNumberOfSegments) {
                translate([-i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "xmin");
            } else {
                translate([-i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "x");
            }
        }
    };
}// ftSquareTubeAdapter15x15_R

module ftSquareTubeAdapter15x15_Rc30(
    ftEndCapLength = 30,
    ftBasementLength = 15,
    ftNumberOfSegments = 2) {

    union() {

        translate([0, (ftNumberOfSegments - 1) * 15 / 2, 0])ftBlockAlignedZ(
            Length = ftBasementLength,
            NumberOfSegments = ftNumberOfSegments,
            borderApply = "all");
        ftSpuareTubeAdapter15x15c30(ftEndCapLength);
        for (i = [0 : ftNumberOfSegments - 1]) {
            if (i == ftNumberOfSegments) {
                translate([-i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "xmin");
            } else {
                translate([-i * 15, 0, 0])ftBlockAlignedZ(Length = ftBasementLength, borderApply = "x");
            }
        }
    };
}// ftSquareTubeAdapter15x15_Rc30
