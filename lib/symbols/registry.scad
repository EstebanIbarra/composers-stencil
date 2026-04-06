// ============================================================
//  Symbol registry
//  To add a new symbol: append its width to symbol_widths and
//  add the matching branch in place_symbol() below.
//  Order here is the order they appear left-to-right.
// ============================================================

// Index constants - keep in sync with place_symbol()
SYM_BAR_REGULAR = 0;
SYM_BAR_THICK = 1;

function sym_width(id) =
  id == SYM_BAR_REGULAR ? slot_width
  : id == SYM_BAR_THICK ? slot_width * thickness_factor
  : 0; // default for unknown symbol

// The ordered list of symbols to place
symbol_ids = [
  SYM_BAR_REGULAR,
  SYM_BAR_THICK,
];

sym_count = len(symbol_ids);
