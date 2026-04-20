// ============================================================
//  distribution.scad
//  Automatically distribute symbols across the notch free zone.
// ============================================================

include <registry.scad>

notch_offset = 2;
notch_free_start = margins[3] + notch_length + notch_offset;
notch_free_end = content_w + margins[1] + 2 * notch_length + notch_offset;
notch_free_width = notch_free_end - notch_free_start;
notch_free_height = content_h - 2 * notch_offset;

// Total width consumed by all symbols
function total_sym_width(ids, i = 0, acc = 0) =
  i >= len(ids) ? acc
  : total_sym_width(ids, i + 1, acc + sym_width(ids[i]));

// Spacing between and around symbols: (n+1) == gaps
sym_spacing = (notch_free_width - total_sym_width(symbol_ids)) / (sym_count + 1);

// X position of the symbol at index i (left edge)
function sym_x(ids, i, acc_x = 0, acc_i = 0) =
  acc_i == i ? acc_x
  : sym_x(ids, i, acc_x + sym_width(ids[acc_i]) + sym_spacing, acc_i + 1);
