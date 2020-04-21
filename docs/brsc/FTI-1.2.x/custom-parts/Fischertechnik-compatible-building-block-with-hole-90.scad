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
// Building block has hole for 4mm axis in the center
HasHole=true; // [false, true]

/*
 * Create the Fischertechnik compatible building block with length passed by the argument.
 *
 * @param ftiBlockLength block length in millimeters (default is 90)
 * @param ftiHasHole block has hole for 4mm axis in the center if true (default is true)
 */
module ftiBuildingBlock15x15(ftiBlockLength=90, ftiHasHole=true) {

    difference() {
        dFti=4; // axis diameter
        gFtiW=2.5; // with of gap
        gFtiD=2; // depth of gap
        cube([15, 15, ftiBlockLength]);
        // axis
        translate([7.5,dFti/2,0])cylinder(h=ftiBlockLength, d=dFti);
        translate([7.5,15-dFti/2,0])cylinder(h=ftiBlockLength, d=dFti);
        translate([15-dFti/2,7.5,0])cylinder(h=ftiBlockLength, d=dFti);
        translate([dFti/2,7.5,0])cylinder(h=ftiBlockLength, d=dFti);
        // space
        translate([7.5-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiBlockLength]);
        translate([7.5-gFtiW/2,15-gFtiD,0])cube([gFtiD, gFtiW, ftiBlockLength]);
        translate([15-dFti/2,7.5-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
        translate([0,7.5-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
        // orthoganal axis at end
        translate([7.5, 15, dFti/2])rotate([90, 0, 0])cylinder(h=15, d=dFti);
        translate([7.5-dFti/2, 15-dFti/2, 0])cube([dFti, dFti, dFti]);
        translate([7.5-dFti/2, 0-dFti/2, 0])cube([dFti, dFti, dFti]);
        translate([7.5+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, 15]);
        // orthoganal axis at other end
        translate([7.5, 15, ftiBlockLength-dFti/2])rotate([90, 0, 0])cylinder(h=15, d=dFti);
        translate([7.5-dFti/2, 15-dFti/2, ftiBlockLength-dFti])cube([dFti, dFti, dFti]);
        translate([7.5-dFti/2, 0-dFti/2, ftiBlockLength-dFti])cube([dFti, dFti, dFti]);
        translate([7.5+gFtiW/2, 0, ftiBlockLength-gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, 15]);
        // hole
        if (ftiHasHole) {
            translate([7.5, 15, ftiBlockLength/2])rotate([90, 0, 0])cylinder(h=15, d=dFti);
        }
    }
}

ftiBuildingBlock15x15(BlockLength, HasHole);
