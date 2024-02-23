package tilengine

foreign import "Tilengine.lib"

import "vendor:sdl2"
import _c "core:c"

_TILENGINE_H :: 1;
TLNAPI :: 1;
false :: 0;
true :: 1;
TILENGINE_VER_MAJ :: 2;
TILENGINE_VER_MIN :: 15;
TILENGINE_VER_REV :: 2;
TILENGINE_HEADER_VERSION :: 131072;
TLN_OVERLAY_NONE :: 0;
TLN_OVERLAY_SHADOWMASK :: 0;
TLN_OVERLAY_APERTURE :: 0;
TLN_OVERLAY_SCANLINES :: 0;
TLN_OVERLAY_CUSTOM :: 0;

TLN_Engine :: ^Engine;
TLN_Tile :: ^Tile;
TLN_Tileset :: ^Tileset;
TLN_Tilemap :: ^Tilemap;
TLN_Palette :: ^Palette;
TLN_Spriteset :: ^Spriteset;
TLN_Sequence :: ^Sequence;
TLN_SequencePack :: ^SequencePack;
TLN_Bitmap :: ^Bitmap;
TLN_ObjectList :: ^ObjectList;
SDL_Event :: sdl2.Event
TLN_VideoCallback :: #type proc(scanline : _c.int);
TLN_BlendFunction :: #type proc(src : u8, dst : u8) -> u8;
TLN_SDLCallback :: #type proc(unamed0 : ^SDL_Event);

TLN_TileFlags :: enum i32 {
    FLAG_NONE       = 0,
    FLAG_FLIPX      = 1<<15,
    FLAG_FLIPY      = 1<<14,
    FLAG_ROTATE     = 1<<13,
    FLAG_PRIORITY   = 1<<12,
    FLAG_MASKED     = 1<<11,
    FLAG_TILESET    = 1792,
    FLAG_PALETTE    = 224,
};

TLN_Blend :: enum i32 {
    BLEND_NONE,
    BLEND_MIX25,
    BLEND_MIX50,
    BLEND_MIX75,
    BLEND_ADD,
    BLEND_SUB,
    BLEND_MOD,
    BLEND_CUSTOM,
    MAX_BLEND,
    BLEND_MIX = 2,
};

TLN_LayerType :: enum i32 {
    LAYER_NONE,
    LAYER_TILE,
    LAYER_OBJECT,
    LAYER_BITMAP,
};

TLN_CRT :: enum i32 {
    TLN_CRT_SLOT,
    TLN_CRT_APERTURE,
    TLN_CRT_SHADOW,
};

TLN_Player :: enum i32 {
    PLAYER1,
    PLAYER2,
    PLAYER3,
    PLAYER4,
};

TLN_Input :: enum i32 {
    INPUT_NONE,
    INPUT_UP,
    INPUT_DOWN,
    INPUT_LEFT,
    INPUT_RIGHT,
    INPUT_BUTTON1,
    INPUT_BUTTON2,
    INPUT_BUTTON3,
    INPUT_BUTTON4,
    INPUT_BUTTON5,
    INPUT_BUTTON6,
    INPUT_START,
    INPUT_QUIT,
    INPUT_CRT,
    INPUT_P1    = 0,
    INPUT_P2    = 32,
    INPUT_P3    = 64,
    INPUT_P4    = 96,
    INPUT_A     = 5,
    INPUT_B     = 6,
    INPUT_C     = 7,
    INPUT_D     = 8,
    INPUT_E     = 9,
    INPUT_F     = 10,
};

TLN_WindowEnums :: enum i32 {
    CWF_FULLSCREEN  = 1,
    CWF_VSYNC       = 2,
    CWF_S1          = 4,
    CWF_S2          = 8,
    CWF_S3          = 12,
    CWF_S4          = 16,
    CWF_S5          = 20,
    CWF_NEAREST     = 64,
    CWF_NOVSYNC     = 128,
};

TLN_Error :: enum i32 {
    TLN_ERR_OK,
    TLN_ERR_OUT_OF_MEMORY,
    TLN_ERR_IDX_LAYER,
    TLN_ERR_IDX_SPRITE,
    TLN_ERR_IDX_ANIMATION,
    TLN_ERR_IDX_PICTURE,
    TLN_ERR_REF_TILESET,
    TLN_ERR_REF_TILEMAP,
    TLN_ERR_REF_SPRITESET,
    TLN_ERR_REF_PALETTE,
    TLN_ERR_REF_SEQUENCE,
    TLN_ERR_REF_SEQPACK,
    TLN_ERR_REF_BITMAP,
    TLN_ERR_NULL_POINTER,
    TLN_ERR_FILE_NOT_FOUND,
    TLN_ERR_WRONG_FORMAT,
    TLN_ERR_WRONG_SIZE,
    TLN_ERR_UNSUPPORTED,
    TLN_ERR_REF_LIST,
    TLN_ERR_IDX_PALETTE,
    TLN_MAX_ERR,
};

