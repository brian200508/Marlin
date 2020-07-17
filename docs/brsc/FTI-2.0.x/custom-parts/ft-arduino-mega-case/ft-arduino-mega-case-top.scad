/**
 * Remix of Arduino Mega Case by Fischkopf on Thingiverse: https://www.thingiverse.com/thing:4340259
 *
 * with fischertechnik double flat connector (http://www.thingiverse.com/thing:3144426) by juh 
 * is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
 * http://creativecommons.org/licenses/by-nc-sa/3.0/.
 */

include <ft-connect.scad>;

ftArduinoCaseTop();

module ftArduinoCaseTop() {
    arduinoCaseTop();
}

module arduinoCaseTop() {
    
    w = 90;
    h=7.5;
    d = 150;
    q = 1.35;
    bx1=8;
    bx2=5;
    by=3;

    union() {
        difference() {
            translate([2.5, 0, 0])import("Arduino-Mega-Case/files/Boden_Arduino_Mega.stl");
            translate([0, 0, h])cube([120, 165, 60]);

            translate([0, 0, 0])cube([5, 30, h]);
            translate([0, 0, 0])cube([45, 5, h]);
            
            translate([90, 0, 0])cube([15, 5, h]);
            translate([0, 120, 0])cube([5, 30, h]);
            translate([0, 145, 0])cube([150, 5, h]);
        }
        
        translate([bx1, by, -q - h/4])cube([105 - bx1 - bx2, 150 - 2*by, 1.25*h]);

        // front and rear connectors
        connectorCount = 7;
        offsetX = 7.5;
        offsetYFront = d - 7.5;
        offsetYRear = 0 + 7.5;
        for(i = [0:1:connectorCount - 1]) {
            // rear
            translate([offsetX + 15*i, offsetYFront, h/2 - q])rotate([0, 0, -90])ftConnector(Length=h);
            // front
            if (i<3 || i>5) {
                translate([offsetX + 15*i, offsetYRear, h/2 - q])rotate([0, 0, 90])ftConnector(Length=h);
            }
        }

        // left and right connectors
        connectorLRCount = 10;
        offsetY = 0;
        offsetXLeft = w + 7.5;
        offsetXRight = 0 + 7.5;
        for(i = [0:1:connectorLRCount - 1]) {
            // right
            if (i<2 || i>8) {
                translate([offsetXLeft, offsetY + 15*i + 7.5, h/2 - q])rotate([0, 0, 180])ftConnector(Length=h);
            }
            // left
            if (i<2 || i>7) {
                translate([offsetXRight, offsetY + 15*i + 7.5, h/2 - q])rotate([0, 0, 0])ftConnector(Length=h);
            }
        }
    }
}

module ftConnector(Length) {
    difference() {
        ftConnectFti2(Length=Length);
        cube([4, 15, Length], center=true);
    }
}