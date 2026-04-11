// ============================================================
//  rests.scad
//  Low-level reusable rests geometry.
// ============================================================

include <scaling.scad>
include <../fs.scad>
include <../primitives/symbols.scad>
include <../engravings/symbols.scad>

REST_QTY = 8;

module rest_double_whole(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_DOUBLE_WHOLE_REST_RATIO);
  sf = 0.02;
  echo(str("Double whole rest scale factor: ", sf));
  symbol(x, y, sf, t, SVG, "double_whole_rest");
}

/*
module rest_whole(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_DOUBLE_REST_RATIO);
  echo(str("Double rest scale factor: ", sf));
  symbol(x, y, sf, t, SVG, "whole_rest");
}

module rest_half(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_HALF_REST_RATIO);
  echo(str("Half rest scale factor: ", sf));
  symbol(x, y, sf, t, SVG, "half_rest");
}
*/

module rest_quarter(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_QUARTER_REST_RATIO);
  echo(str("Quarter rest scale factor: ", sf));
  symbol(x, y, sf, t, SVG, "quarter_rest");
}

module rest_eighth(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_EIGHTH_REST_RATIO);
  echo(str("Eighth rest scale factor: ", sf));
  symbol(x, y, sf, t, SVG, "eighth_rest");
}

module rests(ph, m, x, ls, t) {
  available_height = ph - 2 * m - font_size;
  y_block = available_height / REST_QTY;
  y_label = ph - m - font_size;

  sym_label(x, y_label, t, "Rests");
  for (i = [1:REST_QTY]) {
    if (i == 1) {
      // 2/1 rest
    } else if (i == 2) {
      // 1/1 rest
    } else if (i == 3) {
      // 1/2 rest
    } else if (i == 4) {
      rest_quarter(x, y_block * i, ls, t);
    } else if (i == 5) {
      rest_eighth(x, y_block * i, ls, t);
    } else if (i == 6) {
      // 1/16 rest
    } else if (i == 7) {
      // 1/32 rest
    } else if (i == 8) {
      // 1/64 rest
    }
  }
}
