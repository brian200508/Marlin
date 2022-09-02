/*
 * Fischertechnik compatible case for RepRapDiscount
 * Full Graphic Smart Controller.
 */

bottomConnectors = false; // Fischertechnik compatible connectors bottom if true

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

tso = 7.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
tse = 8.0/2; // radius of edge for screw top
hse = 2.0; // height of edge for screw top
dtx = 1; // depth of text labels
stx = 3; // size of text labels
o = 0.02; // overlap for better preview rendering

fullGraphicSmartControllerCaseBottom();

module fullGraphicSmartControllerCaseBottom() {

    os = 40; // y-offset of SD card slot (measured from board y=0)
    ws = 30; // width of SD card slot
    ds = 40; // depth of SD card slot (measured from outer border)
    hs = 5; // height of SD card slot
    wsf = 40; // width of SD card slot frame
    dsf = 4.25; // depth of SD card slot frame (measured from outer border)
    hsf = 20; // height of SD card slot frame
    xc = 20; // x-offset of connectors (measured from board x=0)
    yc = 70; // y-offset of connectors (measured from board y=0)
    wc = wb - 2*xc; // width of connectors (together)
    hc = 15; // height of connectors (measured from board bottom)
    dc = 20; // depth of connectors
    wk = wb - 2*xc; // width of cable slot (together)
    hk = b; // height of cable slot (measured from board bottom)
    dk = 10; // depth of cable slot
    xk = 20; // x-offset of cable slot (measured from board x=0)
    yk = yc + (dc - dk); // y-offset of cable slot (measured from board y=0)
    wo = wb - 2*xc; // width of cable outlet (together)
    ho = 5; // height of cable outlet (measured from board bottom)
    do = 15; // depth of cable outlet
    xo = 20; // x-offset of cable outlet (measured from board x=0)
    yo = yk; // y-offset of cable outlet (measured from board y=0)

    tsg = hbb - tsh; // gap between top and screw terminal

    union() {

