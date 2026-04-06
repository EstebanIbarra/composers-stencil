// ============================================================
//  main.scad 
//  Entry point - Open this file in OpenSCAD
//  Parameters live here so the Customizer can pick them up
// ============================================================

/* [Stencil] */

// --- Paper Format ---
// Paper format determines the page size and resolution.
format = "TravelersNotebook"; // [A4, A3, A2, Letter, Legal, Tabloid, TravelersNotebook, Passport]

// --- Orientation ---
// Orientation determines how the page is rotated when printed.
orientation = "Landscape"; // [Portrait, Landscape]

// --- Margin (mm) ---
// Border around the page content in mm.
margin = 7.0; // [5:1:20]

// --- Stencil thickness (mm) ---
// Thickness of the printed stencil in mm.
thickness = 2.0; // [1:0.5:5]

/* [Staves] */

// --- Stave count ---
// Number of staves to fit on the page. The script will automatically adjust the gap between staves to fit them all,
stave_count = 7; // [4:1:20]

// --- Staff line spacing (mm) ---
// Distance in mm between adjacent lines within a staff.
line_spacing = 2.0; // [2:0.5:6]

// --- Slot width (mm) ---
// Physical width of each cut line in mm. 
slot_width = 0.4; // [0.1:0.1:2.0]

// --- Enable staff line guide ---
// Enables a guide line along the top edge of the stencil to help draw the staff lines.
enable_staff_line_guide = true;

/* [Bars & Symbols] */

// --- Enable regular bar ---
// Enables the regular bar symbol (thin vertical line) in the symbol registry.
enable_bar_regular = true;

// --- Enable thick bar ---
// Enables the thick bar symbol (thick vertical line) in the symbol registry.
enable_bar_thick = true;

/* [Engraving] */

// --- Engraving depth (mm) ---
// How deep the engraved symbols should be.
engraving_depth = 0.5; // [0.2:0.1:4.5]

// --- Font size (mm) ---
// Size of the engraved text on the stencil.
font_size = 2.0; // [1.5:0.5:5

/* [Rulers] */

// --- Enable bottom ruler ---
// Engraved ruler along the bottom edge of the stencil.
enable_bottom_ruler = true;

// --- Enable right ruler ---
// Engraved ruler along the right edge of the stencil.
enable_right_ruler = true;

// --- Ruler measurement system ---
// Units for ruler markings.
ruler_system = "Metric"; // [Metric, Imperial]

include <lib/stencil.scad>

stencil();

echo(str("\n\n\n",
"========= Composer's Stencil Generator v0.0.1 =========\n",
  "Designer:  Esteban Ibarra\n",
  "GitHub: github.com/EstebanIbarra/composers-stencil\n",
  "Stencil:\n",
    "\t- Paper format: ", format, "\n",
    "\t- Orientation: ", orientation, "\n",
    "\t- Margin: ", margin, " mm\n",
    "\t- Thickness: ", thickness, " mm\n",
  "Staves:\n",
    "\t- Stave count: ", stave_count, "\n",
    "\t- Line spacing: ", line_spacing, " mm\n",
    "\t- Slot width: ", slot_width, " mm\n",
    "\t- Staff line guide: ", enable_staff_line_guide ? "Enabled" : "Disabled", "\n",
  "Bars & Symbols:\n",
    "\t- Regular bar: ", enable_bar_regular ? "Enabled" : "Disabled", "\n",
    "\t- Thick bar: ", enable_bar_thick ? "Enabled" : "Disabled", "\n",
  "Engraving:\n",
    "\t- Engraving depth: ", engraving_depth, " mm\n",
    "\t- Font size: ", font_size, " mm\n",
  "Rulers:\n",
    "\t- Bottom ruler: ", enable_bottom_ruler ? "Enabled" : "Disabled", "\n",
    "\t- Right ruler: ", enable_right_ruler ? "Enabled" : "Disabled", "\n",
    "\t- Metric system: ", ruler_system,
"\n\n\n"
));
