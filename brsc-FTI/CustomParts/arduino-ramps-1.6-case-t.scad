/*
 * Fischertechnik compatible case for RepRap Arduino Mega / RAMPS 1.6 boards.
 */

dualExtruder = false; // dual extruder
dualZStepper = false; // separate Z steppers
labelHeader = "RepRap Arduino Mega / RAMPS 1.6"; // header
labelFooter = "(c) 2021 BRSC";

w = 120; // width of case
h = 45; // height of case
c = 30; // height of Fischertechnik connectors
d = 90; // depth of case

t = 3; // height of top
b = h - t; // height of bottom
tsh = 3; // outer height of terminal for screw
tss = 7; // inner height of terminal for screw

wb = 102; // width of board
db = 62; // depth of board
hb = 30; // height of board
xb = -2; // x-offset of board
yb = 0; // y-offset of board
hbb = hb + tsh; // board base bottom (Arduino)
hbr = hbb - 12.5; // board base bottom (RAMPS)

tso = 6.5; // outer radius of terminal for screw
tsi = 2.5/2; // inner radius of terminal for screw bottom
tst = 3.5/2; // inner radius of terminal for screw top
//tse = 8.0/2; // radius of edge for screw top
//hse = 2.0; // height of edge for screw top
dtx = 2; // depth of text labels
stx = 4; // size of text labels
o = 0.02; // overlap for better preview rendering

arduino2560Ramps16BoardCaseTop();

module arduino2560Ramps16BoardCaseTop() {

    hs = 7.5; // height of all slots
    ts = 0.5; // tolerance of all slots
    tsc = 1.25; // tolerance of all heatsink slots

    tc = ts; // tolerance for display connector slot
    xc = 87.5; // x-offset of display connector slot (measured from board x=0)
    yc = -2; // y-offset of display connector slot (measured from board y=0)
    wc = 22.5; // width of display connector slot
    hc = hs; // height of display connector slot
    dc = 10; // depth of display connector slot

    td = ts; // tolerance for display connector slot
    xd = 94; // x-offset of display connector slot (measured from board x=0)
    yd = 0; // y-offset of display connector slot (measured from board y=0)
    wd = 16; // width of display connector slot
    hd = hs; // height of display connector slot
    dd = 65; // depth of display connector slot

    tu = ts; // tolerance for power connector slot
    xu = 3; // x-offset of power connector slot (measured from board x=0)
    yu = 5; // y-offset of power connector slot (measured from board y=0)
    wu = 7.5; // width of power connector slot
    hu = hs; // height of power connector slot
    du = 12.5; // depth of power connector slot

    tq = ts; // tolerance for hotend connector slot
    xq = 7.5; // x-offset of hotend connector slot (measured from board x=0)
    yq = 20; // y-offset of hotend connector slot (measured from board y=0)
    wq = 7.5; // width of hotend connector slot
    hq = hs; // height of hotend connector slot
    dq = 12.5; // depth of hotend connector slot

    tr = ts; // tolerance for connector slot
    xr = 10; // x-offset of connector slot (measured from board x=0)
    yr = 35; // y-offset of connector slot (measured from board y=0)
    wr = 5; // width of connector slot
    hr = hs; // height of connector slot
    dr = 20; // depth of connector slot

    tx = ts; // tolerance for x-axis stepper connector slot
    xx = 37.5; // x-offset of x-axis stepper connector slot (measured from board x=0)
    yx = 27.5; // y-offset of x-axis stepper connector slot (measured from board y=0)
    wx = 15; // width of x-axis stepper connector slot
    hx = hs; // height of x-axis stepper connector slot
    dx = 5; // depth of x-axis stepper connector slot

    ty = ts; // tolerance for y-axis stepper connector slot
    xy = 57.5; // x-offset of y-axis stepper connector slot (measured from board x=0)
    yy = 27.5; // y-offset of y-axis stepper connector slot (measured from board y=0)
    wy = 15; // width of y-axis stepper connector slot
    hy = hs; // height of y-axis stepper connector slot
    dy = 5; // depth of y-axis stepper connector slot

    tz = ts; // tolerance for z-axis stepper connector slot
    xz = 75; // x-offset of z-axis stepper connector slot (measured from board x=0)
    yz = 27.5; // y-offset of z-axis stepper connector slot (measured from board y=0)
    wz = 15; // width of z-axis stepper connector slot
    hz = hs; // height of z-axis stepper connector slot
    dz = 10; // depth of z-axis stepper connector slot

    te = ts; // tolerance for extruder-0 stepper connector slot
    xe = 37.5; // x-offset of extruder-0 stepper connector slot (measured from board x=0)
    ye = 52.5; // y-offset of extruder-0 stepper connector slot (measured from board y=0)
    we = 15; // width of extruder-0 stepper connector slot
    he = hs; // height of extruder-0 stepper connector slot
    de = 5; // depth of extruder-0 stepper connector slot