TLN_LogLevel :: enum i32 {
    TLN_LOG_NONE,
    TLN_LOG_ERRORS,
    TLN_LOG_VERBOSE,
};

TLN_Affine :: struct {
    angle : _c.float,
    dx : _c.float,
    dy : _c.float,
    sx : _c.float,
    sy : _c.float,
};

AnonymousStruct2 :: struct {
    unused : u8,
    palette : u8,
    tileset : u8,
    masked : bool,
    priority : bool,
    rotated : bool,
    flipy : bool,
    flipx : bool,
};

AnonymousStruct1 :: struct {
    index : u16,
    unamed0 : AnonymousUnion0,
};

TLN_SequenceFrame :: struct {
    index : _c.int,
    delay : _c.int,
};

TLN_ColorStrip :: struct {
    delay : _c.int,
    first : u8,
    count : u8,
    dir : u8,
};

TLN_SequenceInfo :: struct {
    name : [32]_c.char,
    num_frames : _c.int,
};

TLN_SpriteData :: struct {
    name : [64]_c.char,
    x : _c.int,
    y : _c.int,
    w : _c.int,
    h : _c.int,
};

TLN_SpriteInfo :: struct {
    w : _c.int,
    h : _c.int,
};

TLN_TileInfo :: struct {
    index : u16,
    flags : u16,
    row : _c.int,
    col : _c.int,
    xoffset : _c.int,
    yoffset : _c.int,
    color : u8,
    type : u8,
    empty : bool,
};

TLN_ObjectInfo :: struct {
    id : u16,
    gid : u16,
    flags : u16,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    type : u8,
    visible : bool,
    name : [64]_c.char,
};

TLN_TileAttributes :: struct {
    type : u8,
    priority : bool,
};

TLN_PixelMap :: struct {
    dx : i16,
    dy : i16,
};

Engine :: struct {};

Tileset :: struct {};

Tilemap :: struct {};

Palette :: struct {};

Spriteset :: struct {
	entries : _c.int,
	bitmap  : TLN_Bitmap,
	palette : TLN_Palette,
	data    : rawptr
};

Sequence :: struct {};

SequencePack :: struct {};

Bitmap :: struct {
    width,
    height,
    bpp,
    pitch   : _c.int,
    palette : TLN_Palette,
    data    : rawptr
};

ObjectList :: struct {};

TLN_TileImage :: struct {
    bitmap : TLN_Bitmap,
    id : u16,
    type : u8,
};

TLN_SpriteState :: struct {
    x : _c.int,
    y : _c.int,
    w : _c.int,
    h : _c.int,
    flags : u32,
    palette : TLN_Palette,
    spriteset : TLN_Spriteset,
    index : _c.int,
    enabled : bool,
    collision : bool,
};

AnonymousUnion0 :: struct #raw_union {
    flags : u16,
    unamed0 : AnonymousStruct2,
};

Tile :: struct #raw_union {
    value : u32,
    unamed0 : AnonymousStruct1,
};

