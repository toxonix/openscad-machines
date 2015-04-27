
//dovetail, defaults to x-plane.
module dovetail(width, depth, angle, len){
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

// t-slot with throat width, throat depth,
// headspace width, headspace depth, and
// overall length.
// default orientation in the x-plane.
module tslot(throat_w, throat_d, hs_w, hs_d, len){
	
	//the heaspace area
	cube([len, hs_w, hs_d]);

	//the bolt channel. 
	translate([0,(-throat_w/2)-(-hs_w/2),hs_d-0.01])
	cube([len, throat_w, throat_d]);
	
}

//example
//creates a block with slots. 

difference(){
color("blue")
cube([10,10,10]);

translate([-1,2,9])
tslot(1,1,2,0.5,12);

translate([-1,6,9])
dovetail(2,5,60,12);

rotate(90,[1,0,0])
translate([-1,2.5,-1])
dovetail(3,2,60,12);

rotate(90,[1,0,0])
translate([-1,7,-0.9])
tslot(0.5,0.5,1,0.5,12);

rotate(90,[1,0,0])
mirror([0,1,1,])
translate([-1,2.5,-1])
dovetail(5,2,40,12);

rotate(180,[1,0,0])
mirror([0,1,1])
translate([-1,6,9.5])
dovetail(2,1,60,12);

rotate(180,[1,0,0])
mirror([0,1,1])
translate([-1,2.5,7])
tslot(1.5,3,3,1,12);
}

//you can also make a t-nut by threading a hole through a un-subtracted t-slot.
translate([0,12,0])
tslot(0.5,0.5,1,0.5,1);