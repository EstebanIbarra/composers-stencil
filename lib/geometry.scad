// ============================================================
//  geometry.scad
//  Derives all measurements from params + paper resolution.
//  No geometry emitted — just computed values other files use.
// ============================================================

include <page.scad>

_page = resolve_page(format, orientation);
scale_factor = 0.975;
pg_w = _page[0] * scale_factor;
pg_h = _page[1] * scale_factor;

margins = resolve_margins();

content_h = pg_h - margins[0] - margins[2];
content_w = pg_w - margins[1] - margins[3];

staff_height = 4 * line_spacing;

stave_gap = (content_h - stave_count * staff_height) / (stave_count - 1);

total_stave_h = stave_count * staff_height + (stave_count - 1) * stave_gap;

stave_v_offset = margin + (content_h - total_stave_h) / 2;

assert(
  stave_gap >= (staff_height / 2),
  str(
    "Not enough vertical space for ", stave_count, " staves!\n",
    "\tRequired staff space: ", stave_count * staff_height, " mm.\n",
    "\tAvailable: ", content_h, " mm.\n",
    "\tReduce stave_count or line_spacing.\n"
  )
);
