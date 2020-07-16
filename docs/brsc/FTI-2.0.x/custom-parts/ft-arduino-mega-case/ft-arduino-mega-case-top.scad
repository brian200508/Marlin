/**
 * Remix of Arduino Mega Case by Fischkopf on Thingiverse: https://www.thingiverse.com/thing:4340259
 *
 * with fischertechnik double flat connector (http://www.thingiverse.com/thing:3144426) by juh 
 * is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
 * http://creativecommons.org/licenses/by-nc-sa/3.0/.
 */

ftArduinoCaseTop();

module ftArduinoCaseTop() {
    arduinoCaseTop();
}

module arduinoCaseTop() {
    
    h=2.5;
    bx1=8;
    bx2=5;
    by=3;
    
    union() {
        difference() {
            translate([2.5, 0, 0])import("Arduino-Mega-Case/files/Boden_Arduino_Mega.stl");
            translate([0, 0, h])cube([120, 165, 60]);
        }
        
        translate([bx1, by, 0])cube([105 - bx1 - bx2, 150 - 2*by, 2*h]);

        translate([7.5, 0, 0])connectorLE45mm(length=h);
        translate([97.5, 0, 0])connectorLE45mm(length=h);

        translate([7.5, 150, 0])connectorLE45mm(length=h);
        translate([97.5, 150, 0])connectorLE45mm(length=h);

        translate([0, 7.5, 0])rotate([0, 0, 90])connectorLE45mm(length=h);
        translate([0, 142.5, 0])rotate([0, 0, 90])connectorLE45mm(length=h);

        translate([105, 7.5, 0])rotate([0, 0, 90])connectorLE45mm(length=h);
        translate([105, 142.5, 0])rotate([0, 0, 90])connectorLE45mm(length=h);
    }
}

module connectorLE45mm(length=45) {
    difference() {
    
        translate([20, 0, 7.0])rotate([90, 0, 0])import("fischertechnik_double_flat_connector/files/Connector_45mm_v1.stl");
        translate([0, 0, 45-(45-length)/2])cube([200, 200, 45-length], center=true);
    }
}
