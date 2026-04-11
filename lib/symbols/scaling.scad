// ============================================================
//  scaling.scad
//  Symbol scaling for SVGs obtained from a SMuFL Open Source Font.
// ============================================================

SMuFL_UNITS_PER_EM = 1000; // SMuFL standard defines 1000 units per em

function smufl_scale_factor(ls, ratio) =
  (4 * ls * ratio) / SMuFL_UNITS_PER_EM;

// ============================================================
//  SMuFL Symbol Ratios.
// ============================================================

SMuFL_DOUBLE_WHOLE_REST_RATIO = 2.5;
SMuFL_QUARTER_REST_RATIO = 2.5;
SMuFL_EIGHTH_REST_RATIO = 2.8;
