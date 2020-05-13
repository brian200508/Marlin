/**
 * Create an adapter for connecting a GT2 pulley to Fischertechnik axis with 4mm diameter.
 *
 * @author Brian Schroeder
 * @since 12.05.2020
 */

module axisAdapter5mmTo4mm() {

    difference() {
        
        height=15;
        hHole=1;
        dOuter=5;
        dInner=4;
        dHole=4;
        dGap=1;
        rOuter=dOuter/2;
        rInner=dInner/2;
        hHoleCenter=height/2 - hHole - dHole/2;
        cylinder(r=rOuter, h=height, center=true);
        cylinder(r=rInner, h=height, center=true);
        translate([0, 0, hHoleCenter])translate([rOuter/2, 0, 0])cube(size=[rOuter, dHole, dHole], center=true);
        translate([0, 0, hHoleCenter])rotate([0, 0, 90])translate([rOuter/2, 0, 0])cube(size=[rOuter, dHole, dHole], center=true);
        rotate([0, 0, 225])translate([rOuter/2, 0, 0])cube(size=[rOuter, dGap, height], center=true);
    }
}

axisAdapter5mmTo4mm();
