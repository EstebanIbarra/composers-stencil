// ============================================================
//  symbols.scad
//  Low-level reusable 
// ============================================================

module symbol(x, y, sf, t, svg_path) {
  translate([x, y, -0.1])
    scale([sf, sf, 1])
      linear_extrude(t + 0.2)
        import(svg_path);
}
