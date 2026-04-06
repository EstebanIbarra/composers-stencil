// ============================================================
//  ruler.scad
//  Engraved ruler markings along the Bottom and Right borders.
//  Ticks are engraved (not cut through) to preserve rigidity.
//
//  Metric:   1mm / 5mm / 10mm ticks
//  Imperial: 1/16" / 1/8" / 1/4" / 1" ticks
//
//  Tick heights (engraved inward from the edge):
//    smallest — margin * 0.20
//    small    — margin * 0.35
//    medium   — margin * 0.55
//    large    — margin * 0.80
// ============================================================

// Tick width — thin enough to be precise
tick_w = 0.4;

// Tick heights — proportional to margin
tick_h_sm = margin * 0.25; // smallest (1mm / 1/16")
tick_h_md = margin * 0.30; // small    (5mm / 1/8")
tick_h_lg = margin * 0.40; // medium   (1/4")
tick_h_xl = margin * 0.55; // large    (10mm / 1")

// 1 inch in mm
inch = 25.4;

number_offset = tick_h_xl + 0.5;

// ============================================================
//  Single engraved tick
//  Engraved downward from the top surface (translate in Z).
//  For horizontal ruler (bottom border): tick grows upward from bottom edge.
//  For vertical ruler (right border):    tick grows leftward from right edge.
// ============================================================

// Tick on the bottom border — grows upward along Y
module tick_bottom(x, h) {
  if (x >= corner_radius && x < pg_w - corner_radius)
    translate([x - tick_w / 2, 0, thickness - engraving_depth])
      cube([tick_w, h, engraving_depth + 0.01]);
}

// Tick on the right border — grows leftward along X
module tick_right(y, h) {
  if (y >= corner_radius && y < pg_h - corner_radius)
    translate([pg_w - h, y - tick_w / 2, thickness - engraving_depth])
      cube([h, tick_w, engraving_depth + 0.01]);
}

// ============================================================
//  Engraved number
//  Bottom border: text reads normally left-to-right
//  Right border:  text rotated 90° so it reads bottom-to-top
// ============================================================

module number_bottom(x, label) {
  if (x >= corner_radius && x < pg_w - corner_radius)
    translate([x, number_offset, thickness - engraving_depth])
      linear_extrude(engraving_depth + 0.01)
        text(
          label,
          size=font_size,
          font="Liberation Sans:style=Bold",
          halign="center",
          valign="bottom"
        );
}

module number_right(y, label) {
  if (y >= corner_radius && y < pg_h - corner_radius)
    translate([pg_w - number_offset, y, thickness - engraving_depth])
      rotate([0, 0, 90])
        linear_extrude(engraving_depth + 0.01)
          text(
            label,
            size=font_size,
            font="Liberation Sans:style=Bold",
            halign="center",
            valign="bottom"
          );
}

// ============================================================
//  Tick height selector
// ============================================================

function metric_tick_h(pos) =
  (pos % 10 == 0) ? tick_h_xl
  : (pos % 5 == 0) ? tick_h_lg
  : tick_h_sm;

// pos in 1/16" units
function imperial_tick_h(pos) =
  (pos % 16 == 0) ? tick_h_xl // whole inch
  : (pos % 4 == 0) ? tick_h_lg // 1/4"
  : (pos % 2 == 0) ? tick_h_md // 1/8"
  : tick_h_sm; // 1/16"

// ============================================================
//  Metric ruler — ticks every 1mm, numbers every 10mm
// ============================================================

module metric_ruler_bottom() {
  tick_bottom(corner_radius, tick_h_xl);
  number_bottom(corner_radius, "0");
  steps = floor(pg_w);
  for (i = [1:steps - 1]) {
    x = corner_radius + i;
    tick_bottom(x, metric_tick_h(i));
    if (i % 10 == 0) {
      number_bottom(x, str(i));
    }
  }
}

module metric_ruler_right() {
  tick_right(corner_radius, tick_h_xl);
  number_right(corner_radius, "0");
  steps = floor(pg_h);
  for (i = [1:steps - 1]) {
    y = corner_radius + i;
    tick_right(y, metric_tick_h(i));
    if (i % 10 == 0) {
      number_right(y, str(i));
    }
  }
}

// ============================================================
//  Imperial ruler — ticks every 1/16", numbers every 1/2"
// ============================================================

module imperial_ruler_bottom() {
  tick_bottom(corner_radius, tick_h_xl);
  number_bottom(corner_radius, "0");
  total_sixteenths = floor(pg_w / (inch / 16));
  for (i = [1:total_sixteenths - 1]) {
    x = corner_radius + i * (inch / 16);
    tick_bottom(x, imperial_tick_h(i));
    if (i % 8 == 0) {
      number_bottom(x, str(i / 16));
    }
  }
}

module imperial_ruler_right() {
  tick_right(corner_radius, tick_h_xl);
  number_right(corner_radius, "0");
  total_sixteenths = floor(pg_h / (inch / 16));
  for (i = [1:total_sixteenths - 1]) {
    y = corner_radius + i * (inch / 16);
    tick_right(y, imperial_tick_h(i));
    if (i % 8 == 0) {
      number_right(y, str(i / 16));
    }
  }
}
