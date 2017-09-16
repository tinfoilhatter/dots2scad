// dots1.scad
// Ron Hale-Evans
// Convert Karl Erickson's "dots" output to OpenSCAD
// Test

x=0;
y=1;
z=2;
d=35.3553742;

module strut (v0, v1)
{
    length = norm(v1-v0); // radial distance  
    b = acos((v1[z]-v0[z])/length);       // inclination angle
    c = atan2(v1[y]-v0[y],v1[x]-v0[x]);     // azimuthal angle

    translate(v0)
        rotate([0, b, c]) 
            cylinder(h=length, r=4);
    %cube(v1); // corner of cube should coincide with end of cylinder
}

p0 = [d, d, d]; // coordinates of point 0
p1 = [-d, -d, d]; // coordinates of point 1
p2 = [-d, d, -d]; // coordinates of point 2
p3 = [d, -d, -d]; // coordinates of point 3

union()
{
    translate (p0) sphere (r=5); //0
    translate (p1) sphere (r=5); //1
    translate (p2) sphere (r=5); //2
    translate (p3) sphere (r=5); //3
    
    strut(p0, p1);
    strut(p0, p2);
    strut(p0, p3);
    strut(p1, p2);
    strut(p1, p3);
    strut(p2, p3);
}
