include<peg.scad>;

wera7400();
module wera7400(t = 4, rounding = 5)
{
    d = 10; // loosly fit 1/4" bit extender

    H = 25 + t;
    W = 40;
    L = 49.5;
    translate([ 0, W / 2, H / 2 ]) pegs(2);
    difference()
    {
        minkowski()
        {
            l = L - 2 * rounding;
            w = W - rounding;
            translate([ -l / 2, rounding / 2 - w / 2, rounding ]) cube([ l, w, H - 2 * rounding ]);
            difference()
            {
                sphere(r = rounding);
                translate([ -rounding - .01, 0, -rounding - .01 ]) cube(2 * rounding + .02);
            }
        }
        translate([ 0, 0, -.01 ]) cylinder(h = H + .02, d = d);
        translate([ 0, 0, H - rounding ]) cylinder(h = rounding + .02, d1 = d, d2 = d + 2 * rounding);
    }
}