    tf = ts; // tolerance for extruder-1 stepper connector slot
    xf = 55; // x-offset of extruder-1 stepper connector slot (measured from board x=0)
    yf = 52.5; // y-offset of extruder-1 stepper connector slot (measured from board y=0)
    wf = 15; // width of extruder-1 stepper connector slot
    hf = hs; // height of extruder-1 stepper connector slot
    df = 5; // depth of extruder-1 stepper connector slot

    tp = ts; // tolerance for endstop connector slot
    xp = 70; // x-offset of endstop connector slot (measured from board x=0)
    yp = 47.5; // y-offset of endstop connector slot (measured from board y=0)
    wp = 17.5; // width of endstop connector slot
    hp = hs; // height of endstop connector slot
    dp = 10; // depth of endstop connector slot

    tt = ts; // tolerance for temperature sensor connector slot
    xt = 77.5; // x-offset of temperature sensor connector slot (measured from board x=0)
    yt = 35; // y-offset of temperature sensor connector slot (measured from board y=0)
    wt = 17.5; // width of temperature sensor connector slot
    ht = hs; // height of temperature sensor connector slot
    dt = 5; // depth of temperature sensor connector slot

    txc = tsc; // tolerance for x-axis stepper heatsink slot
    xxc = 35; // x-offset of x-axis stepper heatsink slot (measured from board x=0)
    yxc = 12.5; // y-offset of x-axis stepper heatsink slot (measured from board y=0)
    wxc = 10; // width of x-axis stepper heatsink slot
    hxc = hs; // height of x-axis stepper heatsink slot
    dxc = 10; // depth of x-axis stepper heatsink slot

    tyc = tsc; // tolerance for y-axis stepper heatsink slot
    xyc = 55; // x-offset of y-axis stepper heatsink slot (measured from board x=0)
    yyc = 12.5; // y-offset of y-axis stepper heatsink slot (measured from board y=0)
    wyc = 10; // width of y-axis stepper heatsink slot
    hyc = hs; // height of y-axis stepper heatsink slot
    dyc = 10; // depth of y-axis stepper heatsink slot

    tzc = tsc; // tolerance for z-axis stepper heatsink slot
    xzc = 75; // x-offset of z-axis stepper heatsink slot (measured from board x=0)
    yzc = 12.5; // y-offset of z-axis stepper heatsink slot (measured from board y=0)
    wzc = 10; // width of z-axis stepper heatsink slot
    hzc = hs; // height of z-axis stepper heatsink slot
    dzc = 10; // depth of z-axis stepper heatsink slot

    tec = tsc; // tolerance for extruder-0 stepper heatsink slot
    xec = 35; // x-offset of extruder-0 stepper heatsink slot (measured from board x=0)
    yec = 35; // y-offset of extruder-0 stepper heatsink slot (measured from board y=0)
    wec = 10; // width of extruder-0 stepper heatsink slot
    hec = hs; // height of extruder-0 stepper heatsink slot
    dec = 10; // depth of extruder-0 stepper heatsink slot

    tfc = tsc; // tolerance for extruder-1 stepper heatsink slot
    xfc = 55; // x-offset of extruder-1 stepper heatsink slot (measured from board x=0)
    yfc = 35; // y-offset of extruder-1 stepper heatsink slot (measured from board y=0)
    wfc = 10; // width of extruder-1 stepper heatsink slot
    hfc = hs; // height of extruder-1 stepper heatsink slot
    dfc = 10; // depth of extruder-1 stepper heatsink slot

    th = ts; // tolerance for extruder heating heatsink slot
    xh = 20; // x-offset of extruder heating heatsink slot (measured from board x=0)
    yh = 0; // y-offset of extruder heating heatsink slot (measured from board y=0)
    wh = 10; // width of extruder heating heatsink slot
    hh = hs; // height of extruder heating heatsink slot
    dh = 60; // depth of extruder heating heatsink slot

    tl = ts; // tolerance for LED slot
    xl = 2; // x-offset of LED slot (measured from board x=0)
    yl = dh - 2.5; // y-offset of LED slot (measured from board y=0)
    wl = 7.5; // width of LED slot
    hl = hs; // height of LED slot
    dl = 2.5; // depth of LED slot

    union() {

        wO = (w - wb)/2;
        dO = (d - db)/2;
        w0 = wO + xb;
        d0 = dO + yb;
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

