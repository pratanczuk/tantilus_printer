
$fs=0.1;
$fa=2;

difference()
{
    cube([42.5,25,15], center=true);
    union()
    {
        translate([0,0,2]) cylinder(r=11,h=13, center=true);
        translate([0,0,3]) cylinder(r=6,h=25, center=true);
        hull()
        {
            translate([17,0,0]) cylinder(r=2.3,h=20, center=true);
            translate([14,0,0]) cylinder(r=2.3,h=20, center=true);
        }
        hull()
            {
             translate([-17,0,0]) cylinder(r=2.3,h=20, center=true);
            translate([-14,0,0]) cylinder(r=2.3,h=20, center=true);
            }
        }
}