
module keyway(len, width, depth, shaftRadius, shaftLen, hand){

	if(hand > 0){
 translate([-1*(width/2),shaftRadius-depth, shaftLen-len]){

	 		cube(size=[width,width,len]);
	}
	}else{
 translate([-1*(width/2),shaftRadius-depth, 0]){
	 		cube(size=[width,width,len]);
	}
}
   
}

//creates a stepped spindle with bearing surfaces, keyed shaft ends
module spindle(spindleW, spindleR, bearingW, bearingR, stepW, stepR, rotationVector, posVector){
	rotate(rotationVector)
	translate(posVector)
	union() {
	
	cylinder(h=spindleW, r=spindleR,$fn=100);
	//bearing steps
	translate([0,0,spindleW]) cylinder(h=bearingW, r=bearingR, $fn=100);
	translate([0,0,-1*bearingW]) cylinder(h=bearingW, r=bearingR, $fn=100);
    
    //spindle end steps
	translate([0,0,spindleW+bearingW]) {
		//difference() {
			cylinder(h=stepW, r=stepR, $fn=100);
			keyway(1.75,0.5,0.25,stepR, stepW, 1);
		//}
	}
	translate([0,0,-1*(bearingW+stepW)]){
	 //difference() {
	  cylinder(h=stepW, r=stepR, $fn=100);
	  keyway(1.75,0.5,0.25,stepR, stepW, 0);
	// }
 }
}
}

//draw a pair of rolling spindles
translate([5,0,4]){
	spindle(6,3,2,2,2,1,[90,0,0],[0,6.1,0]);
	spindle(6,3,2,2,2,1,[90,0,0],[0,0,0]);
}

cube([2.5,2,16]);
translate([7.5,0,0]){
cube([2.5,2,16]);
}
translate([0,0,16]){
cube([2.5+7.5,2,2]);
}