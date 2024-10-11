// tantillus - carrige
// x,y 48mm
// distance between rods 17mm

body_x=48;
body_y=48;
body_z=40;

bushing_outer_diameter=15;
bushing_length=48.1;
$fn=60;

color("SteelBlue") carrige(body_x, body_y, body_z,
               bushing_outer_diameter, bushing_length);

module carrige(body_x, body_y, body_z,
               bushing_outer_diameter, bushing_length)
{
    difference()
    {
        body(body_x,body_y,body_z);
        union()
        {
            // bushings
            translate([(body_x/2)-5.5-bushing_outer_diameter/2,0,-17/2]) rotate([90,0,0]) bushing(bushing_outer_diameter, bushing_length);
            
            translate([0,(body_y/2)-6.5-bushing_outer_diameter/2,17/2]) rotate([90,0,90]) bushing(bushing_outer_diameter, bushing_length);
           
            // mount holes
            hotend_mount_holes();
        }
    
            // postprocessing - rounding
        external_radious=14;
        translate([external_radious/2 +body_x/2,-external_radious +body_y/2,-external_radious +body_z/2]) rotate([0,-90,0])createSubtractor(body_z+20, external_radious);  
        
        translate([-external_radious/2 -body_x/2,-external_radious +body_y/2,-external_radious +body_z/2]) rotate([-180,-90,0])createSubtractor(body_z+20, external_radious);
        
     translate([22,-34,-16]) rotate([0,0,90])
     {   
        external_radious=12;
        translate([0+external_radious/2 +body_x/2,-external_radious +body_y/2,-1-external_radious +body_z/2]) rotate([0,-90,0])createSubtractor(body_z+20, external_radious);  
        external_radious=14;
        translate([-external_radious/2 -body_x/2,2-external_radious +body_y/2,-1-external_radious +body_z/2]) rotate([-180,-90,0])createSubtractor(body_z+22, external_radious);
  
         }
     
     }
}


module body(x,y,z)
{
    difference()
    {
        union()
        {
            rCube(x,y,z);
           //cube(size = [x,y,z], center=true);
        }
        union()
        {   // top cut
            z_to_cut=(z-6)/2;
            y_to_cut=(y-6)/2;
            translate([0,-(y/2-y_to_cut/2),(z/2-z_to_cut/2)]) cube(size = [x,y_to_cut,z_to_cut], center=true);
            // bottom cut
            
            bottom_z_to_cut=12;
            bottom_y_to_cut=(y-6)/2;
            bottom_x_to_cut=(x-4)/2;
                         translate([-(x/2-bottom_x_to_cut/2),-(y/2-bottom_y_to_cut/2),(z-bottom_z_to_cut)-z_to_cut-bottom_z_to_cut]) cube(size = [bottom_x_to_cut,bottom_y_to_cut,bottom_z_to_cut], center=true);
        }
    }
}

module bushing(d,h)
{
    cylinder(h = h, r=d/2, center=true);
    
}

module hotend_mount_holes()
{
    translate([-20,-20,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
    translate([-20,-20,-9]) rotate([0,0,0]) cylinder(h = 5, r=7.1/2, center=true);
    
    translate([-20,-7,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
    translate([-20,-7,-9]) rotate([0,0,0]) cylinder(h = 5, r=7.1/2, center=true);

    translate([-6,-7,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
    translate([-6,-7,-9]) rotate([0,0,0]) cylinder(h = 5, r=7.1/2, center=true);

    translate([-6,-20,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
    translate([-6,-20,-9]) rotate([0,0,0]) cylinder(h = 5, r=7.1/2, center=true);

//cables
        translate([-13,-6,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
        translate([-5,-13.5,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);
        translate([-21,-13.5,0]) rotate([0,0,0]) cylinder(h = 60, r=2, center=true);


    translate([-13,-13.5,0]) rotate([0,0,0]) cylinder(h = 60, r=4, center=true);

}


/////////////// utilities


module rCube(x,y,z,r=3)//Create a cube and subtract the 4 corners 
{
   translate([-x/2,-y/2,-z/2]) difference()
    {
        cube([x,y,z]);
        translate([x-r,y-r]) rotate(0) createSubtractor(z,r);  
        translate([r,y-r]) rotate(90) createSubtractor(z,r);
        translate([r,r]) rotate(180) createSubtractor(z,r);
        translate([x-r,r]) rotate(270) createSubtractor(z,r);
    }
}

module createSubtractor(h,radius) 
{
    difference()
    { 
        cube([radius+0.1,radius+0.1,h] ); cylinder(h=h,r=radius+0.1,$fn = 50); 
    } //+0.1 stops ghost edges
}
