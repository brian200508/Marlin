/*
 * Fischertechnik compatible case for RepRap Arduino Mega / RAMPS 1.6 boards.
 */

bottomConnectors = false; // Fischertechnik compatible connectors bottom if true
dualExtruder = false; // dual extruder
dualZStepper = false; // separate Z steppers

w = 120; // width of case
h = 45; // height of case
c = 30; // height of Fischertechnik connectors
d = 90; // depth of case

t = 3; // height of top
b = h - t; // height of bottom
tsh = 2; // outer height of terminal for screw
tss = 7; // inner height of terminal for screw

wb = 102; // width of board
db = 62; // depth of board
hb = 30; // height of board
xb = -2; // x-offset of board
yb = 0; // y-offset of board
hbb = hb + tsh; // board base bottom (Arduino)
hbr = hbb - 12.5; // board base bottom (RAMPS)

tso = 7.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
tse = 8.0/2; // radius of edge for screw top
hse = 2.0; // height of edge for screw top
dtx = 1; // depth of text labels
stx = 3; // size of text labels
o = 0.02; // overlap for better preview rendering

arduino2560Ramps16BoardCaseBottom();

module arduino2560Ramps16BoardCaseBottom() {

    // all connectors slots frame
    ocf = -1; // y-offset of connector slot frame (measured from board y=0)
    zcf = 0; // z-offset of connector slot frame (measured from board z=0)
    wcf = 57.5; // width of connector slot frame
    dcf = 5; // depth of connector slot frame (measured from outer border)
    hcf = 30 - 2.5; // height of connector slot frame

    // RAMPS 1.6 connectors
    orz = 7.5; // z-offset of all RAMPS connectors
    oc1 = 20; // y-offset of connector slot 1 (measured from board y=0)
    wc1 = 35; // width of connector slot 1
    dc1 = 20; // depth of connector slot 1 (measured from outer border)
    hc1 = 5; // height of connector slot 1
    oc2 = 0; // y-offset of connector slot 2 (measured from board y=0)
    wc2 = 12.5; // width of connector slot 2
    dc2 = 20; // depth of connector slot 2 (measured from outer border)
    hc2 = 5; // height of connector slot 2
    xc3 = -5; // x-offset of connector slot 2 (measured from board x=0)
    yc3 = 0; // y-offset of connector slot 2 (measured from board y=0)
    zc3 = 10; // y-offset of connector slot 2 (measured from board z=0)
    wc3 = 12.5; // width of connector slot 2
    dc3 = 25; // depth of connector slot 2 (measured from outer border)
    hc3 = 15; // height of connector slot 2

    // Arduino connectors
    ocz = 5; // z-offset of all Arduino connectors
    ocp = 12; // y-offset of power connector slot (measured from board y=0)
    wcp = 12; // width of power connector slot
    dcp = 20; // depth of power connector slot (measured from outer border)
    hcp = 12; // height of power connector slot
    ocu = 40; // y-offset of USB connector slot (measured from board y=0)
    wcu = 15; // width of USB connector slot
    dcu = 20; // depth of USB connector slot (measured from outer border)
    hcu = 12; // height of USB connector slot

    // cooling fan
    tcc = 0.8; // tolerance cooling fan
    wcc = 40 + tcc; // width of cooling fan
    dcc = 10 + tcc; // depth of cooling fan
    hcc = 40 + tcc; // height of cooling fan
    xcc = wb/2 - wcc/2; // y-offset of cooling fan (measured from board y=0)
    ycc = db + 2.5 - tcc; // y-offset of cooling fan (measured from board y=0)
    zcc = (b - hcc); // z-offset of cooling fan (measured from case z=0)
    rch = (38 + tcc)/2; // radius of cooling fan hole
    dch = 20 + tcc; // depth of cooling fan hole
    xch = wb/2 - rch; // y-offset of cooling fan hole (measured from board y=0)
    ych = db - o; // y-offset of cooling fan hole (measured from board y=0)
    zch = zcc + hcc/2 - rch; // z-offset of cooling fan hole (measured from case z=0)
    wck = 2; // width of cooling fan cable slot 1
    dck = 5; // depth of cooling fan cable slot 1
    hck = 2; // height of cooling fan cable slot 1
    xck = xcc + 5; // y-offset of cooling fan cable slot 1 (measured from board y=0)
    yck = db - tcc; // y-offset of cooling fan cable slot 1 (measured from board y=0)
    zck = (b - hck); // z-offset of cooling fan cable slot 1 (measured from case z=0)
    wcj = 2; // width of cooling fan cable slot 2
    dcj = 5; // depth of cooling fan cable slot 2
    hcj = 2; // height of cooling fan cable slot 2
    xcj = xck + wcc - wcj - 5; // y-offset of cooling fan cable slot 2 (measured from board y=0)
    ycj = db - tcc; // y-offset of cooling fan cable slot 2 (measured from board y=0)
    zcj = (b - hcj); // z-offset of cooling fan cable slot 2 (measured from case z=0)

