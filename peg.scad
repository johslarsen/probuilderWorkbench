pegSlot = 5; // the small opening it slides into
pegD = 9;    // the large opening to put it into
pegH = 22;   // top of large opening to bottom of small opening

holeD = 3.75; // "screw" holes

holeSpacingX = 15;
holeSpacingY = 14.5; // yes, this is actually not a grid. go figure
pegSpacingX = 3 * holeSpacingX;
pegSpacingY = 4 * holeSpacingY;

module peg(t = 2, clearance = 2)
{
    D = pegD;
    d = 4.5;

    rotate([ -90, 0, 0 ])
    {
        hull()
        {
            translate([ 0, (D - d) / 2, 0 ]) cylinder(h = clearance, d = d);
            translate([ 0, -(D - d) / 2, 0 ]) cylinder(h = clearance, d = d);
        }
        translate([ 0, 0, clearance ]) cylinder(h = t, d = D);
    }
}

module pegs(n, t = 2, clearance = 2)
{
    pegSpacingX = 45;
    x0 = ((1 - n) * pegSpacingX) / 2;
    for (i = [0:(n - 1)])
    {
        translate([ x0 + i * pegSpacingX, 0, 0 ]) peg(t, clearance);
    }
}
