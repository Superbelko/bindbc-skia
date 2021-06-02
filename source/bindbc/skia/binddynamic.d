module bindbc.skia.binddynamic;


version(BindBC_Static) {}
else version(BindSkia_Static) {}
else version = BindSkia_Dynamic;

version(BindSkia_Dynamic):

import bindbc.loader;
import bindbc.skia.types;


extern(C) @nogc nothrow {
    alias psk_canvas_save = void function(sk_canvas_t* );
    alias psk_canvas_save_layer = void function(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    alias psk_canvas_restore = void function(sk_canvas_t* );
    alias psk_canvas_translate = void function(sk_canvas_t* , float dx, float dy);
    alias psk_canvas_scale = void function(sk_canvas_t* , float sx, float sy);
    alias psk_canvas_rotate_degrees = void function(sk_canvas_t* , float degrees);
    alias psk_canvas_rotate_radians = void function(sk_canvas_t* , float radians);
    alias psk_canvas_skew = void function(sk_canvas_t* , float sx, float sy);
    alias psk_canvas_concat = void function(sk_canvas_t* , const(sk_matrix_t)* );
    alias psk_canvas_clip_rect = void function(sk_canvas_t* , const(sk_rect_t)* );
    alias psk_canvas_clip_path = void function(sk_canvas_t* , const(sk_path_t)* );
    alias psk_canvas_draw_paint = void function(sk_canvas_t* , const(sk_paint_t)* );
    alias psk_canvas_draw_rect = void function(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    alias psk_canvas_draw_circle = void function(sk_canvas_t* , float cx, float cy, float rad, const(sk_paint_t)* );
    alias psk_canvas_draw_oval = void function(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    alias psk_canvas_draw_path = void function(sk_canvas_t* , const(sk_path_t)* , const(sk_paint_t)* );
    alias psk_canvas_draw_image = void function(sk_canvas_t* , const(sk_image_t)* , float x, float y, const(sk_sampling_options_t)* , const(sk_paint_t)* );
    alias psk_canvas_draw_image_rect = void function(sk_canvas_t* , const(sk_image_t)* , const(sk_rect_t)* src, const(sk_rect_t)* dst, const(sk_sampling_options_t)* , const(sk_paint_t)* );
    alias psk_canvas_draw_picture = void function(sk_canvas_t* , const(sk_picture_t)* , const(sk_matrix_t)* , const(sk_paint_t)* );
    alias psk_colorspace_new_srgb = sk_colorspace_t* function();
    alias psk_colorspace_ref = void function(sk_colorspace_t* );
    alias psk_colorspace_unref = void function(sk_colorspace_t* );
    alias psk_data_new_with_copy = sk_data_t* function(const(void)* src, size_t length);
    alias psk_data_new_from_malloc = sk_data_t* function(const(void)* memory, size_t length);
    alias psk_data_new_subset = sk_data_t* function(const(sk_data_t)* src, size_t offset, size_t length);
    alias psk_data_ref = void function(const(sk_data_t)* );
    alias psk_data_unref = void function(const(sk_data_t)* );
    alias psk_data_get_size = size_t function(const(sk_data_t)* );
    alias psk_data_get_data = const(void)* function(const(sk_data_t)* );
    alias psk_image_new_raster_copy = sk_image_t* function(const(sk_imageinfo_t)* , const(void)* pixels, size_t rowBytes);
    alias psk_image_new_from_encoded = sk_image_t* function(const(sk_data_t)* encoded);
    alias psk_image_encode = sk_data_t* function(const(sk_image_t)* );
    alias psk_image_ref = void function(const(sk_image_t)* );
    alias psk_image_unref = void function(const(sk_image_t)* );
    alias psk_image_get_width = int function(const(sk_image_t)* );
    alias psk_image_get_height = int function(const(sk_image_t)* );
    alias psk_image_get_unique_id = uint function(const(sk_image_t)* );
    alias psk_imageinfo_new = sk_imageinfo_t* function(int width, int height, sk_colortype_t ct, sk_alphatype_t at, sk_colorspace_t* cs);
    alias psk_imageinfo_delete = void function(sk_imageinfo_t* );
    alias psk_imageinfo_get_width = int function(const(sk_imageinfo_t)* );
    alias psk_imageinfo_get_height = int function(const(sk_imageinfo_t)* );
    alias psk_imageinfo_get_colortype = sk_colortype_t function(const(sk_imageinfo_t)* );
    alias psk_imageinfo_get_alphatype = sk_alphatype_t function(const(sk_imageinfo_t)* );
    alias psk_imageinfo_get_colorspace = sk_colorspace_t* function(const(sk_imageinfo_t)* );
    alias psk_maskfilter_ref = void function(sk_maskfilter_t* );
    alias psk_maskfilter_unref = void function(sk_maskfilter_t* );
    alias psk_maskfilter_new_blur = sk_maskfilter_t* function(sk_blurstyle_t , float sigma);
    alias psk_matrix_set_identity = void function(sk_matrix_t* );
    alias psk_matrix_set_translate = void function(sk_matrix_t* , float tx, float ty);
    alias psk_matrix_pre_translate = void function(sk_matrix_t* , float tx, float ty);
    alias psk_matrix_post_translate = void function(sk_matrix_t* , float tx, float ty);
    alias psk_matrix_set_scale = void function(sk_matrix_t* , float sx, float sy);
    alias psk_matrix_pre_scale = void function(sk_matrix_t* , float sx, float sy);
    alias psk_matrix_post_scale = void function(sk_matrix_t* , float sx, float sy);
    alias psk_paint_new = sk_paint_t* function();
    alias psk_paint_delete = void function(sk_paint_t* );
    alias psk_paint_is_antialias = bool function(const(sk_paint_t)* );
    alias psk_paint_set_antialias = void function(sk_paint_t* , bool );
    alias psk_paint_get_color = sk_color_t function(const(sk_paint_t)* );
    alias psk_paint_set_color = void function(sk_paint_t* , sk_color_t );
    alias psk_paint_is_stroke = bool function(const(sk_paint_t)* );
    alias psk_paint_set_stroke = void function(sk_paint_t* , bool );
    alias psk_paint_get_stroke_width = float function(const(sk_paint_t)* );
    alias psk_paint_set_stroke_width = void function(sk_paint_t* , float width);
    alias psk_paint_get_stroke_miter = float function(const(sk_paint_t)* );
    alias psk_paint_set_stroke_miter = void function(sk_paint_t* , float miter);
    alias psk_paint_get_stroke_cap = sk_stroke_cap_t function(const(sk_paint_t)* );
    alias psk_paint_set_stroke_cap = void function(sk_paint_t* , sk_stroke_cap_t );
    alias psk_paint_get_stroke_join = sk_stroke_join_t function(const(sk_paint_t)* );
    alias psk_paint_set_stroke_join = void function(sk_paint_t* , sk_stroke_join_t );
    alias psk_paint_set_shader = void function(sk_paint_t* , sk_shader_t* );
    alias psk_paint_set_maskfilter = void function(sk_paint_t* , sk_maskfilter_t* );
    alias psk_paint_set_xfermode_mode = void function(sk_paint_t* , sk_xfermode_mode_t );
    alias psk_pathbuilder_new = sk_pathbuilder_t*function();
    alias psk_pathbuilder_delete = void function(sk_pathbuilder_t* );
    alias psk_pathbuilder_move_to = void function(sk_pathbuilder_t* , float x, float y);
    alias psk_pathbuilder_line_to = void function(sk_pathbuilder_t* , float x, float y);
    alias psk_pathbuilder_quad_to = void function(sk_pathbuilder_t* , float x0, float y0, float x1, float y1);
    alias psk_pathbuilder_conic_to = void function(sk_pathbuilder_t* , float x0, float y0, float x1, float y1, float w);
    alias psk_pathbuilder_cubic_to = void function(sk_pathbuilder_t* , float x0, float y0, float x1, float y1, float x2, float y2);
    alias psk_pathbuilder_close = void function(sk_pathbuilder_t* );
    alias psk_pathbuilder_add_rect = void function(sk_pathbuilder_t* , const(sk_rect_t)* , sk_path_direction_t );
    alias psk_pathbuilder_add_oval = void function(sk_pathbuilder_t* , const(sk_rect_t)* , sk_path_direction_t );
    alias psk_pathbuilder_detach_path = sk_path_t*function(sk_pathbuilder_t* );
    alias psk_pathbuilder_snapshot_path = sk_path_t*function(sk_pathbuilder_t* );
    alias psk_path_delete = void function(sk_path_t* );
    alias psk_path_get_bounds = bool function(const(sk_path_t)* , sk_rect_t* );
    alias psk_picture_recorder_new = sk_picture_recorder_t*function();
    alias psk_picture_recorder_delete = void function(sk_picture_recorder_t* );
    alias psk_picture_recorder_begin_recording = sk_canvas_t*function(sk_picture_recorder_t* , const(sk_rect_t)* );
    alias psk_picture_recorder_end_recording = sk_picture_t*function(sk_picture_recorder_t* );
    alias psk_picture_ref = void function(sk_picture_t* );
    alias psk_picture_unref = void function(sk_picture_t* );
    alias psk_picture_get_unique_id = uint function(sk_picture_t* );
    alias psk_picture_get_bounds = sk_rect_t function(sk_picture_t* );
    alias psk_shader_ref = void function(sk_shader_t* );
    alias psk_shader_unref = void function(sk_shader_t* );
    alias psk_shader_new_linear_gradient = sk_shader_t*function(const(sk_point_t)* points, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    alias psk_shader_new_radial_gradient = sk_shader_t*function(const(sk_point_t)* center, float radius, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    alias psk_shader_new_sweep_gradient = sk_shader_t*function(const(sk_point_t)* center, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, const(sk_matrix_t)* localMatrix);
    alias psk_shader_new_two_point_conical_gradient = sk_shader_t*function(const(sk_point_t)* start, float startRadius, const(sk_point_t)* end, float endRadius, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    alias psk_surface_new_raster = sk_surface_t*function(const(sk_imageinfo_t)* , const(sk_surfaceprops_t)* );
    alias psk_surface_new_raster_direct = sk_surface_t*function(const(sk_imageinfo_t)* , void* pixels, size_t rowBytes, const(sk_surfaceprops_t)* props);
    alias psk_surface_unref = void function(sk_surface_t* );
    alias psk_surface_get_canvas = sk_canvas_t*function(sk_surface_t* );
    alias psk_surface_new_image_snapshot = sk_image_t*function(sk_surface_t* );
}

 __gshared {
    psk_canvas_save sk_canvas_save;
    psk_canvas_save_layer sk_canvas_save_layer;
    psk_canvas_restore sk_canvas_restore;
    psk_canvas_translate sk_canvas_translate;
    psk_canvas_scale sk_canvas_scale;
    psk_canvas_rotate_degrees sk_canvas_rotate_degrees;
    psk_canvas_rotate_radians sk_canvas_rotate_radians;
    psk_canvas_skew sk_canvas_skew;
    psk_canvas_concat sk_canvas_concat;
    psk_canvas_clip_rect sk_canvas_clip_rect;
    psk_canvas_clip_path sk_canvas_clip_path;
    psk_canvas_draw_paint sk_canvas_draw_paint;
    psk_canvas_draw_rect sk_canvas_draw_rect;
    psk_canvas_draw_circle sk_canvas_draw_circle;
    psk_canvas_draw_oval sk_canvas_draw_oval;
    psk_canvas_draw_path sk_canvas_draw_path;
    psk_canvas_draw_image sk_canvas_draw_image;
    psk_canvas_draw_image_rect sk_canvas_draw_image_rect;
    psk_canvas_draw_picture sk_canvas_draw_picture;
    psk_colorspace_new_srgb sk_colorspace_new_srgb;
    psk_colorspace_ref sk_colorspace_ref;
    psk_colorspace_unref sk_colorspace_unref;
    psk_data_new_with_copy sk_data_new_with_copy;
    psk_data_new_from_malloc sk_data_new_from_malloc;
    psk_data_new_subset sk_data_new_subset;
    psk_data_ref sk_data_ref;
    psk_data_unref sk_data_unref;
    psk_data_get_size sk_data_get_size;
    psk_data_get_data sk_data_get_data;
    psk_image_new_raster_copy sk_image_new_raster_copy;
    psk_image_new_from_encoded sk_image_new_from_encoded;
    psk_image_encode sk_image_encode;
    psk_image_ref sk_image_ref;
    psk_image_unref sk_image_unref;
    psk_image_get_width sk_image_get_width;
    psk_image_get_height sk_image_get_height;
    psk_image_get_unique_id sk_image_get_unique_id;
    psk_imageinfo_new sk_imageinfo_new;
    psk_imageinfo_delete sk_imageinfo_delete;
    psk_imageinfo_get_width sk_imageinfo_get_width;
    psk_imageinfo_get_height sk_imageinfo_get_height;
    psk_imageinfo_get_colortype sk_imageinfo_get_colortype;
    psk_imageinfo_get_alphatype sk_imageinfo_get_alphatype;
    psk_imageinfo_get_colorspace sk_imageinfo_get_colorspace;
    psk_maskfilter_ref sk_maskfilter_ref;
    psk_maskfilter_unref sk_maskfilter_unref;
    psk_maskfilter_new_blur sk_maskfilter_new_blur;
    psk_matrix_set_identity sk_matrix_set_identity;
    psk_matrix_set_translate sk_matrix_set_translate;
    psk_matrix_pre_translate sk_matrix_pre_translate;
    psk_matrix_post_translate sk_matrix_post_translate;
    psk_matrix_set_scale sk_matrix_set_scale;
    psk_matrix_pre_scale sk_matrix_pre_scale;
    psk_matrix_post_scale sk_matrix_post_scale;
    psk_paint_new sk_paint_new;
    psk_paint_delete sk_paint_delete;
    psk_paint_is_antialias sk_paint_is_antialias;
    psk_paint_set_antialias sk_paint_set_antialias;
    psk_paint_get_color sk_paint_get_color;
    psk_paint_set_color sk_paint_set_color;
    psk_paint_is_stroke sk_paint_is_stroke;
    psk_paint_set_stroke sk_paint_set_stroke;
    psk_paint_get_stroke_width sk_paint_get_stroke_width;
    psk_paint_set_stroke_width sk_paint_set_stroke_width;
    psk_paint_get_stroke_miter sk_paint_get_stroke_miter;
    psk_paint_set_stroke_miter sk_paint_set_stroke_miter;
    psk_paint_get_stroke_cap sk_paint_get_stroke_cap;
    psk_paint_set_stroke_cap sk_paint_set_stroke_cap;
    psk_paint_get_stroke_join sk_paint_get_stroke_join;
    psk_paint_set_stroke_join sk_paint_set_stroke_join;
    psk_paint_set_shader sk_paint_set_shader;
    psk_paint_set_maskfilter sk_paint_set_maskfilter;
    psk_paint_set_xfermode_mode sk_paint_set_xfermode_mode;
    psk_pathbuilder_new sk_pathbuilder_new;
    psk_pathbuilder_delete sk_pathbuilder_delete;
    psk_pathbuilder_move_to sk_pathbuilder_move_to;
    psk_pathbuilder_line_to sk_pathbuilder_line_to;
    psk_pathbuilder_quad_to sk_pathbuilder_quad_to;
    psk_pathbuilder_conic_to sk_pathbuilder_conic_to;
    psk_pathbuilder_cubic_to sk_pathbuilder_cubic_to;
    psk_pathbuilder_close sk_pathbuilder_close;
    psk_pathbuilder_add_rect sk_pathbuilder_add_rect;
    psk_pathbuilder_add_oval sk_pathbuilder_add_oval;
    psk_pathbuilder_detach_path sk_pathbuilder_detach_path;
    psk_pathbuilder_snapshot_path sk_pathbuilder_snapshot_path;
    psk_path_delete sk_path_delete;
    psk_path_get_bounds sk_path_get_bounds;
    psk_picture_recorder_new sk_picture_recorder_new;
    psk_picture_recorder_delete sk_picture_recorder_delete;
    psk_picture_recorder_begin_recording sk_picture_recorder_begin_recording;
    psk_picture_recorder_end_recording sk_picture_recorder_end_recording;
    psk_picture_ref sk_picture_ref;
    psk_picture_unref sk_picture_unref;
    psk_picture_get_unique_id sk_picture_get_unique_id;
    psk_picture_get_bounds sk_picture_get_bounds;
    psk_shader_ref sk_shader_ref;
    psk_shader_unref sk_shader_unref;
    psk_shader_new_linear_gradient sk_shader_new_linear_gradient;
    psk_shader_new_radial_gradient sk_shader_new_radial_gradient;
    psk_shader_new_sweep_gradient sk_shader_new_sweep_gradient;
    psk_shader_new_two_point_conical_gradient sk_shader_new_two_point_conical_gradient;
    psk_surface_new_raster sk_surface_new_raster;
    psk_surface_new_raster_direct sk_surface_new_raster_direct;
    psk_surface_unref sk_surface_unref;
    psk_surface_get_canvas sk_surface_get_canvas;
    psk_surface_new_image_snapshot sk_surface_new_image_snapshot;
}

private {
    SharedLib lib;
    SkiaSupport loadedVersion;
}

@nogc nothrow:

void unloadSkia()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

SkiaSupport loadedSkiaVersion() @safe
{
    return loadedVersion;
}

bool isSkiaLoaded() @safe
{
    return lib != invalidHandle;
}

/* This is exposed solely to support the optional loader mixins
 at the bottom of the module. */
void bindSkiaSymbol(void** ptr, const(char)* symbolName)
{
    assert(lib != invalidHandle, "GLFW must be loaded before attempting to bind optional functions.");
    lib.bindSymbol(ptr, symbolName);
}


SkiaSupport loadSkia()
{
    version(Windows) {
        const(char)[][1] libNames = ["skia.dll"];
    }
    else version(OSX) {
        const(char)[][1] libNames = [
            "libskia.dylib",
        ];
    }
    else version(Posix) {
        const(char)[][2] libNames = [
            "libskia.so",
            "/usr/local/lib/libskia.so",
        ];
    }
    else static assert(0, "bindbc-skia is not yet supported on this platform.");

    SkiaSupport ret;
    foreach(name; libNames) {
        ret = loadSkia(name.ptr);
        if(ret != SkiaSupport.noLibrary) break;
    }
    return ret;
}

SkiaSupport loadSkia(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return SkiaSupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = SkiaSupport.badLibrary;

    lib.bindSymbol(cast(void**)&sk_canvas_save,"sk_canvas_save");
    lib.bindSymbol(cast(void**)&sk_canvas_save_layer,"sk_canvas_save_layer");
    lib.bindSymbol(cast(void**)&sk_canvas_restore,"sk_canvas_restore");
    lib.bindSymbol(cast(void**)&sk_canvas_translate,"sk_canvas_translate");
    lib.bindSymbol(cast(void**)&sk_canvas_scale,"sk_canvas_scale");
    lib.bindSymbol(cast(void**)&sk_canvas_rotate_degrees,"sk_canvas_rotate_degrees");
    lib.bindSymbol(cast(void**)&sk_canvas_rotate_radians,"sk_canvas_rotate_radians");
    lib.bindSymbol(cast(void**)&sk_canvas_skew,"sk_canvas_skew");
    lib.bindSymbol(cast(void**)&sk_canvas_concat,"sk_canvas_concat");
    lib.bindSymbol(cast(void**)&sk_canvas_clip_rect,"sk_canvas_clip_rect");
    lib.bindSymbol(cast(void**)&sk_canvas_clip_path,"sk_canvas_clip_path");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_paint,"sk_canvas_draw_paint");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_rect,"sk_canvas_draw_rect");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_circle,"sk_canvas_draw_circle");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_oval,"sk_canvas_draw_oval");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_path,"sk_canvas_draw_path");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_image,"sk_canvas_draw_image");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_image_rect,"sk_canvas_draw_image_rect");
    lib.bindSymbol(cast(void**)&sk_canvas_draw_picture,"sk_canvas_draw_picture");
    lib.bindSymbol(cast(void**)&sk_colorspace_new_srgb,"sk_colorspace_new_srgb");
    lib.bindSymbol(cast(void**)&sk_colorspace_ref,"sk_colorspace_ref");
    lib.bindSymbol(cast(void**)&sk_colorspace_unref,"sk_colorspace_unref");
    lib.bindSymbol(cast(void**)&sk_data_new_with_copy,"sk_data_new_with_copy");
    lib.bindSymbol(cast(void**)&sk_data_new_from_malloc,"sk_data_new_from_malloc");
    lib.bindSymbol(cast(void**)&sk_data_new_subset,"sk_data_new_subset");
    lib.bindSymbol(cast(void**)&sk_data_ref,"sk_data_ref");
    lib.bindSymbol(cast(void**)&sk_data_unref,"sk_data_unref");
    lib.bindSymbol(cast(void**)&sk_data_get_size,"sk_data_get_size");
    lib.bindSymbol(cast(void**)&sk_data_get_data,"sk_data_get_data");
    lib.bindSymbol(cast(void**)&sk_image_new_raster_copy,"sk_image_new_raster_copy");
    lib.bindSymbol(cast(void**)&sk_image_new_from_encoded,"sk_image_new_from_encoded");
    lib.bindSymbol(cast(void**)&sk_image_encode,"sk_image_encode");
    lib.bindSymbol(cast(void**)&sk_image_ref,"sk_image_ref");
    lib.bindSymbol(cast(void**)&sk_image_unref,"sk_image_unref");
    lib.bindSymbol(cast(void**)&sk_image_get_width,"sk_image_get_width");
    lib.bindSymbol(cast(void**)&sk_image_get_height,"sk_image_get_height");
    lib.bindSymbol(cast(void**)&sk_image_get_unique_id,"sk_image_get_unique_id");
    lib.bindSymbol(cast(void**)&sk_imageinfo_new,"sk_imageinfo_new");
    lib.bindSymbol(cast(void**)&sk_imageinfo_delete,"sk_imageinfo_delete");
    lib.bindSymbol(cast(void**)&sk_imageinfo_get_width,"sk_imageinfo_get_width");
    lib.bindSymbol(cast(void**)&sk_imageinfo_get_height,"sk_imageinfo_get_height");
    lib.bindSymbol(cast(void**)&sk_imageinfo_get_colortype,"sk_imageinfo_get_colortype");
    lib.bindSymbol(cast(void**)&sk_imageinfo_get_alphatype,"sk_imageinfo_get_alphatype");
    lib.bindSymbol(cast(void**)&sk_imageinfo_get_colorspace,"sk_imageinfo_get_colorspace");
    lib.bindSymbol(cast(void**)&sk_maskfilter_ref,"sk_maskfilter_ref");
    lib.bindSymbol(cast(void**)&sk_maskfilter_unref,"sk_maskfilter_unref");
    lib.bindSymbol(cast(void**)&sk_maskfilter_new_blur,"sk_maskfilter_new_blur");
    lib.bindSymbol(cast(void**)&sk_matrix_set_identity,"sk_matrix_set_identity");
    lib.bindSymbol(cast(void**)&sk_matrix_set_translate,"sk_matrix_set_translate");
    lib.bindSymbol(cast(void**)&sk_matrix_pre_translate,"sk_matrix_pre_translate");
    lib.bindSymbol(cast(void**)&sk_matrix_post_translate,"sk_matrix_post_translate");
    lib.bindSymbol(cast(void**)&sk_matrix_set_scale,"sk_matrix_set_scale");
    lib.bindSymbol(cast(void**)&sk_matrix_pre_scale,"sk_matrix_pre_scale");
    lib.bindSymbol(cast(void**)&sk_matrix_post_scale,"sk_matrix_post_scale");
    lib.bindSymbol(cast(void**)&sk_paint_new,"sk_paint_new");
    lib.bindSymbol(cast(void**)&sk_paint_delete,"sk_paint_delete");
    lib.bindSymbol(cast(void**)&sk_paint_is_antialias,"sk_paint_is_antialias");
    lib.bindSymbol(cast(void**)&sk_paint_set_antialias,"sk_paint_set_antialias");
    lib.bindSymbol(cast(void**)&sk_paint_get_color,"sk_paint_get_color");
    lib.bindSymbol(cast(void**)&sk_paint_set_color,"sk_paint_set_color");
    lib.bindSymbol(cast(void**)&sk_paint_is_stroke,"sk_paint_is_stroke");
    lib.bindSymbol(cast(void**)&sk_paint_set_stroke,"sk_paint_set_stroke");
    lib.bindSymbol(cast(void**)&sk_paint_get_stroke_width,"sk_paint_get_stroke_width");
    lib.bindSymbol(cast(void**)&sk_paint_set_stroke_width,"sk_paint_set_stroke_width");
    lib.bindSymbol(cast(void**)&sk_paint_get_stroke_miter,"sk_paint_get_stroke_miter");
    lib.bindSymbol(cast(void**)&sk_paint_set_stroke_miter,"sk_paint_set_stroke_miter");
    lib.bindSymbol(cast(void**)&sk_paint_get_stroke_cap,"sk_paint_get_stroke_cap");
    lib.bindSymbol(cast(void**)&sk_paint_set_stroke_cap,"sk_paint_set_stroke_cap");
    lib.bindSymbol(cast(void**)&sk_paint_get_stroke_join,"sk_paint_get_stroke_join");
    lib.bindSymbol(cast(void**)&sk_paint_set_stroke_join,"sk_paint_set_stroke_join");
    lib.bindSymbol(cast(void**)&sk_paint_set_shader,"sk_paint_set_shader");
    lib.bindSymbol(cast(void**)&sk_paint_set_maskfilter,"sk_paint_set_maskfilter");
    lib.bindSymbol(cast(void**)&sk_paint_set_xfermode_mode,"sk_paint_set_xfermode_mode");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_new,"sk_pathbuilder_new");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_delete,"sk_pathbuilder_delete");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_move_to,"sk_pathbuilder_move_to");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_line_to,"sk_pathbuilder_line_to");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_quad_to,"sk_pathbuilder_quad_to");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_conic_to,"sk_pathbuilder_conic_to");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_cubic_to,"sk_pathbuilder_cubic_to");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_close,"sk_pathbuilder_close");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_add_rect,"sk_pathbuilder_add_rect");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_add_oval,"sk_pathbuilder_add_oval");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_detach_path,"sk_pathbuilder_detach_path");
    lib.bindSymbol(cast(void**)&sk_pathbuilder_snapshot_path,"sk_pathbuilder_snapshot_path");
    lib.bindSymbol(cast(void**)&sk_path_delete,"sk_path_delete");
    lib.bindSymbol(cast(void**)&sk_path_get_bounds,"sk_path_get_bounds");
    lib.bindSymbol(cast(void**)&sk_picture_recorder_new,"sk_picture_recorder_new");
    lib.bindSymbol(cast(void**)&sk_picture_recorder_delete,"sk_picture_recorder_delete");
    lib.bindSymbol(cast(void**)&sk_picture_recorder_begin_recording,"sk_picture_recorder_begin_recording");
    lib.bindSymbol(cast(void**)&sk_picture_recorder_end_recording,"sk_picture_recorder_end_recording");
    lib.bindSymbol(cast(void**)&sk_picture_ref,"sk_picture_ref");
    lib.bindSymbol(cast(void**)&sk_picture_unref,"sk_picture_unref");
    lib.bindSymbol(cast(void**)&sk_picture_get_unique_id,"sk_picture_get_unique_id");
    lib.bindSymbol(cast(void**)&sk_picture_get_bounds,"sk_picture_get_bounds");
    lib.bindSymbol(cast(void**)&sk_shader_ref,"sk_shader_ref");
    lib.bindSymbol(cast(void**)&sk_shader_unref,"sk_shader_unref");
    lib.bindSymbol(cast(void**)&sk_shader_new_linear_gradient,"sk_shader_new_linear_gradient");
    lib.bindSymbol(cast(void**)&sk_shader_new_radial_gradient,"sk_shader_new_radial_gradient");
    lib.bindSymbol(cast(void**)&sk_shader_new_sweep_gradient,"sk_shader_new_sweep_gradient");
    lib.bindSymbol(cast(void**)&sk_shader_new_two_point_conical_gradient,"sk_shader_new_two_point_conical_gradient");
    lib.bindSymbol(cast(void**)&sk_surface_new_raster,"sk_surface_new_raster");
    lib.bindSymbol(cast(void**)&sk_surface_new_raster_direct,"sk_surface_new_raster_direct");
    lib.bindSymbol(cast(void**)&sk_surface_unref,"sk_surface_unref");
    lib.bindSymbol(cast(void**)&sk_surface_get_canvas,"sk_surface_get_canvas");
    lib.bindSymbol(cast(void**)&sk_surface_new_image_snapshot,"sk_surface_new_image_snapshot");

    if(errorCount() != errCount) return SkiaSupport.badLibrary;
    else loadedVersion = SkiaSupport.skia10;

    return loadedVersion;
}