@(default_calling_convention="c")
foreign Tilengine {

    @(link_name="TLN_Deinit")
    Deinit :: proc() ---;

    @(link_name="TLN_Init")
    Init :: proc(hres : _c.int, vres : _c.int, numlayers : _c.int, numsprites : _c.int, numanimations : _c.int) -> TLN_Engine ---;

    @(link_name="TLN_DeleteContext")
    DeleteContext :: proc(_context : TLN_Engine) -> bool ---;

    @(link_name="TLN_SetContext")
    SetContext :: proc(_context : TLN_Engine) -> bool ---;

    @(link_name="TLN_GetContext")
    GetContext :: proc() -> TLN_Engine ---;

    @(link_name="TLN_SetTargetFps")
    SetTargetFps :: proc(fps : _c.int) ---;

    @(link_name="TLN_GetTargetFps")
    GetTargetFps :: proc() -> _c.int ---;

    @(link_name="TLN_GetWidth")
    GetWidth :: proc() -> _c.int ---;

    @(link_name="TLN_GetHeight")
    GetHeight :: proc() -> _c.int ---;

    @(link_name="TLN_GetNumObjects")
    GetNumObjects :: proc() -> u32 ---;

    @(link_name="TLN_GetUsedMemory")
    GetUsedMemory :: proc() -> u32 ---;

    @(link_name="TLN_GetVersion")
    GetVersion :: proc() -> u32 ---;

    @(link_name="TLN_GetNumLayers")
    GetNumLayers :: proc() -> _c.int ---;

    @(link_name="TLN_GetNumSprites")
    GetNumSprites :: proc() -> _c.int ---;

    @(link_name="TLN_SetBGColor")
    SetBGColor :: proc(r : u8, g : u8, b : u8) ---;

    @(link_name="TLN_SetBGColorFromTilemap")
    SetBGColorFromTilemap :: proc(tilemap : TLN_Tilemap) -> bool ---;

    @(link_name="TLN_DisableBGColor")
    DisableBGColor :: proc() ---;

    @(link_name="TLN_SetBGBitmap")
    SetBGBitmap :: proc(bitmap : TLN_Bitmap) -> bool ---;

    @(link_name="TLN_SetBGPalette")
    SetBGPalette :: proc(palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_SetGlobalPalette")
    SetGlobalPalette :: proc(index : _c.int, palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_SetRasterCallback")
    SetRasterCallback :: proc(unamed0 : TLN_VideoCallback) ---;

    @(link_name="TLN_SetFrameCallback")
    SetFrameCallback :: proc(unamed0 : TLN_VideoCallback) ---;

    @(link_name="TLN_SetRenderTarget")
    SetRenderTarget :: proc(data : ^u8, pitch : _c.int) ---;

    @(link_name="TLN_UpdateFrame")
    UpdateFrame :: proc(frame : _c.int) ---;

    @(link_name="TLN_SetLoadPath")
    SetLoadPath :: proc(path : cstring) ---;

    @(link_name="TLN_SetCustomBlendFunction")
    SetCustomBlendFunction :: proc(unamed0 : TLN_BlendFunction) ---;

    @(link_name="TLN_SetLogLevel")
    SetLogLevel :: proc(log_level : TLN_LogLevel) ---;

    @(link_name="TLN_OpenResourcePack")
    OpenResourcePack :: proc(filename : cstring, key : cstring) -> bool ---;

    @(link_name="TLN_CloseResourcePack")
    CloseResourcePack :: proc() ---;

    @(link_name="TLN_GetGlobalPalette")
    GetGlobalPalette :: proc(index : _c.int) -> TLN_Palette ---;

    @(link_name="TLN_SetLastError")
    SetLastError :: proc(error : TLN_Error) ---;

    @(link_name="TLN_GetLastError")
    GetLastError :: proc() -> TLN_Error ---;

    @(link_name="TLN_GetErrorString")
    GetErrorString :: proc(error : TLN_Error) -> cstring ---;

    @(link_name="TLN_CreateWindow")
    CreateWindow :: proc(overlay : cstring, flags : _c.int) -> bool ---;

    @(link_name="TLN_CreateWindowThread")
    CreateWindowThread :: proc(overlay : cstring, flags : _c.int) -> bool ---;

    @(link_name="TLN_SetWindowTitle")
    SetWindowTitle :: proc(title : cstring) ---;

    @(link_name="TLN_ProcessWindow")
    ProcessWindow :: proc() -> bool ---;

    @(link_name="TLN_IsWindowActive")
    IsWindowActive :: proc() -> bool ---;

    @(link_name="TLN_GetInput")
    GetInput :: proc(id : TLN_Input) -> bool ---;

    @(link_name="TLN_EnableInput")
    EnableInput :: proc(player : TLN_Player, enable : bool) ---;

    @(link_name="TLN_AssignInputJoystick")
    AssignInputJoystick :: proc(player : TLN_Player, index : _c.int) ---;

    @(link_name="TLN_DefineInputKey")
    DefineInputKey :: proc(player : TLN_Player, input : TLN_Input, keycode : u32) ---;

    @(link_name="TLN_DefineInputButton")
    DefineInputButton :: proc(player : TLN_Player, input : TLN_Input, joybutton : u8) ---;

    @(link_name="TLN_DrawFrame")
    DrawFrame :: proc(frame : _c.int) ---;

    @(link_name="TLN_WaitRedraw")
    WaitRedraw :: proc() ---;

    @(link_name="TLN_DeleteWindow")
    DeleteWindow :: proc() ---;

    @(link_name="TLN_EnableBlur")
    EnableBlur :: proc(mode : bool) ---;

    @(link_name="TLN_ConfigCRTEffect")
    ConfigCRTEffect :: proc(type : TLN_CRT, blur : bool) ---;

    @(link_name="TLN_EnableCRTEffect")
    EnableCRTEffect :: proc(overlay : _c.int, overlay_factor : u8, threshold : u8, v0 : u8, v1 : u8, v2 : u8, v3 : u8, blur : bool, glow_factor : u8) ---;

    @(link_name="TLN_DisableCRTEffect")
    DisableCRTEffect :: proc() ---;

    @(link_name="TLN_SetSDLCallback")
    SetSDLCallback :: proc(unamed0 : TLN_SDLCallback) ---;

    @(link_name="TLN_Delay")
    Delay :: proc(msecs : u32) ---;

    @(link_name="TLN_GetTicks")
    GetTicks :: proc() -> u32 ---;

    @(link_name="TLN_GetAverageFps")
    GetAverageFps :: proc() -> u32 ---;

    @(link_name="TLN_GetWindowWidth")
    GetWindowWidth :: proc() -> _c.int ---;

    @(link_name="TLN_GetWindowHeight")
    GetWindowHeight :: proc() -> _c.int ---;

    @(link_name="TLN_GetWindowScaleFactor")
    GetWindowScaleFactor :: proc() -> _c.int ---;

    @(link_name="TLN_SetWindowScaleFactor")
    SetWindowScaleFactor :: proc(unamed0 : _c.int) ---;

    @(link_name="TLN_CreateSpriteset")
    CreateSpriteset :: proc(bitmap : TLN_Bitmap, data : ^TLN_SpriteData, num_entries : _c.int) -> TLN_Spriteset ---;

    @(link_name="TLN_LoadSpriteset")
    LoadSpriteset :: proc(name : cstring) -> TLN_Spriteset ---;

    @(link_name="TLN_CloneSpriteset")
    CloneSpriteset :: proc(src : TLN_Spriteset) -> TLN_Spriteset ---;

    @(link_name="TLN_GetSpriteInfo")
    GetSpriteInfo :: proc(spriteset : TLN_Spriteset, entry : _c.int, info : ^TLN_SpriteInfo) -> bool ---;

    @(link_name="TLN_GetSpritesetPalette")
    GetSpritesetPalette :: proc(spriteset : TLN_Spriteset) -> TLN_Palette ---;

    @(link_name="TLN_FindSpritesetSprite")
    FindSpritesetSprite :: proc(spriteset : TLN_Spriteset, name : cstring) -> _c.int ---;

    @(link_name="TLN_SetSpritesetData")
    SetSpritesetData :: proc(spriteset : TLN_Spriteset, entry : _c.int, data : ^TLN_SpriteData, pixels : rawptr, pitch : _c.int) -> bool ---;

    @(link_name="TLN_DeleteSpriteset")
    DeleteSpriteset :: proc(Spriteset : TLN_Spriteset) -> bool ---;

    @(link_name="TLN_CreateTileset")
    CreateTileset :: proc(numtiles : _c.int, width : _c.int, height : _c.int, palette : TLN_Palette, sp : TLN_SequencePack, attributes : ^TLN_TileAttributes) -> TLN_Tileset ---;

    @(link_name="TLN_CreateImageTileset")
    CreateImageTileset :: proc(numtiles : _c.int, images : ^TLN_TileImage) -> TLN_Tileset ---;

    @(link_name="TLN_LoadTileset")
    LoadTileset :: proc(filename : cstring) -> TLN_Tileset ---;

    @(link_name="TLN_CloneTileset")
    CloneTileset :: proc(src : TLN_Tileset) -> TLN_Tileset ---;

    @(link_name="TLN_SetTilesetPixels")
    SetTilesetPixels :: proc(tileset : TLN_Tileset, entry : _c.int, srcdata : ^u8, srcpitch : _c.int) -> bool ---;

    @(link_name="TLN_GetTileWidth")
    GetTileWidth :: proc(tileset : TLN_Tileset) -> _c.int ---;

    @(link_name="TLN_GetTileHeight")
    GetTileHeight :: proc(tileset : TLN_Tileset) -> _c.int ---;

    @(link_name="TLN_GetTilesetNumTiles")
    GetTilesetNumTiles :: proc(tileset : TLN_Tileset) -> _c.int ---;

    @(link_name="TLN_GetTilesetPalette")
    GetTilesetPalette :: proc(tileset : TLN_Tileset) -> TLN_Palette ---;

    @(link_name="TLN_GetTilesetSequencePack")
    GetTilesetSequencePack :: proc(tileset : TLN_Tileset) -> TLN_SequencePack ---;

    @(link_name="TLN_DeleteTileset")
    DeleteTileset :: proc(tileset : TLN_Tileset) -> bool ---;

    @(link_name="TLN_CreateTilemap")
    CreateTilemap :: proc(rows : _c.int, cols : _c.int, tiles : TLN_Tile, bgcolor : u32, tileset : TLN_Tileset) -> TLN_Tilemap ---;

    @(link_name="TLN_LoadTilemap")
    LoadTilemap :: proc(filename : cstring, layername : cstring = "Layer 1") -> TLN_Tilemap ---;

    @(link_name="TLN_CloneTilemap")
    CloneTilemap :: proc(src : TLN_Tilemap) -> TLN_Tilemap ---;

    @(link_name="TLN_GetTilemapRows")
    GetTilemapRows :: proc(tilemap : TLN_Tilemap) -> _c.int ---;

    @(link_name="TLN_GetTilemapCols")
    GetTilemapCols :: proc(tilemap : TLN_Tilemap) -> _c.int ---;

    @(link_name="TLN_SetTilemapTileset")
    SetTilemapTileset :: proc(tilemap : TLN_Tilemap, tileset : TLN_Tileset) -> bool ---;

    @(link_name="TLN_GetTilemapTileset")
    GetTilemapTileset :: proc(tilemap : TLN_Tilemap) -> TLN_Tileset ---;

    @(link_name="TLN_SetTilemapTileset2")
    SetTilemapTileset2 :: proc(tilemap : TLN_Tilemap, tileset : TLN_Tileset, index : _c.int) -> bool ---;

    @(link_name="TLN_GetTilemapTileset2")
    GetTilemapTileset2 :: proc(tilemap : TLN_Tilemap, index : _c.int) -> TLN_Tileset ---;

    @(link_name="TLN_GetTilemapTile")
    GetTilemapTile :: proc(tilemap : TLN_Tilemap, row : _c.int, col : _c.int, tile : TLN_Tile) -> bool ---;

    @(link_name="TLN_SetTilemapTile")
    SetTilemapTile :: proc(tilemap : TLN_Tilemap, row : _c.int, col : _c.int, tile : TLN_Tile) -> bool ---;

    @(link_name="TLN_CopyTiles")
    CopyTiles :: proc(src : TLN_Tilemap, srcrow : _c.int, srccol : _c.int, rows : _c.int, cols : _c.int, dst : TLN_Tilemap, dstrow : _c.int, dstcol : _c.int) -> bool ---;

    @(link_name="TLN_GetTilemapTiles")
    GetTilemapTiles :: proc(tilemap : TLN_Tilemap, row : _c.int, col : _c.int) -> TLN_Tile ---;

    @(link_name="TLN_DeleteTilemap")
    DeleteTilemap :: proc(tilemap : TLN_Tilemap) -> bool ---;

    @(link_name="TLN_CreatePalette")
    CreatePalette :: proc(entries : _c.int) -> TLN_Palette ---;

    @(link_name="TLN_LoadPalette")
    LoadPalette :: proc(filename : cstring) -> TLN_Palette ---;

    @(link_name="TLN_ClonePalette")
    ClonePalette :: proc(src : TLN_Palette) -> TLN_Palette ---;

    @(link_name="TLN_SetPaletteColor")
    SetPaletteColor :: proc(palette : TLN_Palette, color : _c.int, r : u8, g : u8, b : u8) -> bool ---;

    @(link_name="TLN_MixPalettes")
    MixPalettes :: proc(src1 : TLN_Palette, src2 : TLN_Palette, dst : TLN_Palette, factor : u8) -> bool ---;

    @(link_name="TLN_AddPaletteColor")
    AddPaletteColor :: proc(palette : TLN_Palette, r : u8, g : u8, b : u8, start : u8, num : u8) -> bool ---;

    @(link_name="TLN_SubPaletteColor")
    SubPaletteColor :: proc(palette : TLN_Palette, r : u8, g : u8, b : u8, start : u8, num : u8) -> bool ---;

    @(link_name="TLN_ModPaletteColor")
    ModPaletteColor :: proc(palette : TLN_Palette, r : u8, g : u8, b : u8, start : u8, num : u8) -> bool ---;

    @(link_name="TLN_GetPaletteData")
    GetPaletteData :: proc(palette : TLN_Palette, index : _c.int) -> ^u8 ---;

    @(link_name="TLN_GetPaletteNumColors")
    GetPaletteNumColors :: proc(palette : TLN_Palette) -> _c.int ---;

    @(link_name="TLN_DeletePalette")
    DeletePalette :: proc(palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_CreateBitmap")
    CreateBitmap :: proc(width : _c.int, height : _c.int, bpp : _c.int) -> TLN_Bitmap ---;

    @(link_name="TLN_LoadBitmap")
    LoadBitmap :: proc(filename : cstring) -> TLN_Bitmap ---;

    @(link_name="TLN_CloneBitmap")
    CloneBitmap :: proc(src : TLN_Bitmap) -> TLN_Bitmap ---;

    @(link_name="TLN_GetBitmapPtr")
    GetBitmapPtr :: proc(bitmap : TLN_Bitmap, x : _c.int, y : _c.int) -> ^u8 ---;

    @(link_name="TLN_GetBitmapWidth")
    GetBitmapWidth :: proc(bitmap : TLN_Bitmap) -> _c.int ---;

    @(link_name="TLN_GetBitmapHeight")
    GetBitmapHeight :: proc(bitmap : TLN_Bitmap) -> _c.int ---;

    @(link_name="TLN_GetBitmapDepth")
    GetBitmapDepth :: proc(bitmap : TLN_Bitmap) -> _c.int ---;

    @(link_name="TLN_GetBitmapPitch")
    GetBitmapPitch :: proc(bitmap : TLN_Bitmap) -> _c.int ---;

    @(link_name="TLN_GetBitmapPalette")
    GetBitmapPalette :: proc(bitmap : TLN_Bitmap) -> TLN_Palette ---;

    @(link_name="TLN_SetBitmapPalette")
    SetBitmapPalette :: proc(bitmap : TLN_Bitmap, palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_DeleteBitmap")
    DeleteBitmap :: proc(bitmap : TLN_Bitmap) -> bool ---;

    @(link_name="TLN_CreateObjectList")
    CreateObjectList :: proc() -> TLN_ObjectList ---;

    @(link_name="TLN_AddTileObjectToList")
    AddTileObjectToList :: proc(list : TLN_ObjectList, id : u16, gid : u16, flags : u16, x : _c.int, y : _c.int) -> bool ---;

    @(link_name="TLN_LoadObjectList")
    LoadObjectList :: proc(filename : cstring, layername : cstring) -> TLN_ObjectList ---;

    @(link_name="TLN_CloneObjectList")
    CloneObjectList :: proc(src : TLN_ObjectList) -> TLN_ObjectList ---;

    @(link_name="TLN_GetListNumObjects")
    GetListNumObjects :: proc(list : TLN_ObjectList) -> _c.int ---;

    @(link_name="TLN_GetListObject")
    GetListObject :: proc(list : TLN_ObjectList, info : ^TLN_ObjectInfo) -> bool ---;

    @(link_name="TLN_DeleteObjectList")
    DeleteObjectList :: proc(list : TLN_ObjectList) -> bool ---;

    @(link_name="TLN_SetLayer")
    SetLayer :: proc(nlayer : _c.int, tileset : TLN_Tileset, tilemap : TLN_Tilemap) -> bool ---;

    @(link_name="TLN_SetLayerTilemap")
    SetLayerTilemap :: proc(nlayer : _c.int, tilemap : TLN_Tilemap) -> bool ---;

    @(link_name="TLN_SetLayerBitmap")
    SetLayerBitmap :: proc(nlayer : _c.int, bitmap : TLN_Bitmap) -> bool ---;

    @(link_name="TLN_SetLayerPalette")
    SetLayerPalette :: proc(nlayer : _c.int, palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_SetLayerPosition")
    SetLayerPosition :: proc(nlayer : _c.int, hstart : _c.int, vstart : _c.int) -> bool ---;

    @(link_name="TLN_SetLayerScaling")
    SetLayerScaling :: proc(nlayer : _c.int, xfactor : _c.float, yfactor : _c.float) -> bool ---;

    @(link_name="TLN_SetLayerAffineTransform")
    SetLayerAffineTransform :: proc(nlayer : _c.int, affine : ^TLN_Affine) -> bool ---;

    @(link_name="TLN_SetLayerTransform")
    SetLayerTransform :: proc(layer : _c.int, angle : _c.float, dx : _c.float, dy : _c.float, sx : _c.float, sy : _c.float) -> bool ---;

    @(link_name="TLN_SetLayerPixelMapping")
    SetLayerPixelMapping :: proc(nlayer : _c.int, table : ^TLN_PixelMap) -> bool ---;

    @(link_name="TLN_SetLayerBlendMode")
    SetLayerBlendMode :: proc(nlayer : _c.int, mode : TLN_Blend, factor : u8) -> bool ---;

    @(link_name="TLN_SetLayerColumnOffset")
    SetLayerColumnOffset :: proc(nlayer : _c.int, offset : ^_c.int) -> bool ---;

    @(link_name="TLN_SetLayerClip")
    SetLayerClip :: proc(nlayer : _c.int, x1 : _c.int, y1 : _c.int, x2 : _c.int, y2 : _c.int) -> bool ---;

    @(link_name="TLN_DisableLayerClip")
    DisableLayerClip :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_SetLayerWindow")
    SetLayerWindow :: proc(nlayer : _c.int, x1 : _c.int, y1 : _c.int, x2 : _c.int, y2 : _c.int, invert : bool) -> bool ---;

    @(link_name="TLN_SetLayerWindowColor")
    SetLayerWindowColor :: proc(nlayer : _c.int, r : u8, g : u8, b : u8, blend : TLN_Blend) -> bool ---;

    @(link_name="TLN_DisableLayerWindow")
    DisableLayerWindow :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_DisableLayerWindowColor")
    DisableLayerWindowColor :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_SetLayerMosaic")
    SetLayerMosaic :: proc(nlayer : _c.int, width : _c.int, height : _c.int) -> bool ---;

    @(link_name="TLN_DisableLayerMosaic")
    DisableLayerMosaic :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_ResetLayerMode")
    ResetLayerMode :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_SetLayerObjects")
    SetLayerObjects :: proc(nlayer : _c.int, objects : TLN_ObjectList, tileset : TLN_Tileset) -> bool ---;

    @(link_name="TLN_SetLayerPriority")
    SetLayerPriority :: proc(nlayer : _c.int, enable : bool) -> bool ---;

    @(link_name="TLN_SetLayerParent")
    SetLayerParent :: proc(nlayer : _c.int, parent : _c.int) -> bool ---;

    @(link_name="TLN_DisableLayerParent")
    DisableLayerParent :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_DisableLayer")
    DisableLayer :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_EnableLayer")
    EnableLayer :: proc(nlayer : _c.int) -> bool ---;

    @(link_name="TLN_GetLayerType")
    GetLayerType :: proc(nlayer : _c.int) -> TLN_LayerType ---;

    @(link_name="TLN_GetLayerPalette")
    GetLayerPalette :: proc(nlayer : _c.int) -> TLN_Palette ---;

    @(link_name="TLN_GetLayerTileset")
    GetLayerTileset :: proc(nlayer : _c.int) -> TLN_Tileset ---;

    @(link_name="TLN_GetLayerTilemap")
    GetLayerTilemap :: proc(nlayer : _c.int) -> TLN_Tilemap ---;

    @(link_name="TLN_GetLayerBitmap")
    GetLayerBitmap :: proc(nlayer : _c.int) -> TLN_Bitmap ---;

    @(link_name="TLN_GetLayerObjects")
    GetLayerObjects :: proc(nlayer : _c.int) -> TLN_ObjectList ---;

    @(link_name="TLN_GetLayerTile")
    GetLayerTile :: proc(nlayer : _c.int, x : _c.int, y : _c.int, info : ^TLN_TileInfo) -> bool ---;

    @(link_name="TLN_GetLayerWidth")
    GetLayerWidth :: proc(nlayer : _c.int) -> _c.int ---;

    @(link_name="TLN_GetLayerHeight")
    GetLayerHeight :: proc(nlayer : _c.int) -> _c.int ---;

    @(link_name="TLN_GetLayerX")
    GetLayerX :: proc(nlayer : _c.int) -> _c.int ---;

    @(link_name="TLN_GetLayerY")
    GetLayerY :: proc(nlayer : _c.int) -> _c.int ---;

    @(link_name="TLN_ConfigSprite")
    ConfigSprite :: proc(nsprite : _c.int, spriteset : TLN_Spriteset, flags : TLN_TileFlags) -> bool ---;

    @(link_name="TLN_SetSpriteSet")
    SetSpriteSet :: proc(nsprite : _c.int, spriteset : TLN_Spriteset) -> bool ---;

    @(link_name="TLN_SetSpriteFlags")
    SetSpriteFlags :: proc(nsprite : _c.int, flags : TLN_TileFlags) -> bool ---;

    @(link_name="TLN_EnableSpriteFlag")
    EnableSpriteFlag :: proc(nsprite : _c.int, flag : TLN_TileFlags, enable : bool) -> bool ---;

    @(link_name="TLN_SetSpritePivot")
    SetSpritePivot :: proc(nsprite : _c.int, px : _c.float, py : _c.float) -> bool ---;

    @(link_name="TLN_SetSpritePosition")
    SetSpritePosition :: proc(nsprite : _c.int, x : _c.int, y : _c.int) -> bool ---;

    @(link_name="TLN_SetSpritePicture")
    SetSpritePicture :: proc(nsprite : _c.int, entry : _c.int) -> bool ---;

    @(link_name="TLN_SetSpritePalette")
    SetSpritePalette :: proc(nsprite : _c.int, palette : TLN_Palette) -> bool ---;

    @(link_name="TLN_SetSpriteBlendMode")
    SetSpriteBlendMode :: proc(nsprite : _c.int, mode : TLN_Blend, factor : u8) -> bool ---;

    @(link_name="TLN_SetSpriteScaling")
    SetSpriteScaling :: proc(nsprite : _c.int, sx : _c.float, sy : _c.float) -> bool ---;

    @(link_name="TLN_ResetSpriteScaling")
    ResetSpriteScaling :: proc(nsprite : _c.int) -> bool ---;

    @(link_name="TLN_GetSpritePicture")
    GetSpritePicture :: proc(nsprite : _c.int) -> _c.int ---;

    @(link_name="TLN_GetSpriteX")
    GetSpriteX :: proc(nsprite : _c.int) -> _c.int ---;

    @(link_name="TLN_GetSpriteY")
    GetSpriteY :: proc(nsprite : _c.int) -> _c.int ---;

    @(link_name="TLN_GetAvailableSprite")
    GetAvailableSprite :: proc() -> _c.int ---;

    @(link_name="TLN_EnableSpriteCollision")
    EnableSpriteCollision :: proc(nsprite : _c.int, enable : bool) -> bool ---;

    @(link_name="TLN_GetSpriteCollision")
    GetSpriteCollision :: proc(nsprite : _c.int) -> bool ---;

    @(link_name="TLN_GetSpriteState")
    GetSpriteState :: proc(nsprite : _c.int, state : ^TLN_SpriteState) -> bool ---;

    @(link_name="TLN_SetFirstSprite")
    SetFirstSprite :: proc(nsprite : _c.int) -> bool ---;

    @(link_name="TLN_SetNextSprite")
    SetNextSprite :: proc(nsprite : _c.int, next : _c.int) -> bool ---;

    @(link_name="TLN_EnableSpriteMasking")
    EnableSpriteMasking :: proc(nsprite : _c.int, enable : bool) -> bool ---;

    @(link_name="TLN_SetSpritesMaskRegion")
    SetSpritesMaskRegion :: proc(top_line : _c.int, bottom_line : _c.int) ---;

    @(link_name="TLN_SetSpriteAnimation")
    SetSpriteAnimation :: proc(nsprite : _c.int, sequence : TLN_Sequence, loop : _c.int) -> bool ---;

    @(link_name="TLN_DisableSpriteAnimation")
    DisableSpriteAnimation :: proc(nsprite : _c.int) -> bool ---;

    @(link_name="TLN_PauseSpriteAnimation")
    PauseSpriteAnimation :: proc(index : _c.int) -> bool ---;

    @(link_name="TLN_ResumeSpriteAnimation")
    ResumeSpriteAnimation :: proc(index : _c.int) -> bool ---;

    @(link_name="TLN_DisableAnimation")
    DisableAnimation :: proc(index : _c.int) -> bool ---;

    @(link_name="TLN_DisableSprite")
    DisableSprite :: proc(nsprite : _c.int) -> bool ---;

    @(link_name="TLN_GetSpritePalette")
    GetSpritePalette :: proc(nsprite : _c.int) -> TLN_Palette ---;

    @(link_name="TLN_CreateSequence")
    CreateSequence :: proc(name : cstring, target : _c.int, num_frames : _c.int, frames : ^TLN_SequenceFrame) -> TLN_Sequence ---;

    @(link_name="TLN_CreateCycle")
    CreateCycle :: proc(name : cstring, num_strips : _c.int, strips : ^TLN_ColorStrip) -> TLN_Sequence ---;

    @(link_name="TLN_CreateSpriteSequence")
    CreateSpriteSequence :: proc(name : cstring, spriteset : TLN_Spriteset, basename : cstring, delay : _c.int) -> TLN_Sequence ---;

    @(link_name="TLN_CloneSequence")
    CloneSequence :: proc(src : TLN_Sequence) -> TLN_Sequence ---;

    @(link_name="TLN_GetSequenceInfo")
    GetSequenceInfo :: proc(sequence : TLN_Sequence, info : ^TLN_SequenceInfo) -> bool ---;

    @(link_name="TLN_DeleteSequence")
    DeleteSequence :: proc(sequence : TLN_Sequence) -> bool ---;

    @(link_name="TLN_CreateSequencePack")
    CreateSequencePack :: proc() -> TLN_SequencePack ---;

    @(link_name="TLN_LoadSequencePack")
    LoadSequencePack :: proc(filename : cstring) -> TLN_SequencePack ---;

    @(link_name="TLN_GetSequence")
    GetSequence :: proc(sp : TLN_SequencePack, index : _c.int) -> TLN_Sequence ---;

    @(link_name="TLN_FindSequence")
    FindSequence :: proc(sp : TLN_SequencePack, name : cstring) -> TLN_Sequence ---;

    @(link_name="TLN_GetSequencePackCount")
    GetSequencePackCount :: proc(sp : TLN_SequencePack) -> _c.int ---;

    @(link_name="TLN_AddSequenceToPack")
    AddSequenceToPack :: proc(sp : TLN_SequencePack, sequence : TLN_Sequence) -> bool ---;

    @(link_name="TLN_DeleteSequencePack")
    DeleteSequencePack :: proc(sp : TLN_SequencePack) -> bool ---;

    @(link_name="TLN_SetPaletteAnimation")
    SetPaletteAnimation :: proc(index : _c.int, palette : TLN_Palette, sequence : TLN_Sequence, blend : bool) -> bool ---;

    @(link_name="TLN_SetPaletteAnimationSource")
    SetPaletteAnimationSource :: proc(index : _c.int, unamed0 : TLN_Palette) -> bool ---;

    @(link_name="TLN_GetAnimationState")
    GetAnimationState :: proc(index : _c.int) -> bool ---;

    @(link_name="TLN_SetAnimationDelay")
    SetAnimationDelay :: proc(index : _c.int, frame : _c.int, delay : _c.int) -> bool ---;

    @(link_name="TLN_GetAvailableAnimation")
    GetAvailableAnimation :: proc() -> _c.int ---;

    @(link_name="TLN_DisablePaletteAnimation")
    DisablePaletteAnimation :: proc(index : _c.int) -> bool ---;

    @(link_name="TLN_LoadWorld")
    LoadWorld :: proc(tmxfile : cstring, first_layer : _c.int) -> bool ---;

    @(link_name="TLN_SetWorldPosition")
    SetWorldPosition :: proc(x : _c.int, y : _c.int) ---;

    @(link_name="TLN_SetLayerParallaxFactor")
    SetLayerParallaxFactor :: proc(nlayer : _c.int, x : _c.float, y : _c.float) -> bool ---;

    @(link_name="TLN_SetSpriteWorldPosition")
    SetSpriteWorldPosition :: proc(nsprite : _c.int, x : _c.int, y : _c.int) -> bool ---;

    @(link_name="TLN_ReleaseWorld")
    ReleaseWorld :: proc() ---;

}
