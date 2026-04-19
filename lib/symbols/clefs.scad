// ============================================================
//  clefs.scad
//  Low-level reusable clefs geometry.
// ============================================================

include <scaling.scad>
include <../fs.scad>
include <../primitives/symbols.scad>
include <../engravings/symbols.scad>

CLEF_QTY = 1;

module clef_behind_bridge(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_BEHIND_BRIDGE_CLEF_RATIO);
  echo(str("Behind bridge clef scale factor: ", sf));
  sample_staff(x, y, ls, t);
  centered_x = x - sample_staff_width / 2.2;
  centered_y = y - 3.4 * ls;
  symbol(centered_x, centered_y, sf, t, SVG, "clefs/behind_bridge");
}

module clefs(ph, m, x, ls, t) {
  available_height = ph - 2 * m - 1.5 * font_size;
  y_block = available_height / CLEF_QTY;
  y_label = ph - m - font_size;

  sym_label(x, y_label, t, "Clefs");
  for (i = [1:CLEF_QTY]) {
    y = y_block * i;
    if (i == 1) {
      clef_behind_bridge(x, y, ls, t);
    }
  }
}
