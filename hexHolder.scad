include <peg.scad>;

function subsum(list, i, n) = i < n ? list[i] + subsum(list, i + 1, n) : 0;

module hexHolder(radiuses, pegs, spacing, depth, margin, t, pegSpacing, width = pegD)
{
    hole = (25.4 / 4 + 2 * margin) * 2 / sqrt(3);
    H = t + depth;

    l = subsum(radiuses, 0, len(radiuses)) + spacing * (len(radiuses) - 1) - radiuses[0] / 2 -
        radiuses[len(radiuses) - 1] / 2;
    L = pegD + (pegs - 1) * pegSpacing;

    difference()
    {
        translate([ -width / 2, -H, -pegD / 2 ]) cube([ width, H, L ]);

        for (i = [0:len(radiuses) - 1])
        {
            z = (L - l) / 2 - pegD / 2 - radiuses[0] / 2 + i * spacing + subsum(radiuses, 0, i + 1) - radiuses[i] / 2;
            translate([ 0, -t, z ]) rotate([ 90, 90, 0 ]) cylinder(h = H, d = hole, $fn = 6);
        }
    }
}

module verticalHexHolder(radiuses, pegs, spacing = 5, depth = 16, margin = 0.2, t = 2, width=pegD)
{
    for (i = [0:pegs - 1])
        translate([ 0, 0, i * pegSpacingY ]) peg(t);
    hexHolder(radiuses, pegs, spacing, depth, margin, t, pegSpacingY, width);
}

module horizontalHexHolder(radiuses, pegs, spacing = 5, depth = 16, margin = 0.2, t = 2, width = pegD)
{
    for (i = [0:pegs - 1])
        translate([ i * pegSpacingX, 0, 0]) peg(t);
    rotate([0,90,0]) hexHolder(radiuses, pegs, spacing, depth, margin, t, pegSpacingX, width);
}
