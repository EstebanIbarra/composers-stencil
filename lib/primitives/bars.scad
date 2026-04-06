// ============================================================
//  bars.scad
//  Low-level reusable bar geometry.
//  All span the full stave block oheight (h = total_stave_h).
//  x         — left edge of the bar line group
//  y         — bottom of the stave block (stave_v_offset)
//  h         — total stave block height
//  sw        — slot_width (thin line unit)
//  t         — stencil thickness
// ============================================================

thickness_factor = 3;

module slot_v(x, y, h, sw, t) {
  translate([x, y, -0.1])
    cube([sw, h, t + 0.4]);
}

module slot_v_rounded(x, y, h, sw, t) {
  r = sw / 2;
  translate([x + r, y + r, -0.1])
    hull() {
      cylinder(r=r, h=t + 0.2, $fn=16);
      translate([0, h - sw, 0])
        cylinder(r=r, h=t + 0.2, $fn=16);
    }
}

module bar_regular(x, y, h, sw, t) {
  slot_v_rounded(x, y, h, sw, t);
}

// Thick bar used to compose repeat and end bars
module bar_thick(x, y, h, sw, t) {
  slot_v(x, y, h, sw * thickness_factor, t);
}
