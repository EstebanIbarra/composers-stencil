// ============================================================
//  symbols.scad
//  Engraved labels for symbol grouping and identification.
// ============================================================

module sym_label(x, y, t, label) {
  translate([x, y, t - engraving_depth])
    linear_extrude(engraving_depth + 0.01)
      text(
        label,
        size=font_size,
        font="Liberation Sans:style=Bold",
        halign="center",
        valign="bottom"
      );
}

module sample_staff(x, y, ls, t) {
  x0 = x - sample_staff_width / 2.5;
  y0 = y - ls - ls / 3;
  for (i = [0:4]) {
    y_line = y0 + i * ls;
    translate([x0, y_line - engraving_depth / 2, t - engraving_depth])
      cube([sample_staff_width, engraving_depth, engraving_depth + 0.01]);
  }
}
