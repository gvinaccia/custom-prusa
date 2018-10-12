// http://www.fairburyfastener.com/xdims_metric_nuts.htm

module m3_nut(h = 3) {
    nut(h, 3.1);
}

module m3_screw(h = 19) {
    screw(h = h, r = 1.65);
}

module m4_nut(h = 3) {
    nut(h, 3.95);
}

module m4_screw(h = 19) {
    screw(h = h, r = 2);
}

module nut(h, r) {
    cylinder(r = r, h = h, $fn = 6);
}

module screw(h, r) {
    cylinder(h = h, r = r, $fn=50);
}

/*
3 devi fare un foro di 2,5 mm. 
per le viti da 4 il foro deve essere del 3,25 
per le viti da 5 mm il foro deve essere di di 4 mm 
per le viti da 6 mm il foro deve essere di 4,75 mm. 
*/