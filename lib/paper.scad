// ============================================================
//  paper.scad
//  Knows about paper formats and orientation.
//  Pure functions, no geometry emitted.
// ============================================================

function paper_wh(fmt) =
  fmt == "A3" ? [297, 420]
  : fmt == "A2" ? [420, 594]
  : fmt == "Letter" ? [215.9, 279.4]
  : fmt == "Legal" ? [215.9, 355.6]
  : fmt == "Tabloid" ? [279.4, 431.8]
  : fmt == "TravelersNotebook" ? [110, 210]
  : fmt == "Passport" ? [98, 134]
  : [210, 297]; // Default to A4 if unrecognized

function resolve_page(fmt, orient) =
  let (wh = paper_wh(fmt)) orient == "Landscape" ? [wh[1], wh[0]] : wh;
