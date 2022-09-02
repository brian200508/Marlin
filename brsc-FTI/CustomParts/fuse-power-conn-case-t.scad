/*
 * Fischertechnik compatible case for RepRapDiscount
 * Full Graphic Smart Controller.
 */

labelHeader = "Power Connector"; // header
labelFooter = "(c) 2021 BRSC";

w = 90; // width of case
h = 45; // height of case
c = 30; // height of Fischertechnik connectors
d = 45; // depth of case

t = 3; // height of top
b = h - t; // height of bottom
tsh = 3; // outer height of terminal for screw
tss = 7; // inner height of terminal for screw

wb = 75; // width of board
db = 15; // depth of board
hb = 30; // height of board
hbb = hb - 5 + tsh; // board base bottom

tso = 6.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
//tse = 8.0/2; // radius of edge for screw top
//hse = 2.0; // height of edge for screw top
dtx = 2; // depth of text labels
stx = 4; // size of text labels
o = 0.02; // overlap for better preview rendering

fusePowerConnectorCaseTop();

module fusePowerConnectorCaseTop() {


    union() {

        w0 = (w - wb)/2;
        d0 = (d - db)/2;
        tce = 3; // edge lower
        tcd = 15; // depth of hole for screw

        difference() {

            union() {
                // top cover
                cube([w, d, t], center=false);

                // terminals for screws - cover
                translate([w - 5, d - 5, 0 - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([0 + 5, d - 5, 0 - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([w - 5, 0 + 5, 0 - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([0 + 5, 0 + 5, 0 - tce])cylinder(r=tso, h=tce + o, center=false);
            }
            // remove overlapping part of srew terminal cylinder
            translate([-5, -5, 0 - tce - o - 5])cube(size=[w + 10, 5, 10 + tce + o], center=false);
            translate([-5, d, 0 - tce - o - 5])cube(size=[w + 10, 5, 10 + tce + o], center=false);
            translate([-5, -5, 0 - tce - o - 5])cube(size=[5, d + 10, 10 + tce + o], center=false);
            translate([w, -5, 0 - tce - o - 5])cube(size=[5, d + 10, 10 + tce + o], center=false);

            // labels
            d2 = 1;
            translate([w0 + 4, d - 7, t - dtx + o])linear_extrude(dtx + o)text(labelHeader, size=stx);
            translate([w0 + 4, 0 + 3, t - dtx + o])linear_extrude(dtx + o)text(labelFooter, size=stx-1);

            // terminals for screws - cover
            tch = tce + tcd;
            /*union() {
                translate([w - 5, d - 5, t - hse])cylinder(r=tse, h=hse + o, center=false);
                translate([0 + 5, d - 5, t - hse])cylinder(r=tse, h=hse + o, center=false);
                translate([w - 5, 0 + 5, t - hse])cylinder(r=tse, h=hse + o, center=false);
                translate([0 + 5, 0 + 5, t - hse])cylinder(r=tse, h=hse + o, center=false);
            }*/
            union() {
                translate([w - 5, d - 5, t - tch])cylinder(r=tst, h=tch + o, center=false);
                translate([0 + 5, d - 5, t - tch])cylinder(r=tst, h=tch + o, center=false);
                translate([w - 5, 0 + 5, t - tch])cylinder(r=tst, h=tch + o, center=false);
                translate([0 + 5, 0 + 5, t - tch])cylinder(r=tst, h=tch + o, center=false);
            }
        }
    }
}
