/**
 * Create an adapter for connecting a 15x15 square tube to Fischertechnik.
 *
 * @author Brian Schroeder
 * @since 21.04.2020
 */

/* [End Cap length] */
// Fischertechnik compatible end cap length in millimeters
EndCapLength=15; // [15, 30, 45, 60, 75, 90]

include <ft-block.scad>;

ftBlock(Length=EndCapLength);