    // display connector
    wcd = 65; // width of display connector slot
    dcd = 24; // depth of display connector slot (measured from outer border)
    hcd = 17; // height of display connector slot
    xcd = wb - 15; // x-offset of display connector slot (measured from board x=0)
    ycd = -2; // y-offset of display connector slot (measured from board y=0)
    zcd = 8; // z-offset of display connector slot (measured from board z=0)

    // overlapping part of Arduino board
    wco = 47.5; // width of overlapping part
    dco = 20; // depth of overlapping part (measured from outer border)
    hco = 17 + 15; // height of overlapping part
    xco = wb - 15; // x-offset of overlapping part (measured from board x=0)
    yco = 7.5; // y-offset of overlapping part (measured from board y=0)
    zco = 0; // z-offset of overlapping part (measured from board z=0)

    // reset button
    orb = 35; // x-offset of reset button (measured from board y=0)
    zrb = 5; // z-offset of reset button (measured from board z=0)
    rrb = 2.5; // radius of reset button
    hrb = 30; // height of reset button frame
    orf = orb - 3.5; // x-offset of reset button frame (measured from board y=0)
    zrf = zrb - 3.5; // z-offset of reset button frame (measured from board z=0)
    wrf = 7.5; // width of reset button frame
    drf = 5; // depth of reset button frame
    hrf = 7.5; // height of reset button frame

    tsg = hbb - tsh; // gap between top and screw terminal

    union() {

        wO = (w - wb)/2;
        dO = (d - db)/2;
        w0 = wO + xb;
        d0 = dO + yb;
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

            // connector slots (RAMPS)
            translate([0 - o, d0 + oc1, b - hbr + orz])cube([dc1 + o, wc1, hc1 + o], center=false);
            translate([0 - o, d0 + oc2, b - hbr + orz])cube([dc2 + o, wc2, hc2 + o], center=false);
            translate([w0 + xc3 - o, d0 + yc3, b - hbr + zc3])cube([dc3 + o, wc3, hc3 + o], center=false);
            // connector slots (Arduino)
            translate([0 - o, d0 + ocp, b - hbb + ocz])cube([dcp + o, wcp, hcp + o], center=false);
            translate([0 - o, d0 + ocu, b - hbb + ocz])cube([dcu + o, wcu, hcu + o], center=false);
            // connector slots frame
            translate([0 - o, d0 + ocf, b - hbb + zcf])cube([dcf + o, wcf, hcf + o], center=false);
            translate([0 - o + dcf + dtx, d0 + ocu - wcu/2 + 6, b - hbb + ocz + 2 + stx])rotate([90, 0, -90])linear_extrude(dtx)text("USB", size=stx);
            translate([0 - o + dcf + dtx, d0 + ocp - wcp/2 + 3, b - hbb + ocz + 2 + stx])rotate([90, 0, -90])linear_extrude(dtx)text("7-12V", size=stx);
            translate([0 - o + dcf + dtx, d0 + ocp - wcp/2 + 3, b - hbb + ocz + 1])rotate([90, 0, -90])linear_extrude(dtx)text("DC", size=stx);
            // cooling fan
            translate([0 + xcc, d0 + ycc, 0 + zcc])cube([wcc, dcc, hcc + o], center=false);
            translate([0 + xch + rch, d0 + ych + dch, 0 + zch + rch])rotate([90, 0, 0])cylinder(r=rch, h=dch, center=false);
            translate([0 + xck, d0 + yck, 0 + zck])cube([wck, dck, hck + o], center=false);
            translate([0 + xcj, d0 + ycj, 0 + zcj])cube([wcj, dcj, hcj + o], center=false);
            // display connector
            translate([w0 + xcd - o, d0 + ycd, b - hbr + zcd])cube([dcd + o, wcd, hcd + o], center=false);
            // overlapping part of Arduino board
            translate([w0 + xco - o, d0 + yco, b - hbb + zco])cube([dco + o, wco, hco + o], center=false);
            // reset button
            translate([w0 + orb, 0 - o + hrb, b - hbb + zrb])rotate([90, 0, 0])cylinder(r=rrb, h=hrb + 2*o, center=false);
            translate([w0 + orb - rrb, d0 - 2*rrb, b - hbb + zrb])cube([2*rrb, 2*rrb + o, hrb + o], center=false);
            translate([w0 + orf, 0 - o, b - hbb + zrf])cube([wrf, drf + o, hrf], center=false);
            translate([w0 + orb - wrf/2, 0 - o + dtx, b - hbb + zrf + hrf + 1])rotate([90, 0, 0])linear_extrude(dtx)text("RES", size=stx);

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
        w1 = w - wO + xb;
        d1 = d - dO + yb;
        difference() {
            union() {
                translate([w0 + 15, d1 - 3.5, h1])cylinder(r=tso, h=tsh, center=false);
                translate([w1 - 5, d0 + 10, h1])cylinder(r=tso, h=tsh, center=false);
            }
            union() {
                translate([w0 + 15, d1 - 3.5, h1])cylinder(r=tsi, h=tss + o, center=false);
                translate([w1 - 5, d0 + 10, h1])cylinder(r=tsi, h=tss + o, center=false);
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
