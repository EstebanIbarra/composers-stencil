// ============================================================
//  page.scad
//  Knows about page formats and orientation.
//  Pure functions, no geometry emitted.
// ============================================================

function page_wh(fmt) =
  fmt == "A2" ? [420, 594]
  : fmt == "A3" ? [297, 420]
  : fmt == "A4" ? [210, 297]
  : fmt == "A5" ? [148, 210]
  : fmt == "PocketA5" ? [145, 200]
  : fmt == "Letter" ? [215.9, 279.4]
  : fmt == "Legal" ? [215.9, 355.6]
  : fmt == "Tabloid" ? [279.4, 431.8]
  : fmt == "TravelersNotebook" ? [110, 210]
  : fmt == "Passport" ? [98, 134]
  : fmt == "MoleskineL" ? [130, 210]
  : fmt == "MoleskineXL" ? [190, 250]
  : fmt == "MoleskineP" ? [90, 140]
  : [210, 297]; // Default to A4 if unrecognized

function resolve_page(fmt, orient) =
  let (wh = page_wh(fmt)) orient == "Landscape" ? [wh[1], wh[0]] : wh;

function resolve_margins() =
  [
    enable_top_ruler ? margin_ruler + font_size / 2 : margin,
    enable_right_ruler ? margin_ruler : margin,
    enable_bottom_ruler ? margin_ruler : margin,
    (enable_left_ruler ? margin_ruler : margin) + 2 * margin
  ];
