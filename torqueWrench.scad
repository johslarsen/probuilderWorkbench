include<peg.scad>;
d14 = 16.5;
l14 = 28;
d38 = 23;
l38 = 33.5;

t = 3;
margin = 0.4;
h = t + d38 / 2;

module cradle(d, l)
{
    difference()
    {
        w = d + 2 * t;
        L = l + 2 * t;
        translate([ 0, -w, 0 ]) cube([ L, w, h ]);
        translate([ t + l / 2, -w / 2, -.01 ]) cylinder(h = h + .02, d = d);
        translate([ t + l / 2 - d / 2, -w - .01, -.01 ]) cube([ d, w / 2, h + .02 ]);
        hull()
        {
            translate([ t + d / 2, -w / 2, h ]) sphere(d = d);
            translate([ L - t - d / 2, -w / 2, h ]) sphere(d = d);
        }
    }
}
cradle(d14, l14);
translate([l14+2*t,0,0]) cradle(d38, l38);

translate([ pegD / 2, 0, h - pegD / 2 ]) peg();
translate([ pegD / 2 + pegSpacingX, 0, h - pegD / 2 ]) peg();
translate([ pegD / 2 + 2 * pegSpacingX, 0, h - pegD / 2 ]) peg();

L = pegD + 2 * pegSpacingX;
x = l14 + l38 + 4 * t;
w38 = d38 + 2 * t;
translate([ x, -w38, 0 ]) cube([ L - x, w38, h ]);

p38 = 3 / 8 * 25.4 - margin;
p14 = 25.4 / 4 - margin;
translate([ x, -w38 / 4 - p14 / 2, h ]) cube(p14);
translate([ x, 3 * -w38 / 4 - p14 / 2, h ]) cube(p14);
translate([ L - p38, -w38 / 2 - p38 / 2, h ]) cube(p38);
