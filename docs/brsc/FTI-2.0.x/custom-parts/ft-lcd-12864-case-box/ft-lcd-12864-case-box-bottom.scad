/**
 * Remix of Single part case 12864 LCD Full Graphic Smart Display on Thingiverse: http://www.thingiverse.com/thing:3212330
 *
 * with fischertechnik double flat connector (http://www.thingiverse.com/thing:3144426) by juh 
 * is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
 * http://creativecommons.org/licenses/by-nc-sa/3.0/.
 */

ftArduinoCaseBottom();

module ftArduinoCaseBottom() {
    arduinoCaseBottom();
}

module arduinoCaseBottom() {
    
    w = 105;
    h = 7.5;
    d = 105;
    b = 2.5;
    f = 6.5;
    s = 5;
    o = 8;
    p = 2;

    difference() {
        translate([0, 0, b/2])union() {
            
            // border
            translate([0, 0, h/2])difference() {
                cube([w, d, h], center=true);
                cube([w - 2*b, d - 2*b, h], center=true);
            }

            // bottom
            cube([w, d, b], center=true);

            // inner border overlap
            translate([0, 0, h/2 + o/2])difference() {
                cube([w - 2*b, d - 2*b, o], center=true);
                cube([w - 2*b - 2*p, d - 2*b - 2*p, o], center=true);
            }

            // front and rear connectors
            sh = 2;
            connectorCount = 7;
            offsetX = -w/2;
            offsetYFront = d/2 + 1;
            offsetYRear = -d/2 - 1;
            for(i = [0:1:connectorCount - 1]) {
                translate([offsetX + 15*i + 7.5, offsetYFront, sh/2])connectorLE45mm(length=(h - sh));
                translate([offsetX + 15*i + 7.5, offsetYRear, sh/2])connectorLE45mm(length=(h - sh));
            }

            // left and right connectors
            connectorLRCount = 7;
            offsetY = -d/2;
            offsetXLeft = w/2 + 1;
            offsetXRight = -w/2 - 1;
            for(i = [0:1:connectorLRCount - 1]) {
                translate([offsetXLeft, offsetY + 15*i + 7.5, sh/2])rotate([0 ,0, 90])connectorLE45mm(length=(h - sh));
                translate([offsetXRight, offsetY + 15*i + 7.5, sh/2])rotate([0 ,0, 90])connectorLE45mm(length=(h - sh));
            }
        }

        // slot at rear
        translate([0, -d/2, h - s/2 + o/2 + b])rotate([0, 0, 90])cube([15, w - 30, s], center=true);
    }
}

module connectorLE45mm(length=45) {
    difference() {
    
        translate([20, 0, 7.0])rotate([90, 0, 0])import("fischertechnik_double_flat_connector/files/Connector_45mm_v1.stl");
        translate([0, 0, 45-(45-length)/2])cube([200, 200, 45-length], center=true);
    }
}