        w0 = (w - wb)/2;
        d0 = (d - db)/2;
        difference() {

            union() {
            
                // base of case with FT connectors
                dbo = 5; // depth of border
                translate([0, 0, c - 5])cube([w, d, 5 + (b-c)], center=false);
                if (bottomConnectors) {
                    translate([dbo, dbo, dbo])cube([w-2*dbo, d-2*dbo, b-dbo], center=false);
                } else {
                    translate([dbo, dbo, 0])cube([w-2*dbo, d-2*dbo, b], center=false);
                }
                for (i=[0:w/15 - 1]) {
                    for (j=[0:d/15 - 1]) {
                        translate([i*15, j*15, 0])ftiBlock15x15(b);
                        if (i > 0) {
                            translate([i*15, j*15, 0])cube(size=[5, 15, b], center=false);
                        }
                        if (i < (w/15 - 1)) {
                            translate([i*15 + 10, j*15, 0])cube(size=[5, 15, b], center=false);
                        }
                    }
                }
            }

            translate([w0, d0, b - hbb])cube([wb, db, hbb + o], center=false);

            // SD card slot
            translate([0 - o, d0 + os, b - hbb])cube([ds + o, ws, hs + o], center=false);
            translate([0 - o, d0 + os - (wsf - ws)/2, b - hbb - (hsf - hs)/2])cube([dsf + o, wsf, hsf + o], center=false);
            translate([w0 - o, d0 + os + wsf/2 + stx, b - hbb - stx - 2])rotate([90, 0, -90])linear_extrude(dtx + 1)text("SDCARD", size=stx);

            // connectors and cable slot
            translate([w0 + xc, d0 + yc, b - hbb - hc + o])cube([wc, dc, hc + o], center=false);
            translate([w0 + xk, d0 + yk, b - hbb - hk + o])cube([wk, dk, hk + o], center=false);
            translate([w0 + xo, d0 + yo, 0])cube([wo, do, ho + o], center=false);

            // terminals for screws - cover
            tce = 3; // edge lower
            tcd = 15; // depth of hole for screw
            union() {
                translate([w - 5, d - 5, b - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([0 + 5, d - 5, b - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([w - 5, 0 + 5, b - tce])cylinder(r=tso, h=tce + o, center=false);
                translate([0 + 5, 0 + 5, b - tce])cylinder(r=tso, h=tce + o, center=false);
            }
            union() {
                translate([w - 5, d - 5, b - tcd])cylinder(r=tsi, h=tcd + o, center=false);
                translate([0 + 5, d - 5, b - tcd])cylinder(r=tsi, h=tcd + o, center=false);
                translate([w - 5, 0 + 5, b - tcd])cylinder(r=tsi, h=tcd + o, center=false);
                translate([0 + 5, 0 + 5, b - tcd])cylinder(r=tsi, h=tcd + o, center=false);
            }
        }

        // terminals for screws - board
        h1 = b - tsg - tsh;
        w1 = w - w0;
        d1 = d - d0;
        difference() {
            union() {
                translate([w1 - 2.5, d1 - 5, h1])cylinder(r=tso, h=tsh, center=false);
                translate([w0 + 2.5, d1 - 5, h1])cylinder(r=tso, h=tsh, center=false);
                translate([w1 - 2.5, d0 + 20, h1])cylinder(r=tso, h=tsh, center=false);
                translate([w0 + 2.5, d0 + 20, h1])cylinder(r=tso, h=tsh, center=false);
            }
            union() {
                translate([w1 - 2.5, d1 - 5, h1])cylinder(r=tsi, h=tss + o, center=false);
                translate([w0 + 2.5, d1 - 5, h1])cylinder(r=tsi, h=tss + o, center=false);
                translate([w1 - 2.5, d0 + 20, h1])cylinder(r=tsi, h=tss + o, center=false);
                translate([w0 + 5, d0 + 20, h1])cylinder(r=tsi, h=tss + o, center=false);
            }
        }
    }
}

/*
 * Create Fischertechnik compatible block with length passed by the argument.
 *
 * @param ftiBlockLength end cap length in millimeters (default is 15)
 */
module ftiBlock15x15(ftiBlockLength=15) {

    union() {
        dBlock=15; // block (max) diameter
        
        // Fischertechnik block
        difference() {
            dFti=4; // axis diameter 4mm
            tFti=0.2; // some space around
            gFtiW=3; // with of gap
            gFtiD=2; // depth of gap
            dCyl=dFti + tFti;
            cube([dBlock, dBlock, ftiBlockLength]);
            // axis
            translate([dBlock/2,dFti/2,0])cylinder(h=ftiBlockLength, d=dCyl);
            translate([dBlock/2,dBlock-dFti/2,0])cylinder(h=ftiBlockLength, d=dCyl);
            translate([dBlock-dFti/2,dBlock/2,0])cylinder(h=ftiBlockLength, d=dCyl);
            translate([dFti/2,dBlock/2,0])cylinder(h=ftiBlockLength, d=dCyl);
            // space
            translate([dBlock/2-gFtiW/2,0,0])cube([gFtiW, gFtiD, ftiBlockLength]);
            translate([dBlock/2-gFtiW/2,dBlock-gFtiD,0])cube([gFtiW, gFtiD, ftiBlockLength]);
            translate([dBlock-gFtiW/2,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
            translate([0,dBlock/2-gFtiW/2,0])cube([gFtiD, gFtiW, ftiBlockLength]);
            if (bottomConnectors) {
                // orthoganal axis at end
                translate([dBlock/2, dBlock, dFti/2])rotate([90, 0, 0])cylinder(h=dBlock, d=dCyl);
                translate([dBlock/2-dFti/2, dBlock-dFti/2, 0])cube([dCyl, dCyl, dCyl]);
                translate([dBlock/2-dFti/2, 0-dFti/2, 0])cube([dCyl, dCyl, dCyl]);
                translate([dBlock/2+gFtiW/2, 0, -gFtiD/2])rotate([270, 180, 0])cube([gFtiW, gFtiD, dBlock]);
            }
        }
    }
}
