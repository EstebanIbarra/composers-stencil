// ============================================================
//  stencil.scad
//  Assembles the final stencil model.
// ============================================================

include <engravings/ruler.scad>
include <geometry.scad>
include <primitives/staves.scad>
include <primitives/bars.scad>
include <symbols/distribution.scad>
include <symbols/registry.scad>

// Symbol placement - Add new branches here when extending the symbol registry and implementing new symbol modules.
// id        — symbol ID from registry.scad
// x         — X position of the left edge of the symbol
module place_symbol(id, x) {
  if (id == SYM_BAR_REGULAR && enable_bar_regular)
    bar_regular(x, stave_v_offset, total_stave_h, slot_width, thickness);
  else if (id == SYM_BAR_THICK && enable_bar_thick)
    bar_thick(x, stave_v_offset, total_stave_h, slot_width, thickness);
  // else: unknown symbol, do nothing
}

corner_radius = margin;
$fn = 128;
module rounded_plate() {
  minkowski() {
    cube([pg_w - 2 * corner_radius, pg_h - 2 * corner_radius, thickness]);
    cylinder(r=corner_radius, h=0.001);
  }
}

module stave_block() {
  if (enable_staff_line_guide) staff_line_guide(pg_w, pg_h - (margin / 2), slot_width, thickness, corner_radius);
  for (i = [0:stave_count - 1]) {
    y_pos = stave_v_offset + i * (staff_height + stave_gap);
    staff(margin, y_pos, content_w, line_spacing, slot_width, thickness);
  }
}

module symbols() {
  start_x = notch_free_start + sym_spacing;
  for (i = [0:sym_count - 1]) {
    place_symbol(
      symbol_ids[i],
      start_x + sym_x(symbol_ids, i)
    );
  }
}

module rulers() {
  if (ruler_system == "Metric") {
    if (enable_bottom_ruler) metric_ruler_bottom();
    if (enable_right_ruler) metric_ruler_right();
  } else {
    if (enable_bottom_ruler) imperial_ruler_bottom();
    if (enable_right_ruler) imperial_ruler_right();
  }
}

module stencil() {
  difference() {
    translate([corner_radius, corner_radius, 0])
      rounded_plate();
    stave_block();
    symbols();
    rulers();
  }
}
