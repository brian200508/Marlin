/*
 * Fischertechnik compatible case for RepRapDiscount
 * Full Graphic Smart Controller.
 */

labelHeader = "Full Graphic Smart Controller"; // header
labelFooter = "(c) 2021 BRSC";

w = 105; // width of case
h = 45; // height of case
c = 30; // height of Fischertechnik connectors
d = 105; // depth of case

t = 3; // height of top
b = h - t; // height of bottom
tsh = 3; // outer height of terminal for screw
tss = 7; // inner height of terminal for screw

wb = 94; // width of board
db = 90; // depth of board
hb = 30; // height of board
hbb = hb - 15 + tsh; // board base bottom

tso = 6.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
//tse = 8.0/2; // radius of edge for screw top
//hse = 2.0; // height of edge for screw top
dtx = 2; // depth of text labels
stx = 4; // size of text labels
o = 0.02; // overlap for better preview rendering

fullGraphicSmartControllerCaseTop();

module fullGraphicSmartControllerCaseTop() {

    td = 1.0; // tolerance for display slot
    xd = 7.5 - td; // x-offset of display (measured from board x=0)
    yd = 30 - td; // y-offset of display (measured from board y=0)
    wd = 77.5 + 2*td; // width of display (together)
    hd = 7.5; // height of display
    dd = 50 + 2*td; // depth of display (measured from top)
    xc = 82.5; // x-offset of controller hole (measured from board x=0)
    yc = 10; // y-offset of controller hole (measured from board y=0)
    hc = b; // height of controller hole (measured from board bottom)
    dc = 8 + td; // diameter of controller hole
    xu = 65; // x-offset of buzzer hole (measured from board x=0)
    yu = 10; // y-offset of buzzer hole (measured from board y=0)
    hu = b; // height of buzzer hole (measured from board bottom)
    du = 2 + td; // diameter of buzzer hole
    xr = 50; // x-offset of reset button hole (measured from board x=0)
    yr = 10; // y-offset of reset button hole (measured from board y=0)
    hr = b; // height of reset button hole (measured from board bottom)
    dr = 4 + td; // diameter of reset button hole

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

            // display slot, controller, buzzer, reset button
            translate([w0 + xd, d0 + yd, 0 - o])cube([wd, dd, hd + 2*o], center=false);
            translate([w0 + xc, d0 + yc, 0 - o])cylinder(r=dc/2, h=hc + 2*o, center=false);
            translate([w0 + xu, d0 + yu, 0 - o])cylinder(r=du/2, h=hu + 2*o, center=false);
            translate([w0 + xr, d0 + yr, 0 - o])cylinder(r=dr/2, h=hr + 2*o, center=false);
            // labels
            d2 = 0;
            translate([w0 + 4, d - 7, t - dtx + o])linear_extrude(dtx + o)text(labelHeader, size=stx);
            translate([w0 + 4, 0 + 4, t - dtx + o])linear_extrude(dtx + o)text(labelFooter, size=stx-1);
            translate([w0 + xr - dr - 3, d0 + d2, t - dtx + o])linear_extrude(dtx + o)text("STOP", size=stx);
            translate([w0 + xu - du - 4.5, d0 + d2, t - dtx + o])linear_extrude(dtx + o)text("BUZZ.", size=stx);
            translate([w0 + xc - dc/2 - 3, d0 + d2, t - dtx + o])linear_extrude(dtx + o)text("CTRL.", size=stx);

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
