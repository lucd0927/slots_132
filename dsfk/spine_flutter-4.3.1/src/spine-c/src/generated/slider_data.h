#ifndef SPINE_SPINE_SLIDER_DATA_H
#define SPINE_SPINE_SLIDER_DATA_H

#include "../base.h"
#include "types.h"
#include "arrays.h"

#ifdef __cplusplus
extern "C" {
#endif

SPINE_C_API spine_slider_data spine_slider_data_create(const char *name);

SPINE_C_API void spine_slider_data_dispose(spine_slider_data self);

SPINE_C_API spine_rtti spine_slider_data_get_rtti(spine_slider_data self);
/**
 * Creates a slider instance.
 */
SPINE_C_API spine_constraint spine_slider_data_create_method(spine_slider_data self, spine_skeleton skeleton);
SPINE_C_API spine_animation spine_slider_data_get_animation(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_animation(spine_slider_data self, spine_animation animation);
SPINE_C_API bool spine_slider_data_get_additive(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_additive(spine_slider_data self, bool additive);
SPINE_C_API bool spine_slider_data_get_loop(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_loop(spine_slider_data self, bool loop);
SPINE_C_API /*@null*/ spine_bone_data spine_slider_data_get_bone(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_bone(spine_slider_data self, /*@null*/ spine_bone_data bone);
SPINE_C_API /*@null*/ spine_from_property spine_slider_data_get_property(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_property(spine_slider_data self, /*@null*/ spine_from_property property);
SPINE_C_API float spine_slider_data_get_scale(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_scale(spine_slider_data self, float scale);
SPINE_C_API float spine_slider_data_get_offset(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_offset(spine_slider_data self, float offset);
SPINE_C_API bool spine_slider_data_get_local(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_local(spine_slider_data self, bool local);
/**
 * Resolve ambiguity by forwarding to PosedData's implementation
 */
SPINE_C_API const char *spine_slider_data_get_name(spine_slider_data self);
SPINE_C_API bool spine_slider_data_get_skin_required(spine_slider_data self);
SPINE_C_API spine_slider_pose spine_slider_data_get_setup_pose(spine_slider_data self);
SPINE_C_API void spine_slider_data_set_skin_required(spine_slider_data self, bool skinRequired);
SPINE_C_API spine_rtti spine_slider_data_rtti(void);

#ifdef __cplusplus
}
#endif

#endif /* SPINE_SPINE_SLIDER_DATA_H */
