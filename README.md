# Odin Bindings for Tilengine - 2D retro graphics engine
[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

From [Tilengine Github repo](https://github.com/megamarc/Tilengine):
"Tilengine is an open source, cross-platform 2D graphics engine for creating classic/retro games with tile maps, sprites and palettes. Its unique scanline-based rendering algorithm makes raster effects a core feature, a technique used by many games running on real 2D graphics chips."

http://www.tilengine.org

# About the bindings

These bindings have been generated with [Odin Binding Generator](https://github.com/Breush/odin-binding-generator) By [Alexis Breust](https://github.com/Breush), and manually modified to function optimally with Tilengine.

Report any bugs you find!

# Usage
For these bindings to work, you'll need to aquire a built version of Tilengine. You'll also need SDL2 libraries, which Tilengine uses for rendering.

After aquiring, place Tilengine.dll and SDL2.dll into the build directory of your Odin project.

You must also place Tilengine.lib into the same folder as these bindings (tilengine.odin).

To use the bindings in Odin, import them with ' import tln "tilengine" ' in your Odin file.

## Getting Tilengine binaries

You can get Tilengine binaries by either [building from source](https://github.com/megamarc/Tilengine?tab=readme-ov-file#build-from-source), or [downloading them from itch.io](https://megamarc.itch.io/tilengine).

If you build from source yourself, you can get the Tilengine.pdb file, which can be useful for debugging. Please consider supporting Tilengine, and getting the bindings from itch, though!