// ============================================================
//  stencil.scad
//  Assembles the final stencil model.
// ============================================================

include <engravings/ruler.scad>
include <geometry.scad>
include <primitives/staves.scad>
include <primitives/bars.scad>
include <symbols/clefs.scad>
include <symbols/distribution.scad>
include <symbols/registry.scad>
include <symbols/rests.scad>

// Symbol placement - Add new branches here when extending the symbol registry and implementing new symbol modules.
// id        — symbol ID from registry.scad
// x         — X position of the left edge of the symbol
module place_symbol(id, x) {
  if (id == SYM_RESTS && enable_rests)
    rests(pg_h, margin, x, line_spacing, thickness);
  else if (id == SYM_CLEFS && enable_clefs)
    clefs(pg_h, margin, x, line_spacing, thickness);
  // else: unknown symbol, do nothing
}

corner_radius = margin;
$fn = 128;
module rounded_plate() {
  translate([corner_radius, corner_radius, 0])
    minkowski() {
      cube([pg_w - 2 * corner_radius, pg_h - 2 * corner_radius, thickness]);
      cylinder(r=corner_radius, h=0.001);
    }
}

module bars() {
  x_init = 1.25 * margin + (enable_left_ruler ? font_size : 0);
  bar_h = total_stave_h + line_spacing;
  bar_thick(x_init, stave_v_offset, bar_h, slot_width, thickness);
  bar_regular(x_init + 1.1 * margin, stave_v_offset, bar_h, slot_width, thickness);
}

module stave_block() {
  for (i = [0:stave_count - 1]) {
    y_pos = stave_v_offset + i * (staff_height + stave_gap);
    staff(margins, y_pos, content_w, line_spacing, slot_width, thickness);
    if (enable_staff_line_guide) {
      if (i == 0) staff_line_guide_top(y_pos, content_w, slot_width, thickness);
      if (i == stave_count - 1) staff_line_guide_bottom(y_pos, line_spacing, content_w, slot_width, thickness);
    }
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
    if (enable_top_ruler) metric_ruler_top();
    if (enable_right_ruler) metric_ruler_right();
    if (enable_bottom_ruler) metric_ruler_bottom();
    if (enable_left_ruler) metric_ruler_left();
  } else {
    if (enable_top_ruler) imperial_ruler_top();
    if (enable_right_ruler) imperial_ruler_right();
    if (enable_bottom_ruler) imperial_ruler_bottom();
    if (enable_left_ruler) imperial_ruler_left();
  }
}

module stencil() {
  difference() {
    rounded_plate();
    bars();
    stave_block();
    symbols();
    rulers();
    /*
    translate([notch_free_start, margins[2] + notch_offset, -0.1])
      #cube([notch_free_width, notch_free_height, thickness + 0.2]);
      */
  }
}
