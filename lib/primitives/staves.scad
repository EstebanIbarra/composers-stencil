// ============================================================
//  staves.scad
//  Low-level reusable staff geometry.
//  A staff ends with notches, so they can used to draw full staves.
// ============================================================

notch_length = 3.5;

module notch(x, y, w, sw, t) {
  r = sw / 2;
  translate([x + r, y + r, -0.1])
    hull() {
      cylinder(r=r, h=t + 0.2, $fn=16);
      translate([w - sw, 0, 0])
        cylinder(r=r, h=t + 0.2, $fn=16);
    }
}

module staff_line(x, y, w, sw, t) {
  // Left notch
  notch(x, y, notch_length, sw, t);
  // Right notch
  notch(x + w - notch_length, y, notch_length, sw, t);
}

module staff(x, y, w, ls, sw, t) {
  for (i = [0:4]) {
    staff_line(x, y + i * ls, w, sw, t);
  }
}

module staff_line_guide(pw, ph, sw, t, cr) {
  r = sw / 2;
  translate([cr + r, ph - sw / 2 + r, -0.1])
    hull() {
      cylinder(r=r, h=t + 0.2, $fn=16);
      translate([pw - 2 * cr - sw, 0, 0])
        cylinder(r=r, h=t + 0.2, $fn=16);
    }
}
