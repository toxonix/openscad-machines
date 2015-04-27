

module dovetail(len, width, depth, angle){
	difference(){
	cube([len,width,depth]);

	rotate(angle, [1,0,0])
		cube([len,depth+1,depth]);
	
	translate([0,width,0])
	mirror([0,1,0])
	rotate(angle, [1,0,0])
		cube([len,depth+1,depth]);		
 	}
}

//creates a 50 degree dovetail, 8" long, 5 wide, 1" depth.
//dovetail(8,5,1,50);
