/**
 * Remix of Single part case 12864 LCD Full Graphic Smart Display on Thingiverse: http://www.thingiverse.com/thing:3212330
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
    
    w = 105;
    h = 37.5;
    d = 105;
    b = 2.5;
    f = 6.5;
    s = 7.5;
    r = 15;

    difference() {
        union() {
            
            difference() {
                
                import("Single_part_case_12864_LCD_Full_Graphic_Smart_Display/files/v2_Single_part_case_12864_LCD_Full_Graphic_Smart_Display.stl");
                translate([0, 0, 50])cube([120, 105, 60], center=true);
            }
            
            // border
            //translate([0, 0, h/2])cube([w - 2*b, d - 2*b, h], center=true);

            // frame on front
            translate([0, 0, b/2])difference() {
                cube([w, d, b], center=true);
                cube([w - 2*f, d - 2*f, h], center=true);
            }

            // front and rear connectors
            connectorCount = 7;
            offsetX = -w/2 + 7.5;
            offsetYFront = d/2 - 7.5;
            offsetYRear = -d/2 + 7.5;
            for(i = [0:1:connectorCount - 1]) {
                translate([offsetX + 15*i, offsetYFront, h/2])rotate([0, 0, -90])ftConnector(Length=h);
                translate([offsetX + 15*i, offsetYRear, h/2])rotate([0, 0, 90])ftConnector(Length=h);
            }

            // left and right connectors
            connectorLRCount = 7;
            offsetY = -d/2;
            offsetXLeft = w/2 - 7.5;
            offsetXRight = -w/2 + 7.5;
            for(i = [0:1:connectorLRCount - 1]) {
                translate([offsetXLeft, offsetY + 15*i + 7.5, h/2])rotate([0, 0, 180])ftConnector(Length=h);
                translate([offsetXRight, offsetY + 15*i + 7.5, h/2])rotate([0, 0, 0])ftConnector(Length=h);
            }
        }

        // slot at rear
        translate([0, -d/2, h - s/2])rotate([0, 0, 90])cube([15, w - 30, s], center=true);
        
        // SD-slot at left
        translate([-w/2 -b-2.2, -7.5, h/2 - r/2 + 3.5])cube([22.5, d - 75, r], center=true);
        
    }
}

module ftConnector(Length) {
    difference() {
        ftConnectFti2(Length=Length);
        cube([4, 15, Length], center=true);
    }
}
    