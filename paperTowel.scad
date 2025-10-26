include<peg.scad>;

dOut = 110;
dIn1 = 40;
dIn2 = 20; // slightly less than 1.5"?

height = 1.5 * pegSpacingX;
thickness = 2.4;
taper = 3 / 4 * dIn2;

width = pegSpacingX + pegSlot;

towelHolder();
module towelHolder(t = thickness)
{
    module base(l, w, h, r)
    {
        hull()
        {
            translate([ -l / 2, -0.01, 0 ]) cube([ l, 0.01, h ]);
            translate([ 0, r - w, 0 ]) cylinder(h = h, r = r);
        }
    }
    pegs(2);
    difference()
    {
        union()
        {
            difference()
            {
                translate([ 0, 0, -pegD / 2 ]) base(width, dOut / 2 + dIn1 / 2, pegD, dIn1 / 2);
                translate([ 0, -t, -pegD / 2 - .01 ])
                    base(width - 2 * t, dOut / 2 + dIn1 / 2 - 2 * t, pegD - t, dIn1 / 2 - t);
            }
            translate([ 0, -dOut / 2, pegD / 2 ]) cylinder(h = height, d1 = dIn1, d2 = dIn2);
            translate([ 0, -dOut / 2, -pegD / 2 ]) cylinder(h = pegD, d = dIn1);
        }
        translate([ 0, -dOut / 2, -pegD / 2 - .01 ]) cylinder(h = pegD + .01, r = dIn1 / 2 - t);
        translate([ 0, -dOut / 2, pegD / 2 - .01 ])
            cylinder(h = height - t + .01, r1 = dIn1 / 2 - t, d2 = dIn2 - 2 * t);
    }
}
