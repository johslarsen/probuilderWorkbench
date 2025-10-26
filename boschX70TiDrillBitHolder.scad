include <peg.scad>;

// thick enough to block pivoting, but thin enough so it is enough to push the top endcap up to unblock it
pivotBlocker = (pegD - pegSlot) / 2;

od = 16.5;

pivotD = 7.5;
pivotH = 9;
pivotLip = 2; // extrusion at the edge is a bit wider then the rest

pivotOffset = 226;
height = (4 * pegSpacingY - pivotOffset) / 2 + pivotBlocker;

width = pegSpacingX + pegSlot;
rounding = 3;

endCap();
module endCap()
{
    pegs(2);
    difference()
    {
        hull()
        {
            rotate([ 90, 0, 0 ])
            {
                translate([ pegSlot / 2 - width / 2, pegSlot / 2 - pegD / 2, 0 ]) cylinder(h = .01, d = pegSlot);
                translate([ width / 2 - pegSlot / 2, pegSlot / 2 - pegD / 2, 0 ]) cylinder(h = .01, d = pegSlot);
                translate([ pegSlot / 2 - width / 2, height - pegSlot / 2, 0 ]) cylinder(h = .01, d = pegSlot);
                translate([ width / 2 - pegSlot / 2, height - pegSlot / 2, 0 ]) cylinder(h = .01, d = pegSlot);
            }
            translate([ rounding - od / 2, rounding - od, rounding - pegD / 2 ]) sphere(r = rounding);
            translate([ od / 2 - rounding, rounding - od, rounding - pegD / 2 ]) sphere(r = rounding);
            translate([ rounding - od / 2, rounding - od, height - rounding ]) sphere(r = rounding);
            translate([ od / 2 - rounding, rounding - od, height - rounding ]) sphere(r = rounding);
        }

        translate([ 0, -od / 2, height - pivotH - pivotBlocker ])
        {
            cylinder(h = pivotH, d = pivotD);
            translate([ 0, 0, pivotH - pivotLip ]) cylinder(h = pivotLip + .02, d1 = pivotD, d2 = pivotD + pivotLip);
        }
        translate([ -od / 2, -od - .01, height - pivotBlocker ]) cube(od + .02);
    }
}
