/** Stabilize two 15x15 square tubes connected in an angle of 90 degrees.
 *
 * @author Brian Schroeder
 * @since 02.09.2020
 */

rotate([-90, -45, 0])ftSpuareTubeStabilizer15x15_30();

module ftSpuareTubeStabilizer15x15_30(overlap=15) {

    totalLength = 30 + overlap;
    offsetConn = totalLength / 2;

    difference() {
        union() {
            cube(size= [totalLength, totalLength, 15]);
            translate([offsetConn, 0, 0]) ftConnetor30();
            translate([totalLength, 7.5, 0]) rotate([0, 0, 90]) ftConnetor30();
        }

        rotate([0, 0, 45]) cube(size = [totalLength * 2, totalLength * 2, 15]);
    }
}

module ftConnetor30() {

    translate([0, 0, -2.5])rotate([90, 90, 0])
    import("Connector_30mm_v1.stl");
    //import("storage/emulated/0/Android/data/vn.vhn.vsc/files/Marlin/docs/brsc/FTI-2.0.x/custom-parts/ft-square-tube-stabilizer/Connector_30mm_v1.stl");
}



