/*
 * Fischertechnik compatible case for fuse and power connector.
 */

bottomConnectors = false; // Fischertechnik compatible connectors bottom if true

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

tso = 7.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
tse = 8.0/2; // radius of edge for screw top
hse = 2.0; // height of edge for screw top
dtx = 1; // depth of text labels
stx = 3; // size of text labels
o = 0.02; // overlap for better preview rendering

fusePowerConnectorCaseBottom();

module fusePowerConnectorCaseBottom() {

    wc1 = 15; // width of power connector block
    hc1 = 15; // height of power connector block (measured from board bottom)
    dc1 = 45 - 10 + 5; // depth of power connector block
    xc1 = 7.5; // x-offset of power connector block (measured from board x=0)
    yc1 = d/2 - wc1/2; // y-offset of power connector block (measured from board y=0)
    rc2 = 5; // radius of power connector cylinder (measured from board bottom)
    dc2 = 5 + o; // depth of power connector cylinder
    xc2 = 5 - o; // x-offset of power connector cylinder (measured from board x=0)
    yc2 = d/2; // y-offset of power connector cylinder (measured from board y=0)
    zc2 = 1.5*rc2; // z-offset of power connector cylinder (measured from board y=0)
    wc3 = 15; // width of power connector frame
    hc3 = 15; // height of power connector frame (measured from board bottom)
    dc3 = 5; // depth of power connector frame
    xc3 = 0; // x-offset of power connector frame (measured from board x=0)
    yc3 = d/2 - wc3/2; // y-offset of power connector frame (measured from board y=0)
    wk = 10; // width of cable slot (together)
    hk = 5; // height of cable slot (measured from board bottom)
    dk = 20; // depth of cable slot
    xk = w - dk + o; // x-offset of cable slot (measured from board x=0)
    yk = d/2 - wk/2; // y-offset of cable slot (measured from board y=0)
    ws = 20; // width of separator
    hs = 30; // height of separator (measured from board bottom)
    ds = 5; // depth of separator
    xs = 45 + 5; // x-offset of separator (measured from board x=0)
    ys = d/2 - ws/2; // y-offset of separator (measured from board y=0)

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

            // connectors and cable slot
            translate([0 + xc1 - o, 0 + yc1, 15])cube([dc1, wc1, hc1 + o], center=false);
            translate([0 + xc2 - o, 0 + yc2, 15 + zc2])rotate([0, 90, 0])cylinder(r=rc2, h=dc2 + o, center=false);
            translate([0 + xc3 - o, 0 + yc3, 15])cube([dc3, wc3, hc3 + o], center=false);
            translate([0 + xk, 0 + yk + o, 15])cube([dk, wk, hk + o], center=false);
            translate([0 + xc3 - o + dtx, 0 + yc3 + wc3, 15 + hc3 + 1])rotate([90, 0, -90])linear_extrude(dtx)text("12V DC", size=stx);

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

        // separator
        translate([0 + xs, 0 + ys, 5])cube([ds, ws, hs], center=false);
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