            // connectors
            translate([w0 + xc - tc, d0 + yc - tc, 0 - tce - o])cube([wc + 2*tc, dc + 2*tc, hc + 2*o], center=false);
            translate([w0 + xd - td, d0 + yd - td, 0 - tce - o])cube([wd + 2*td, dd + 2*td, hd + 2*o], center=false);
            translate([w0 + xx - tx, d0 + yx - tx, 0 - tce - o])cube([wx + 2*tx, dx + 2*tx, hx + 2*o], center=false);
            translate([w0 + xy - ty, d0 + yy - ty, 0 - tce - o])cube([wy + 2*ty, dy + 2*ty, hy + 2*o], center=false);
            translate([w0 + xz - tz, d0 + yz - tz, 0 - tce - o])cube([wz + 2*tz, dz + 2*tz, hz + 2*o], center=false);
            translate([w0 + xe - te, d0 + ye - te, 0 - tce - o])cube([we + 2*te, de + 2*te, he + 2*o], center=false);
            translate([w0 + xp - tp, d0 + yp - tp, 0 - tce - o])cube([wp + 2*tp, dp + 2*tp, hp + 2*o], center=false);
            translate([w0 + xt - tt, d0 + yt - tt, 0 - tce - o])cube([wt + 2*tt, dt + 2*tt, ht + 2*o], center=false);
            translate([w0 + xu - tu, d0 + yu - tu, 0 - tce - o])cube([wu + 2*tu, du + 2*tu, hu + 2*o], center=false);
            translate([w0 + xq - tq, d0 + yq - tq, 0 - tce - o])cube([wq + 2*tq, dq + 2*tq, hq + 2*o], center=false);
            translate([w0 + xr - tr, d0 + yr - tr, 0 - tce - o])cube([wr + 2*tr, dr + 2*tr, hr + 2*o], center=false);
            // labels
            d2 = 2;
            w2 = -3;
            w3 = -6;
            translate([w0 + 4, d - 7, t - dtx + o])linear_extrude(dtx + o)text(labelHeader, size=stx);
            translate([w0 + 4, 0 + 4, t - dtx + o])linear_extrude(dtx + o)text(labelFooter, size=stx-1);
            translate([w0 + xd - 22, d0 + yd, t - dtx + o])linear_extrude(dtx + o)text("DISP", size=stx);
            translate([w0 + xx + wx + w2, d0 + yx + dx + d2, t - dtx + o])linear_extrude(dtx + o)text("X", size=stx);
            translate([w0 + xy + wy + w2, d0 + yy + dy + d2, t - dtx + o])linear_extrude(dtx + o)text("Y", size=stx);
            translate([w0 + xz + wz - 1, d0 + yz - dz/2 - 1, t - dtx + o])linear_extrude(dtx + o)text("Z", size=stx);
            translate([w0 + xe + we + w3, d0 + ye + de + d2, t - dtx + o])linear_extrude(dtx + o)text("EO", size=stx);
            translate([w0 + xp + wp - 14, d0 + yp + dp + d2, t - dtx + o])linear_extrude(dtx + o)text("ENDST.", size=stx);
            translate([w0 + xt + wt - 22, d0 + yt + dt + d2, t - dtx + o])linear_extrude(dtx + o)text("THERM.", size=stx);
            translate([w0 - 5, d0 + yu + 0, t - dtx + o])linear_extrude(dtx + o)text("12", size=stx);
            translate([w0 - 5, d0 + yq + 0, t - dtx + o])linear_extrude(dtx + o)text("D8", size=stx);
            translate([w0 - 5, d0 + yr + 0, t - dtx + o])linear_extrude(dtx + o)text("D9", size=stx);
            translate([w0 - 5, d0 + yr + dr/2, t - dtx + o])linear_extrude(dtx + o)text("D10", size=stx);
            translate([w0 - 5, d0 + yl - stx -2, t - dtx + o])linear_extrude(dtx + o)text("LED", size=stx);
            translate([w0 - 5, d0 + yd, t - dtx + o])linear_extrude(dtx + o)text(" V", size=stx);

            // heat sinks
            translate([w0 + xxc - txc, d0 + yxc - txc, 0 - tce - o])cube([wxc + 2*txc, dxc + 2*txc, hxc + 2*o], center=false);
            translate([w0 + xyc - tyc, d0 + yyc - tyc, 0 - tce - o])cube([wyc + 2*tyc, dyc + 2*tyc, hyc + 2*o], center=false);
            translate([w0 + xzc - tzc, d0 + yzc - tzc, 0 - tce - o])cube([wzc + 2*tzc, dzc + 2*tzc, hzc + 2*o], center=false);
            translate([w0 + xec - tec, d0 + yec - tec, 0 - tce - o])cube([wec + 2*tec, dec + 2*tec, hec + 2*o], center=false);
            translate([w0 + xh - th, d0 + yh - th, 0 - th - o])cube([wh + 2*th, dh + 2*th, hh + 2*o], center=false);
            translate([w0 + xl - tl, d0 + yl - tl, 0 - tl - o])cube([wl + 2*tl, dl + 2*tl, hl + 2*o], center=false);
            // dual extruder or z-stepper
            if (dualExtruder || dualZStepper) {
                translate([w0 + xf - tf, d0 + yf - tf, 0 - tce - o])cube([wf + 2*tf, df + 2*tf, hf + 2*o], center=false);
                translate([w0 + xfc - tfc, d0 + yfc - tfc, 0 - tce - o])cube([wfc + 2*tfc, dfc + 2*tfc, hfc + 2*o], center=false);
                translate([w0 + xf + wf + w3, d0 + yf + df + d2, t - dtx + o])linear_extrude(dtx + o)text("E1", size=stx);
            }

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
