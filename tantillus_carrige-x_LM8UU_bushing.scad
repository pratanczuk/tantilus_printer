// tantillus - carrige

// distance between rods 17mm - for oryginal tantillus, 18mm for t-slot version

// j-head params
$fs=0.2;
$fa=2;
height=4.64+4.76;
fillet = 2;
bigR = 29.5;
jhead_plate = 27.2;
punchHeight=20;
smooth = 100;
//

body_x=44;
body_y=44;
body_z=40;
body_base_z=10;

bushing_outer_diameter=15.02;
bushing_inner_diameter = 15.02;
bushing_length=44;
$fn=60;

t_slot_z_shift=1; // 0 - for o Tantilius, 1 for t-slot  https://github.com/goopyplastic/tslot-tantillus

	//mirror([1,0,0]) translate([-14,-9,8]) rotate([0,180,0]) hotend_jhead();

	//mirror([1,0,0])rotate([0,0,-90])translate([-jhead_plate/2+body_x/2, jhead_plate/2-body_y/2,-1]) J_insert();
    
mirror([1,0,0])  color("SteelBlue")  translate([0,0,20]) carrige(body_x, body_y, body_z,body_base_z, bushing_outer_diameter, bushing_length);

module carrige(body_x, body_y, body_z,body_base_z,
               bushing_outer_diameter, bushing_length)
{

    difference() 
    {
 
            union()
            {
                difference() 
                {
                    union()
                    {
                        translate([0,0,1-bushing_outer_diameter/2]) body(body_x,body_y,body_z,body_base_z);
                        translate([(body_x/2)-3-bushing_outer_diameter/2,0,0]) rotate([90,0,0]) cube([bushing_outer_diameter+6+0.1,bushing_outer_diameter+6+0.1,bushing_length],center=true);
                        }
                        union()
        {
           translate([0,(body_y/2)-3-bushing_outer_diameter/2,-1]) rotate([90,0,90]) bushing(bushing_outer_diameter, bushing_length+0.3, with_hole=0);

            // bushings
            translate([(body_x/2)-5.5-bushing_outer_diameter/2,0,16+ t_slot_z_shift]) rotate([90,0,0]) bushing(bushing_outer_diameter, bushing_length,with_hole=0);
            
           
         
        }
    
  
    }
    difference()
    {    
        union()
        {
            translate([0,(body_y/2)-3-bushing_outer_diameter/2,-1]) rotate([90,0,90]) bushing(bushing_outer_diameter, bushing_length+0.1,with_hole=1); 
    
          translate([(body_x/2)-3-bushing_outer_diameter/2,0,16+t_slot_z_shift]) rotate([90,0,0]) bushing(bushing_outer_diameter, bushing_length,with_hole=1);

  
        }
        // top bushings clearance
        translate([(body_x/2)-3-bushing_outer_diameter/2,0,16+t_slot_z_shift]) rotate([90,0,0]) cylinder( r=bushing_inner_diameter/2, h=bushing_length,center=true);

        }    
    
}
    // mount holes
    translate([4.5,3.5,5])j_head_hotend_mount_holes();

     rotate([0,35,0]) translate([21,-11,body_base_z/2 ]) cube([20,24,40],center=true);  
}

}

module body(x,y,z,body_base_z)
{
    difference()
    {
        union()
        {
            //rCube(x,y,body_base_z);
            cube([x,y,body_base_z],center=true);
           
        }
        union()
        {   
           
        }
    }
}

module bushing(d,h, with_hole, basement_z)
{
    bushing_outer_dia= d+6;
    difference()
    {
        hull()
        {
            cylinder(h = h, r=(bushing_outer_dia/2), center=true);
            translate([0,-10,0]) cylinder(h = h, r=bushing_outer_dia/2, center=true);
    
        }
        union()
        {
            cylinder(h = h+0.1, r=with_hole *(d/2), center=true);
            translate([0,-bushing_outer_dia+1,0]) cube([bushing_outer_dia+0.1,bushing_outer_dia+0.1,h+0.1],center=true);
        }
    }
    
}

module j_head_hotend_mount_holes()
{
    translate([-18.5,-3,0]) rotate([0,0,0]) cylinder(h = 60, r=1.80, center=true);
    translate([-18.5,-3,-7+7.5]) rotate([0,0,0]) cylinder(h = 20, r=2.8, center=true);
    
    translate([-18.5,-22,0]) rotate([0,0,0]) cylinder(h = 60, r=1.8, center=true);
    translate([-18.5,-22,-7]) rotate([0,0,0]) cylinder(h = 5, r=2.8, center=true);
    
