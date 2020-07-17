/**
 * Remix of Single part case 12864 LCD Full Graphic Smart Display on Thingiverse: http://www.thingiverse.com/thing:3212330
 *
 * with fischertechnik double flat connector (http://www.thingiverse.com/thing:3144426) by juh 
 * is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
 * http://creativecommons.org/licenses/by-nc-sa/3.0/.
 */

include <ft-connect.scad>;

ftArduinoCaseBottom();

module ftArduinoCaseBottom() {
    arduinoCaseBottom();
}

module arduinoCaseBottom() {
    
    w = 105;
    h = 7.5;
    d = 105;
    b = 2.5;
    s = 5;
    o = 2.5;
    p = 2;
    q = 1.35;

    difference() {
        translate([0, 0, b/2])union() {
            
            // bottom
            cube([w-7.5, d-7.5, b], center=true);

            // inner border overlap
            translate([0, 0, h/2 + o/2])difference() {
                cube([w-15 - 2*b, d-15 - 2*b, o], center=true);
                cube([w-15 - 2*b - 2*p, d-15 - 2*b - 2*p, o], center=true);
            }

            // front and rear connectors
            connectorCount = 7;
            offsetX = -w/2 + 7.5;
            offsetYFront = d/2 - 7.5;
            offsetYRear = -d/2 + 7.5;
            for(i = [0:1:connectorCount - 1]) {
                translate([offsetX + 15*i, offsetYFront, h/2 - q])rotate([0, 0, -90])ftConnector(Length=h);
                translate([offsetX + 15*i, offsetYRear, h/2 - q])rotate([0, 0, 90])ftConnector(Length=h);
            }

            // left and right connectors
            connectorLRCount = 7;
            offsetY = -d/2;
            offsetXLeft = w/2 - 7.5;
            offsetXRight = -w/2 + 7.5;
            for(i = [0:1:connectorLRCount - 1]) {
                translate([offsetXLeft, offsetY + 15*i + 7.5, h/2 - q])rotate([0, 0, 180])ftConnector(Length=h);
                translate([offsetXRight, offsetY + 15*i + 7.5, h/2 - q])rotate([0, 0, 0])ftConnector(Length=h);
            }
        }

        // slot at rear
        translate([0, -d/2, h - s/2 + o/2 + b - q])rotate([0, 0, 90])cube([15, w - 30, s], center=true);
    }
}

module ftConnector(Length) {
    difference() {
        ftConnectFti2(Length=Length);
        cube([4, 15, Length], center=true);
    }
}
