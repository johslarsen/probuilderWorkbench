include<peg.scad>;

sizes = [ [ 60, 80 ], [ 70, 100 ], [ 80, 120 ], [ 100, 150 ], [ 120, 180 ] ];

margin = 10;
angle = 5;
thickness = 1;

width = 20;

box();
module box(t = thickness)
{
    L = 2 * t + margin + sizes[len(sizes) - 1][0];
    H = t + sizes[len(sizes) - 1][1];
    W = 2 * t + width;
    echo(W);
    difference()
    {
        union()
        {
            cube([ L, W, H ]);
            for (i = [0:len(sizes) - 2])
            {
                bagH = t + sizes[i][1];
                rotate([angle*(len(sizes)-i-1), 0, 0 ]) cube([ 2 * t + margin + sizes[i][0], W, bagH ]);
            }
        }
        translate([ t, t, t ]) cube([ L - 2 * t, W - 2 * t, H - t + .01 ]);
            for (i = [0:len(sizes) - 2])
            {
                bagH = t + sizes[i][1];
                translate([t,t,t]) rotate([ angle*(len(sizes)-1-i), 0, 0 ]) cube([margin + sizes[i][0], W - 2*t, bagH+.01 ]);
            }
    }
    translate([L/2,W,H - 10]) pegs(3);
}
