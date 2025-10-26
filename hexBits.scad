include<hexHolder.scad>;
difference()
{
    for (i = [0:4])
    {
        translate([ i / 4 * pegSpacingX, 0, 0 ])
            verticalHexHolder([ 6.35, 6.35, 6.35, 6.35, 6.35, 6.35 ], 2, width = pegSpacingX / 4);
    }
    translate([ pegD / 2, 0, -.01 - pegD / 2 ]) cube([ pegSpacingX - pegD, 10, pegD + pegSpacingY + .02 ]);
}
