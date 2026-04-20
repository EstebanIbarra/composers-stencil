// ============================================================
//  Symbol registry
//  To add a new symbol: append its width to symbol_widths and
//  add the matching branch in place_symbol() below.
//  Order here is the order they appear left-to-right.
// ============================================================

// Index constants - keep in sync with place_symbol()
NO_SYMBOL = 0;
SYM_RESTS = 1;
SYM_CLEFS = 2;

function sym_width(id) =
  id == SYM_RESTS ? 5.0
  : id == SYM_CLEFS ? 5.0
  : 0; // default for unknown symbol

// The ordered list of symbols to place
symbol_ids = [
  NO_SYMBOL,
  SYM_RESTS,
  SYM_CLEFS
];

sym_count = len(symbol_ids);
