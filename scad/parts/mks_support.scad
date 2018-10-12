// https://reprap.org/mediawiki/images/e/e1/MksGenV14-Masse.png

$fn = 50;

// params
board_hole_radius = 2;
board_hole_x_dist = 135;
board_hole_y_dist = 76;
board_length = 143;
board_width = 84;
corner_radius = 2;
board_thickness = 2.5;

m3_hole_radius = 3.7;
m3_hole_thickness = 3.5;

// geometry

/*
%color([0,1,0,.5])
  translate([0,0,10])
  board(board_length, board_width, board_thickness);
*/

color("yellow")
  base();




// modules

module base() {
  half_x_dist = board_hole_x_dist / 2;
  half_y_dist = board_hole_y_dist / 2;
  
  union() {
    linear_extrude(2) {
      union() {
        // Base design
        difference() {
          union() {
            minkowski() {
              square([board_length, board_width], center= true);
              circle(r = 2);
            }
            
            translate([55, 0, 0]) {
              difference() {
                hull() {
                  translate([0, -45.75, 0]) circle(5);
                  translate([0, 45.75, 0]) circle(5);
                }
                translate([0, -45.75, 0]) circle(1.6);
                translate([0, 45.75, 0]) circle(1.6);
              }
            }
          }
          
          square([board_length - 10, board_width - 10], center = true); 
          
          translate([half_x_dist * 1, half_y_dist * 1, 0]) circle(r = board_hole_radius * 1.85);
          translate([half_x_dist * -1, half_y_dist * 1, 0]) circle(r = board_hole_radius * 1.85);
          translate([half_x_dist * 1, half_y_dist * -1, 0]) circle(r = board_hole_radius * 1.85);
          translate([half_x_dist * -1, half_y_dist * -1, 0]) circle(r = board_hole_radius * 1.85);
        }
        
        translate([-62, 14.5, 0]) {
          difference() {
            hull() {
              translate([-5, 0, 0]) square([5, 10], center = true);
              translate([2,0,0]) circle(5);
            }
            hull() {
              translate([-1.5,0,0]) circle(2);
              translate([1.5,0,0]) circle(2);
            }
          }
        }
      }
    }
      
    translate([half_x_dist * 1, half_y_dist * 1, 0]) screwSupport();
    translate([half_x_dist * -1, half_y_dist * 1, 0]) screwSupport();
    translate([half_x_dist * 1, half_y_dist * -1, 0]) screwSupport();
    translate([half_x_dist * -1, half_y_dist * -1, 0]) screwSupport();
  }
}

module screwSupport() {
  difference() {
    union() {
      cylinder(r = board_hole_radius * 2.5, h = 4);
      translate([0,0,4]) cylinder(r = board_hole_radius * 1.7, h = 6);
    }
    translate([0,0,-0.5]) 
      union() {
        cylinder(r = board_hole_radius, h = 11);
        cylinder(r = m3_hole_radius, h = m3_hole_thickness, $fn = 6);
      }      
  }
}

module board(w, h, t) {
  difference() {
    linear_extrude(t)
      minkowski() {
        square([w - corner_radius * 2, h - corner_radius * 2], center = true); 
        circle(corner_radius);
      }
      
    holes();
  }
}

module holes() {
  half_x_dist = board_hole_x_dist / 2;
  half_y_dist = board_hole_y_dist / 2;
  
  translate([half_x_dist * 1, half_y_dist * 1, 0]) hole();
  translate([half_x_dist * -1, half_y_dist * 1, 0]) hole();
  translate([half_x_dist * 1, half_y_dist * -1, 0]) hole();
  translate([half_x_dist * -1, half_y_dist * -1, 0]) hole();
}

module hole() {
  translate([0,0,board_thickness * -0.5]) 
    cylinder(r = board_hole_radius, h= board_thickness * 2);
}

