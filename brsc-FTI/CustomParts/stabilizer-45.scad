/**
 * Create an adapter for stabilizing orthogonal Fischertechnik connections.
 *
 * @author Brian Schroeder
 * @since 23.04.2021
 */

/* [Length] */
// Length in millimeters
Length=45; // [15, 30, 45, 60, 75, 90]

dBlock=15; // block (max) diameter
dFti=4; // axis diameter 4mm
tFti=0.2; // some space around
gFtiW=3; // with of gap
gFtiD=2; // depth of gap
dCyl=dFti + tFti;

/*
 * Create the stabilizer with length passed by the argument.
 *
 * @param ftiLength length in millimeters (default is 15)
 */
module ftiStabilizer(ftiLength=15) {

    difference() {
        d = 0.02; // for better preview rendering

        // corpus
        translate([0, 0, 0])cube([15, ftiLength, ftiLength]);
        translate([-d, 0, 0])rotate([45, 0, 0])cube([15 + 2*d, ftiLength*2, ftiLength*2]);

        // connectors
        translate([0, ftiLength-15, 0])ftiConnectors(ftiLength, ftiFront=false, ftiBottom=false, ftiTop=false, ftiLeft=false, ftiRight=false);
        //translate([0, ftiLength-15, 15+5])ftiConnectors(ftiLength, ftiFront=false, ftiBottom=false, ftiTop=false, ftiLeft=true, ftiRight=true);
        translate([0, ftiLength, 0])rotate([90, 0, 0])ftiConnectors(ftiLength, ftiBack=false, ftiBottom=false, ftiTop=false, ftiLeft=true, ftiRight=true);
        translate([0, 0, 0])rotate([-45, 0, 0])ftiConnectors(ftiLength*2, ftiBack=false, ftiBottom=false, ftiTop=false, ftiLeft=false, ftiRight=false);
        // ends
        translate([dBlock/2 - dCyl/2, 0, 0])cube([dCyl, dCyl, dCyl]);
        translate([dBlock/2 - dCyl/2, ftiLength - dCyl, 0])cube([dCyl, dCyl, dCyl]);
        translate([dBlock/2 - dCyl/2, ftiLength - dCyl, ftiLength - dCyl])cube([dCyl, dCyl, dCyl]);
    }
}

/*
 * Create Fischertechnik compatible connectors with length passed by the argument.
 *
 * @param ftiLength length in millimeters (default is 15)
 */
module ftiConnectors(ftiLength=15,ftiFront=true,ftiBack=true,ftiLeft=true,ftiRight=true,ftiBottom=true,ftiTop=true) {

    // Fischertechnik connector
    union() {
        //cube([dBlock, dBlock, ftiLength]);
        // axis
        if (ftiFront) {
            translate([dBlock/2,dFti/2,0])cylinder(h=ftiLength, d=dCyl);
        }
        if (ftiBack) {
            translate([dBlock/2,dBlock-dFti/2,0])cylinder(h=ftiLength, d=dCyl);
        }
        if (ftiRight) {
            translate([dBlock-dFti/2,dBlock/2,0])cylinder(h=ftiLength, d=dCyl);
        }
        if (ftiLeft) {
            translate([dFti/2,dBlock/2,0])cylinder(h=ftiLength, d=dCyl);
        }
        // space
        if (ftiFront) {
            translate([dBlock/2-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiLength]);
        }
        if (ftiBack) {
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,0])cube([gFtiW, gFtiD, ftiLength]);
        }
        if (ftiRight) {
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiLength]);
        }
        if (ftiLeft) {
            translate([0,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiLength]);
        }
        if (ftiBottom) {
        // orthoganal axis at bottom
            translate([dBlock/2, dBlock, dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dCyl);
            translate([dBlock/2-dFti/2, dBlock-dFti/2, 0])cube([dCyl, dCyl, dCyl]);
            translate([dBlock/2-dFti/2, 0-dFti/2, 0])cube([dCyl, dCyl, dCyl]);
            translate([dBlock/2+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
        }
        if (ftiTop) {
        // orthoganal axis at top
        translate([dBlock/2, dBlock, ftiLength-dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dCyl);
        translate([dBlock/2-dFti/2, dBlock-dFti/2, ftiLength-dCyl])cube([dCyl, dCyl, dCyl]);
        translate([dBlock/2-dFti/2, 0-dFti/2, ftiLength-dCyl])cube([dCyl, dCyl, dCyl]);
        translate([dBlock/2+gFtiW/2, 0, ftiLength-dFti/2-gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
        }
    }
}

translate([0, sqrt(2*Length*Length), 0])rotate([135, 0, 0])ftiStabilizer(Length);
//ftiStabilizer(Length);
