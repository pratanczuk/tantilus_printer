$fs=0.2;
$fa=2;

difference()
{
    cube([60,20,3],center=true);
    
    translate([20,4.5,0]) 
    hull()
    { 
        translate([-3,0,0])cylinder(r=1.6,h=4,center=true);
        translate([3,0,0])cylinder(r=1.6,h=4,center=true);
    } 
    translate([20,-4.5,0])    hull()
    { 
        translate([-3,0,0])cylinder(r=1.6,h=4,center=true);
        translate([3,0,0])cylinder(r=1.6,h=4,center=true);
    } 
    
union()
    translate([-25,0,0]){
    
        translate([0,4.5,0]) hull()
        {
            cylinder(r=1.6,h=4,center=true); 
            translate([15,0,0])cylinder(r=1.6,h=4,center=true); 
        }       
        translate([0,-4.5,0]) hull()
        {
            cylinder(r=1.6,h=4,center=true); 
            translate([15,0,0])cylinder(r=1.6,h=4,center=true); 
        }       
     }
}