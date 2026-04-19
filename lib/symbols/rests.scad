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
  echo(str("Double whole rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  centered_x = x - sample_staff_width / 5;
  symbol(centered_x, y, sf, t, SVG, "rests/double_whole");
}

module rest_whole(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_WHOLE_REST_RATIO);
  echo(str("Double rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  symbol(x, y, sf, t, SVG, "rests/whole");
}

module rest_half(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_HALF_REST_RATIO);
  echo(str("Half rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  symbol(x, y, sf, t, SVG, "rests/half");
}

module rest_quarter(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_QUARTER_REST_RATIO);
  echo(str("Quarter rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  symbol(x, y, sf, t, SVG, "rests/quarter");
}

module rest_eighth(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_EIGHTH_REST_RATIO);
  echo(str("Eighth rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  symbol(x, y, sf, t, SVG, "rests/eighth");
}

module rest_sixteenth(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_SIXTEENTH_REST_RATIO);
  echo(str("Sixteenth rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  symbol(x, y + ls / 1.7, sf, t, SVG, "rests/sixteenth");
}

module rest_thirty_second(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_THIRTY_SECOND_REST_RATIO);
  echo(str("Thirty-second rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  centered_x = x - sample_staff_width / 15;
  symbol(centered_x, y, sf, t, SVG, "rests/thirty_second");
}

module rest_sixty_fourth(x, y, ls, t) {
  sf = smufl_scale_factor(ls, SMuFL_SIXTY_FOURTH_REST_RATIO);
  echo(str("Sixty-fourth rest scale factor: ", sf));
  sample_staff(x, y, ls, t);
  centered_x = x - sample_staff_width / 15;
  symbol(centered_x, y + ls / 2, sf, t, SVG, "rests/sixty_fourth");
}

module rests(ph, m, x, ls, t) {
  available_height = ph - 2 * m - 1.5 * font_size;
  y_block = available_height / REST_QTY;
  y_label = ph - m - font_size;

  sym_label(x, y_label, t, "Rests");
  for (i = [1:REST_QTY]) {
    y = y_block * i;
    if (i == 1) {
      rest_double_whole(x, y, ls, t);
    } else if (i == 2) {
      rest_whole(x, y, ls, t);
    } else if (i == 3) {
      rest_half(x, y, ls, t);
    } else if (i == 4) {
      rest_quarter(x, y, ls, t);
    } else if (i == 5) {
      rest_eighth(x, y, ls, t);
    } else if (i == 6) {
      rest_sixteenth(x, y, ls, t);
    } else if (i == 7) {
      rest_thirty_second(x, y, ls, t);
    } else if (i == 8) {
      rest_sixty_fourth(x, y, ls, t);
    }
  }
}
