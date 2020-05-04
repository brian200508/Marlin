/**
 * Create a Fischertechnik compatible building block with hole for axis.
 *
 * @author Brian Schroeder
 * @since 21.04.2020
 */

/* [Block length] */
// Building block length in millimeters
BlockLength=90; // [30, 60, 90]

/* [Has Hole in center] */
// Building block has holes for 4mm axis in the center
HasHole=true; // [false, true]

/*
 * Create the Fischertechnik compatible building block with length passed by the argument.
 *
 * @param ftiBlockLength block length in millimeters (default is 90)
 * @param ftiHasHole block has hole for 4mm axis in the center if true (default is true)
 */
module ftiBuildingBlock15x15(ftiBlockLength=90, ftiHasHole=true) {

    difference() {
        dFti=4 + .8; // axis diameter 4mm + some space around
        dBlock=15 + 1; // block (max) diameter + some more around (adjust to Your printer)
        gFtiW=3; // with of gap
        gFtiD=2; // depth of gap
        cube([dBlock, dBlock, ftiBlockLength]);
        if (ftiHasHole) {
            wAroundHole=5; // keep 5mm around hole
            lAxis=ftiBlockLength/2 - wAroundHole;

            // axis before hole
            translate([dBlock/2,dFti/2,0])cylinder(h=lAxis, d=dFti);
            translate([dBlock/2,dBlock-dFti/2,0])cylinder(h=lAxis, d=dFti);
            translate([dBlock-dFti/2,dBlock/2,0])cylinder(h=lAxis, d=dFti);
            translate([dFti/2,dBlock/2,0])cylinder(h=lAxis, d=dFti);
            // space before hole
            translate([dBlock/2-gFtiW/2,0,0])cube([gFtiW, gFtiD, lAxis]);
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,0])cube([gFtiW, gFtiD, lAxis]);
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, lAxis]);
            translate([0,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, lAxis]);

            // axis after hole
            translate([dBlock/2,dFti/2,ftiBlockLength - lAxis])cylinder(h=lAxis, d=dFti);
            translate([dBlock/2,dBlock-dFti/2,ftiBlockLength - lAxis])cylinder(h=lAxis, d=dFti);
            translate([dBlock-dFti/2,dBlock/2,ftiBlockLength -  lAxis])cylinder(h=lAxis, d=dFti);
            translate([dFti/2,dBlock/2,ftiBlockLength - lAxis])cylinder(h=lAxis, d=dFti);
            // space after hole
            translate([dBlock/2-gFtiW/2,0,ftiBlockLength - lAxis])cube([gFtiW, gFtiD, lAxis]);
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,ftiBlockLength - lAxis])cube([gFtiW, gFtiD, lAxis]);
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,ftiBlockLength - lAxis])cube([gFtiD, gFtiW, lAxis]);
            translate([0,dBlock/2-gFtiW/2,ftiBlockLength - lAxis])cube([gFtiD, gFtiW, lAxis]);
        } else {
            // axis
            translate([dBlock/2,dFti/2,0])cylinder(h=ftiBlockLength, d=dFti);
            translate([dBlock/2,dBlock-dFti/2,0])cylinder(h=ftiBlockLength, d=dFti);
            translate([dBlock-dFti/2,dBlock/2,0])cylinder(h=ftiBlockLength, d=dFti);
            translate([dFti/2,dBlock/2,0])cylinder(h=ftiBlockLength, d=dFti);
            // space
            translate([dBlock/2-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiBlockLength]);
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,0])cube([gFtiW, gFtiD, ftiBlockLength]);
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
            translate([0,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
        }
        // orthoganal axis at end
        translate([dBlock/2, dBlock, dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dFti);
        translate([dBlock/2-dFti/2, dBlock-dFti/2, 0])cube([dFti, dFti, dFti]);
        translate([dBlock/2-dFti/2, 0-dFti/2, 0])cube([dFti, dFti, dFti]);
        translate([dBlock/2+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
        // orthoganal axis at other end
        translate([dBlock/2, dBlock, ftiBlockLength-dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dFti);
        translate([dBlock/2-dFti/2, dBlock-dFti/2, ftiBlockLength-dFti])cube([dFti, dFti, dFti]);
        translate([dBlock/2-dFti/2, 0-dFti/2, ftiBlockLength-dFti])cube([dFti, dFti, dFti]);
        translate([dBlock/2+gFtiW/2, 0, ftiBlockLength-gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
        // hole
        if (ftiHasHole) {
            translate([dBlock/2, dBlock, ftiBlockLength/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dFti);
            translate([0, dBlock/2, ftiBlockLength/2])rotate([90, 0, 90])cylinder(h=dBlock, d=dFti);
        }
    }
}

ftiBuildingBlock15x15(BlockLength, HasHole);
