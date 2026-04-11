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
