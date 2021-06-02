module bindbc.skia.bindstatic;


version(BindBC_Static) version = BindSkia_Static;
version(BindSkia_Static):

import bindbc.skia.types;

extern(C) @nogc nothrow {
    void sk_canvas_save(sk_canvas_t* );
    void sk_canvas_save_layer(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    void sk_canvas_restore(sk_canvas_t* );
    void sk_canvas_translate(sk_canvas_t* , float dx, float dy);
    void sk_canvas_scale(sk_canvas_t* , float sx, float sy);
    void sk_canvas_rotate_degrees(sk_canvas_t* , float degrees);
    void sk_canvas_rotate_radians(sk_canvas_t* , float radians);
    void sk_canvas_skew(sk_canvas_t* , float sx, float sy);
    void sk_canvas_concat(sk_canvas_t* , const(sk_matrix_t)* );
    void sk_canvas_clip_rect(sk_canvas_t* , const(sk_rect_t)* );
    void sk_canvas_clip_path(sk_canvas_t* , const(sk_path_t)* );
    void sk_canvas_draw_paint(sk_canvas_t* , const(sk_paint_t)* );
    void sk_canvas_draw_rect(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    void sk_canvas_draw_circle(sk_canvas_t* , float cx, float cy, float rad, const(sk_paint_t)* );
    void sk_canvas_draw_oval(sk_canvas_t* , const(sk_rect_t)* , const(sk_paint_t)* );
    void sk_canvas_draw_path(sk_canvas_t* , const(sk_path_t)* , const(sk_paint_t)* );
    void sk_canvas_draw_image(sk_canvas_t* , const(sk_image_t)* , float x, float y, const(sk_sampling_options_t)* , const(sk_paint_t)* );
    void sk_canvas_draw_image_rect(sk_canvas_t* , const(sk_image_t)* , const(sk_rect_t)* src, const(sk_rect_t)* dst, const(sk_sampling_options_t)* , const(sk_paint_t)* );
    void sk_canvas_draw_picture(sk_canvas_t* , const(sk_picture_t)* , const(sk_matrix_t)* , const(sk_paint_t)* );
    sk_colorspace_t* sk_colorspace_new_srgb();
    void sk_colorspace_ref(sk_colorspace_t* );
    void sk_colorspace_unref(sk_colorspace_t* );
    sk_data_t* sk_data_new_with_copy(const(void)* src, size_t length);
    sk_data_t* sk_data_new_from_malloc(const(void)* memory, size_t length);
    sk_data_t* sk_data_new_subset(const(sk_data_t)* src, size_t offset, size_t length);
    void sk_data_ref(const(sk_data_t)* );
    void sk_data_unref(const(sk_data_t)* );
    size_t sk_data_get_size(const(sk_data_t)* );
    const(void)* sk_data_get_data(const(sk_data_t)* );
    sk_image_t* sk_image_new_raster_copy(const(sk_imageinfo_t)* , const(void)* pixels, size_t rowBytes);
    sk_image_t* sk_image_new_from_encoded(const(sk_data_t)* encoded);
    sk_data_t* sk_image_encode(const(sk_image_t)* );
    void sk_image_ref(const(sk_image_t)* );
    void sk_image_unref(const(sk_image_t)* );
    int sk_image_get_width(const(sk_image_t)* );
    int sk_image_get_height(const(sk_image_t)* );
    uint32_t sk_image_get_unique_id(const(sk_image_t)* );
    sk_imageinfo_t* sk_imageinfo_new(int width, int height, sk_colortype_t ct, sk_alphatype_t at, sk_colorspace_t* cs);
    void sk_imageinfo_delete(sk_imageinfo_t* );
    int32_t sk_imageinfo_get_width(const(sk_imageinfo_t)* );
    int32_t sk_imageinfo_get_height(const(sk_imageinfo_t)* );
    sk_colortype_t sk_imageinfo_get_colortype(const(sk_imageinfo_t)* );
    sk_alphatype_t sk_imageinfo_get_alphatype(const(sk_imageinfo_t)* );
    sk_colorspace_t* sk_imageinfo_get_colorspace(const(sk_imageinfo_t)* );
    void sk_maskfilter_ref(sk_maskfilter_t* );
    void sk_maskfilter_unref(sk_maskfilter_t* );
    sk_maskfilter_t* sk_maskfilter_new_blur(sk_blurstyle_t , float sigma);
    void sk_matrix_set_identity(sk_matrix_t* );
    void sk_matrix_set_translate(sk_matrix_t* , float tx, float ty);
    void sk_matrix_pre_translate(sk_matrix_t* , float tx, float ty);
    void sk_matrix_post_translate(sk_matrix_t* , float tx, float ty);
    void sk_matrix_set_scale(sk_matrix_t* , float sx, float sy);
    void sk_matrix_pre_scale(sk_matrix_t* , float sx, float sy);
    void sk_matrix_post_scale(sk_matrix_t* , float sx, float sy);
    sk_paint_t* sk_paint_new();
    void sk_paint_delete(sk_paint_t* );
    bool sk_paint_is_antialias(const(sk_paint_t)* );
    void sk_paint_set_antialias(sk_paint_t* , bool );
    sk_color_t sk_paint_get_color(const(sk_paint_t)* );
    void sk_paint_set_color(sk_paint_t* , sk_color_t );
    bool sk_paint_is_stroke(const(sk_paint_t)* );
    void sk_paint_set_stroke(sk_paint_t* , bool );
    float sk_paint_get_stroke_width(const(sk_paint_t)* );
    void sk_paint_set_stroke_width(sk_paint_t* , float width);
    float sk_paint_get_stroke_miter(const(sk_paint_t)* );
    void sk_paint_set_stroke_miter(sk_paint_t* , float miter);
    sk_stroke_cap_t sk_paint_get_stroke_cap(const(sk_paint_t)* );
    void sk_paint_set_stroke_cap(sk_paint_t* , sk_stroke_cap_t );
    sk_stroke_join_t sk_paint_get_stroke_join(const(sk_paint_t)* );
    void sk_paint_set_stroke_join(sk_paint_t* , sk_stroke_join_t );
    void sk_paint_set_shader(sk_paint_t* , sk_shader_t* );
    void sk_paint_set_maskfilter(sk_paint_t* , sk_maskfilter_t* );
    void sk_paint_set_xfermode_mode(sk_paint_t* , sk_xfermode_mode_t );
    sk_pathbuilder_t* sk_pathbuilder_new();
    void sk_pathbuilder_delete(sk_pathbuilder_t* );
    void sk_pathbuilder_move_to(sk_pathbuilder_t* , float x, float y);
    void sk_pathbuilder_line_to(sk_pathbuilder_t* , float x, float y);
    void sk_pathbuilder_quad_to(sk_pathbuilder_t* , float x0, float y0, float x1, float y1);
    void sk_pathbuilder_conic_to(sk_pathbuilder_t* , float x0, float y0, float x1, float y1, float w);
    void sk_pathbuilder_cubic_to(sk_pathbuilder_t* , float x0, float y0, float x1, float y1, float x2, float y2);
    void sk_pathbuilder_close(sk_pathbuilder_t* );
    void sk_pathbuilder_add_rect(sk_pathbuilder_t* , const(sk_rect_t)* , sk_path_direction_t );
    void sk_pathbuilder_add_oval(sk_pathbuilder_t* , const(sk_rect_t)* , sk_path_direction_t );
    sk_path_t* sk_pathbuilder_detach_path(sk_pathbuilder_t* );
    sk_path_t* sk_pathbuilder_snapshot_path(sk_pathbuilder_t* );
    void sk_path_delete(sk_path_t* );
    bool sk_path_get_bounds(const(sk_path_t)* , sk_rect_t* );
    sk_picture_recorder_t* sk_picture_recorder_new();
    void sk_picture_recorder_delete(sk_picture_recorder_t* );
    sk_canvas_t* sk_picture_recorder_begin_recording(sk_picture_recorder_t* , const(sk_rect_t)* );
    sk_picture_t* sk_picture_recorder_end_recording(sk_picture_recorder_t* );
    void sk_picture_ref(sk_picture_t* );
    void sk_picture_unref(sk_picture_t* );
    uint32_t sk_picture_get_unique_id(sk_picture_t* );
    sk_rect_t sk_picture_get_bounds(sk_picture_t* );
    void sk_shader_ref(sk_shader_t* );
    void sk_shader_unref(sk_shader_t* );
    sk_shader_t* sk_shader_new_linear_gradient(const(sk_point_t)* points, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    sk_shader_t* sk_shader_new_radial_gradient(const(sk_point_t)* center, float radius, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    sk_shader_t* sk_shader_new_sweep_gradient(const(sk_point_t)* center, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, const(sk_matrix_t)* localMatrix);
    sk_shader_t* sk_shader_new_two_point_conical_gradient(const(sk_point_t)* start, float startRadius, const(sk_point_t)* end, float endRadius, const(sk_color_t)* colors, const(float)* colorPos, int colorCount, sk_shader_tilemode_t tileMode, const(sk_matrix_t)* localMatrix);
    sk_surface_t* sk_surface_new_raster(const(sk_imageinfo_t)* , const(sk_surfaceprops_t)* );
    sk_surface_t* sk_surface_new_raster_direct(const(sk_imageinfo_t)* , void* pixels, size_t rowBytes, const(sk_surfaceprops_t)* props);
    void sk_surface_unref(sk_surface_t* );
    sk_canvas_t* sk_surface_get_canvas(sk_surface_t* );
    sk_image_t* sk_surface_new_image_snapshot(sk_surface_t* );
}
