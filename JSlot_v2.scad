

$fs=0.2;
$fa=2;
height=4.64+4.76;
fillet = 2;
bigR = 29.5;
littleR = 20;
punchHeight=20;
smooth = 100;




	//J_insert();
  




module J_insert(){
	color("red") difference(){
		//cylinder(h=height-0.2,r=littleR-0.05);
        translate([0,0,4.5]) cube([littleR*2,littleR*2,height], center=true);
		translate([-13.15,7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([-13.15,-7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([12.75,7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([12.75,-7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		
		translate([-13.15,7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([-13.15,-7.1,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([12.75,7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([12.75,-7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		
		translate([-13.15,7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([-13.15,-7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([12.75,7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([12.75,-7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);

   	    translate([8,-12,-0.1]) rotate([0,0,270]) J_hole();
	}
}

module J_hole() {
	  	translate([1.3,0,-0.1]) cylinder(h=punchHeight,r=12/2,center=true);
		translate([1.3,0,4.64]) cylinder(h=5,r=15.875/2);
		//translate([10,0,-0.1]) cylinder(h=punchHeight,r=15.875/2,center=true);
		translate([11.05,0,-0.1]) cube([22,11.35,punchHeight],center=true);
		translate([.8,-15.7/2,4.64]) cube([22,15.7,5]);

}