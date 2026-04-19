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

// ========================== RESTS ===========================
SMuFL_DOUBLE_WHOLE_REST_RATIO = 2.5;
SMuFL_WHOLE_REST_RATIO = 2.5;
SMuFL_HALF_REST_RATIO = 2.5;
SMuFL_QUARTER_REST_RATIO = 2.5;
SMuFL_EIGHTH_REST_RATIO = 2.8;
SMuFL_SIXTEENTH_REST_RATIO = 2.5;
SMuFL_THIRTY_SECOND_REST_RATIO = 2.5;
SMuFL_SIXTY_FOURTH_REST_RATIO = 2.5;

// ========================== CLEFS ==========================
SMuFL_BEHIND_BRIDGE_CLEF_RATIO = 4.0;
