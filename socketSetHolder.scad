include<peg.scad>;

l1 = 12;
l2 = 20.5;
y1 = 3.5;
y2 = 5;

t = 1;

peg();

translate([ 0, -y2/2-t, 0 ]) difference()
{
    cube([ l2 + 2 * t, y2 + 2 * t, pegD ], center = true);
    cube([ l1, y2, pegD + .02 ], center = true);
    translate([ 0, (y2 - y1) / 2 - y2 / 2, 0 ]) cube([ l2, y2 - y1, pegD + .02 ], center = true);
}
