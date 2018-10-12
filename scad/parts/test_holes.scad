use <../includes/nuts-and-screws.scad>

difference() {
    cube([50, 50, 2]);

    translate([10, 10, -0.5]) m3_nut();
    translate([10, 20, -0.5]) m3_screw();

    translate([20, 10, -0.5]) m4_nut();
    translate([20, 20, -0.5]) m4_screw();
}