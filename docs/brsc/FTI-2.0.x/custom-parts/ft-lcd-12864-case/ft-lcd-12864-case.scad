/**
 * Remix of Single part case 12864 LCD Full Graphic Smart Display on Thingiverse: http://www.thingiverse.com/thing:3212330
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
        
        import("Single_part_case_12864_LCD_Full_Graphic_Smart_Display/files/v2_Single_part_case_12864_LCD_Full_Graphic_Smart_Display.stl");

        connectorCount = 7;
        offsetRear = 52.5;
        offsetRearZ = 18.6;
        offsetFront = offsetRear - 90;
        offsetX = 52.5;
        
        // front connectors
        for(i = [1:1:connectorCount]) {
            rotate([-15, 0, 0])translate([offsetX -15*i + 7.5, -offsetFront +7.5, offsetRearZ + 1.9])connectorShortened(shortenBy=3);
        }

        // rear
        rotate([-15, 0, 0])translate([0, -42.6, 18.6])cube([97.4, 5, 15], center=true);  

        // rear connectors
        for(i = [1:1:connectorCount]) {
            rotate([-15, 0, 0])translate([offsetX -15*i + 7.5, -offsetRear +7.5, offsetRearZ])connector15mm();
        }
    }
}

module connector15mm() {
    rotate([90, 0, 0])import("fischertechnik_double_flat_connector/files/Connector_15mm_v1.stl");
}

module connectorShortened(shortenBy=7.5) {
    
    difference() {
        rotate([90, 0, 0])import("fischertechnik_double_flat_connector/files/Connector_15mm_v1.stl");
        translate([0, 0, 15-shortenBy])cube([15, 15, 15], center=true);
    }
}