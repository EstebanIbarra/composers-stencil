// ============================================================
//  symbols.scad
//  Low-level reusable symbol primitives.
// ============================================================

module symbol(x, y, sf, t, filetype, filename) {
  p = str("../assets/", filetype, "/", filename, ".", filetype);
  translate([x, y, -0.1])
    scale([sf, sf, 1])
      linear_extrude(t + 0.2)
        import(p);
}
