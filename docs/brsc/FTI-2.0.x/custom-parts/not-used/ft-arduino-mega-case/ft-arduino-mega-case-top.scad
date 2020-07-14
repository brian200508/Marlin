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
    union() {
        translate([2.5, 0, 0])import("Arduino-Mega-Case/files/Deckel_Arduino_Mega.stl");

        //translate([7.5, 0, 50])connector45mm();
        translate([97.5, 0, 50])connector45mm();

        //translate([7.5, 150, 50])connector45mm();
        translate([97.5, 150, 50])connector45mm();

        //translate([0, 7.5, 50])rotate([0, 0, 90])connector45mm();
        //translate([0, 142.5, 50])rotate([0, 0, 90])connector45mm();

        translate([105, 7.5, 50])rotate([0, 0, 90])connector45mm();
        translate([105, 142.5, 50])rotate([0, 0, 90])connector45mm();
    }
}

module connector45mm() {
    translate([20, 0, 7.5])rotate([90, 0, 0])import("fischertechnik_double_flat_connector/files/Connector_45mm_v1.stl");
}