    translate([-6.5,-12.5,0]) rotate([0,0,0]) cylinder(h = 60, r=1.8, center=true);
    translate([-6.5,-12.5,-7]) rotate([0,0,0]) cylinder(h = 5, r=2.8, center=true);

    translate([-6.2,-21,0]) rotate([0,0,0]) cylinder(h = 60, r=2.5, center=true);
    translate([-6.2,-3,0]) rotate([0,0,0]) cylinder(h = 60, r=2.5, center=true);
    
    //bowden
    translate([-19,-12.5,0]) rotate([0,0,0]) cylinder(h = 60, r=6, center=true);
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


    translate([-13,-13.5,0]) rotate([0,0,0]) cylinder(h = 60, r=2.5, center=true);

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
        #cube([radius+0.1,radius+0.1,h] ); cylinder(h=h,r=radius+0.1,$fn = 50); 
    } //+0.1 stops ghost edges
}


module J_insert(){
	color("red") difference(){
		//cylinder(h=height-0.2,r=littleR-0.05);
        translate([0,0,4.5]) cube([jhead_plate,jhead_plate,height], center=true);
        
        
        // cables
        translate([9,7,5]) cylinder(h=punchHeight,r=2.5,center=true);
        translate([-8.5,7,5]) cylinder(h=punchHeight,r=2.5,center=true);
		//screws
        translate([0.5,6,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([-9,-5.6,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([10,-5.5,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);

		
		
		translate([0.5,6,1.1]) cylinder(h=4.1,r=6.15/2,center=true, $fn=6);
		translate([-9,-5.6,1.1]) cylinder(h=4.1,r=6.15/2,center=true, $fn=6);
		translate([10,-5.5,1.1]) cylinder(h=4.1,r=6.15/2,center=true, $fn=6);


   	    translate([0.5,-5,-0.1]) rotate([0,0,270]) J_hole();
	}
}

module J_hole() {
	  	translate([1.3,0,-0.1]) cylinder(h=punchHeight,r=12/2,center=true);
    //#translate([1.3,0,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		//translate([10,0,-0.1]) cylinder(h=punchHeight,r=15.875/2,center=true);
		translate([11.05,0,-0.1]) cube([22,11.35,punchHeight],center=true);

		translate([1.3,0,5.10]) cylinder(h=5,r=15.875/2);
		translate([.8,-15.7/2,5.10]) cube([22,15.7,5]);

}


// for visualization only



module hotend_jhead() {
	color("black") translate([0,0,0])  jhead_plastic_body();
	translate([0,0,40]) jhead_brass_nozzle();
}

module jhead_plastic_body() {
	cylinder(h=40,r=4);
	intersection() {
	difference() {
		cylinder(h=40,r=8);
		translate([0,0,4.67]) jhead_groovemount_cutout();
	
		// add the wrench flats
		translate([0,0,32]) jhead_wrench_cutout();
		
		// add (crappy) cooling grooves
		translate([0,0,11.80]) jhead_cooling_cutout();
		translate([0,0,15.00]) jhead_cooling_cutout();
		translate([0,0,18.07]) jhead_cooling_cutout();
		translate([0,0,21.20]) jhead_cooling_cutout();
		translate([0,0,24.50]) jhead_cooling_cutout();
	}
	// get the rounded bit at the end
	sphere(r=40);
	}
}

module jhead_groovemount_cutout() {
	 difference() {
		cylinder(h=4.67,r=10);
		cylinder(h=4.67,r=6);
	}
}

module jhead_wrench_cutout() {
	 difference() {
		translate([-10,-10,0]) cube([20,20,8]);
		translate([-6,-10,0])  cube([12,20,8]);
	}
}

module jhead_cooling_cutout() {
	render() difference() {
		difference() {
			cylinder(h=2.20,r=10);		
			translate([-1,-10,0]) cube([2,20,2.2]);
			translate([-10,-1,0]) cube([20,2,2.2]);
		}
		cylinder(h=2.20,r=3.9);
	}
}

module jhead_brass_nozzle() { 
	// heater body 12.65 x 12.65 x 8
	//
	//
	difference() {
	 union() {
	// draw the cylinder and cap it with the nozzle
	color("DarkKhaki") translate([0,0,0])     cylinder(h=9.60, r=3.95);
	color("DarkKhaki") translate([0,0,9.6])   cylinder(h=2.25, r1=3.95, r2=1.33);
	color("Silver")translate([-6.3,-4,0]) cube([12.6,12.6,8]);
	}
    
	 color("Silver") translate([6.4,5,4]) rotate([0,270,0]) cylinder(h=12.8,r=3.125);
	}
}