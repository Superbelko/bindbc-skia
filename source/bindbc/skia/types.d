module bindbc.skia.types;

enum SkiaSupport {
    noLibrary,
    badLibrary,
    skia10      = 10 // no idea, there is no version getter so assume v1.0 format
}



alias sk_color_t = uint;

alias sk_cliptype_t = int;
enum : sk_cliptype_t
{
    INTERSECT_SK_CLIPTYPE = 0, 
    DIFFERENCE_SK_CLIPTYPE = 1, 
}

alias sk_pixelgeometry_t = int;
enum : sk_pixelgeometry_t
{
    UNKNOWN_SK_PIXELGEOMETRY = 0, 
    RGB_H_SK_PIXELGEOMETRY = 1, 
    BGR_H_SK_PIXELGEOMETRY = 2, 
    RGB_V_SK_PIXELGEOMETRY = 3, 
    BGR_V_SK_PIXELGEOMETRY = 4, 
}

extern(C)
struct sk_surfaceprops_t
{
    sk_pixelgeometry_t pixelGeometry;
}


extern(C)
struct sk_point_t
{
    float x;
    float y;
}


extern(C)
struct sk_irect_t
{
    int left;
    int top;
    int right;
    int bottom;
}


extern(C)
struct sk_rect_t
{
    float left;
    float top;
    float right;
    float bottom;
}


extern(C)
struct sk_matrix_t
{
    float[9] mat;
}


alias sk_filter_mode_t = int;
enum : sk_filter_mode_t
{
    NEAREST_SK_FILTER_MODE = 0, 
    LINEAR_SK_FILTER_MODE = 1, 
}

alias sk_mipmap_mode_t = int;
enum : sk_mipmap_mode_t
{
    NONE_SK_MIPMAP_MODE = 0, 
    NEAREST_SK_MIPMAP_MODE = 1, 
    LINEAR_SK_MIPMAP_MODE = 2, 
}

extern(C)
struct sk_cubic_resampler_t
{
    float B;
    float C;
}


extern(C)
struct sk_sampling_options_t
{
    bool useCubic;
    sk_cubic_resampler_t cubic;
    sk_filter_mode_t filter;
    sk_mipmap_mode_t mipmap;
}


alias sk_xfermode_mode_t = int;
enum : sk_xfermode_mode_t
{
    CLEAR_SK_XFERMODE_MODE = 0, 
    SRC_SK_XFERMODE_MODE = 1, 
    DST_SK_XFERMODE_MODE = 2, 
    SRCOVER_SK_XFERMODE_MODE = 3, 
    DSTOVER_SK_XFERMODE_MODE = 4, 
    SRCIN_SK_XFERMODE_MODE = 5, 
    DSTIN_SK_XFERMODE_MODE = 6, 
    SRCOUT_SK_XFERMODE_MODE = 7, 
    DSTOUT_SK_XFERMODE_MODE = 8, 
    SRCATOP_SK_XFERMODE_MODE = 9, 
    DSTATOP_SK_XFERMODE_MODE = 10, 
    XOR_SK_XFERMODE_MODE = 11, 
    PLUS_SK_XFERMODE_MODE = 12, 
    MODULATE_SK_XFERMODE_MODE = 13, 
    SCREEN_SK_XFERMODE_MODE = 14, 
    OVERLAY_SK_XFERMODE_MODE = 15, 
    DARKEN_SK_XFERMODE_MODE = 16, 
    LIGHTEN_SK_XFERMODE_MODE = 17, 
    COLORDODGE_SK_XFERMODE_MODE = 18, 
    COLORBURN_SK_XFERMODE_MODE = 19, 
    HARDLIGHT_SK_XFERMODE_MODE = 20, 
    SOFTLIGHT_SK_XFERMODE_MODE = 21, 
    DIFFERENCE_SK_XFERMODE_MODE = 22, 
    EXCLUSION_SK_XFERMODE_MODE = 23, 
    MULTIPLY_SK_XFERMODE_MODE = 24, 
    HUE_SK_XFERMODE_MODE = 25, 
    SATURATION_SK_XFERMODE_MODE = 26, 
    COLOR_SK_XFERMODE_MODE = 27, 
    LUMINOSITY_SK_XFERMODE_MODE = 28, 
}


alias sk_colortype_t = int;
enum : sk_colortype_t
{
    UNKNOWN_SK_COLORTYPE = 0, 
    RGBA_8888_SK_COLORTYPE = 1, 
    BGRA_8888_SK_COLORTYPE = 2, 
    ALPHA_8_SK_COLORTYPE = 3, 
    GRAY_8_SK_COLORTYPE = 4, 
    RGBA_F16_SK_COLORTYPE = 5, 
    RGBA_F32_SK_COLORTYPE = 6, 
}

alias sk_alphatype_t = int;
enum : sk_alphatype_t
{
    OPAQUE_SK_ALPHATYPE = 0, 
    PREMUL_SK_ALPHATYPE = 1, 
    UNPREMUL_SK_ALPHATYPE = 2, 
}


alias sk_blurstyle_t = int;
enum : sk_blurstyle_t
{
    NORMAL_SK_BLUR_STYLE = 0, 
    SOLID_SK_BLUR_STYLE = 1, 
    OUTER_SK_BLUR_STYLE = 2, 
    INNER_SK_BLUR_STYLE = 3, 
}


alias sk_stroke_cap_t = int;
enum : sk_stroke_cap_t
{
    BUTT_SK_STROKE_CAP = 0, 
    ROUND_SK_STROKE_CAP = 1, 
    SQUARE_SK_STROKE_CAP = 2, 
}


alias sk_stroke_join_t = int;
enum : sk_stroke_join_t
{
    MITER_SK_STROKE_JOIN = 0, 
    ROUND_SK_STROKE_JOIN = 1, 
    BEVEL_SK_STROKE_JOIN = 2, 
}


alias sk_path_direction_t = int;
enum : sk_path_direction_t
{
    CW_SK_PATH_DIRECTION = 0, 
    CCW_SK_PATH_DIRECTION = 1, 
}


alias sk_shader_tilemode_t = int;
enum : sk_shader_tilemode_t
{
    CLAMP_SK_SHADER_TILEMODE = 0, 
    REPEAT_SK_SHADER_TILEMODE = 1, 
    MIRROR_SK_SHADER_TILEMODE = 2, 
}

// these was a macro, let's keep em there for now
int sk_color_set_argb(int a, int r, int g, int b) { return (((a)<<24)|((r)<<16)|((g)<<8)|(b)); }
int sk_color_get_a(int c) { return (((c)>>24)&0xFF); }
int sk_color_get_r(int c) { return (((c)>>16)&0xFF); }
int sk_color_get_g(int c) { return (((c)>>8)&0xFF); }
int sk_color_get_b(int c) { return (((c)>>0)&0xFF); }

version(BindSkia_NoGC_Callbacks) {
    extern(C) @nogc nothrow {
        // none
    }
}
else {
    extern(C) nothrow {
        // none
    }
}


struct sk_picture_t;
struct sk_maskfilter_t;
struct sk_paint_t;
struct sk_canvas_t;
struct sk_data_t;
struct sk_imageinfo_t;
struct sk_image_t;
struct sk_colorspace_t;
struct sk_path_t;
struct sk_picture_recorder_t;
struct sk_shader_t;
struct sk_surface_t;
struct sk_pathbuilder_t;
