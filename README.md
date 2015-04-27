# openscad-machines
CAD files for machine drawings

There are a few modules for designing parts and machines. As I modularize more generic parts I'll add them here.

The usage pattern is to apply these modules to a part. for example, adding a t-slot and a dovetail to a cube:

difference(){
color("blue")
cube([10,10,10]);

translate([-1,2,9])
tslot(1,1,2,0.5,12);

translate([-1,6,9])
dovetail(2,5,60,12);
}
