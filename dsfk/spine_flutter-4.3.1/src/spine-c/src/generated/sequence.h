#ifndef SPINE_SPINE_SEQUENCE_H
#define SPINE_SPINE_SEQUENCE_H

#include "../base.h"
#include "types.h"
#include "arrays.h"

#ifdef __cplusplus
extern "C" {
#endif

SPINE_C_API spine_sequence spine_sequence_create(int count);

SPINE_C_API void spine_sequence_dispose(spine_sequence self);

SPINE_C_API spine_sequence spine_sequence_copy(spine_sequence self);
SPINE_C_API void spine_sequence_apply(spine_sequence self, /*@null*/ spine_slot_pose slot, /*@null*/ spine_attachment attachment);
SPINE_C_API const char *spine_sequence_get_path(spine_sequence self, const char *basePath, int index);
/**
 * Returns a unique ID for this attachment.
 */
SPINE_C_API int spine_sequence_get_id(spine_sequence self);
SPINE_C_API void spine_sequence_set_id(spine_sequence self, int id);
SPINE_C_API int spine_sequence_get_start(spine_sequence self);
SPINE_C_API void spine_sequence_set_start(spine_sequence self, int start);
SPINE_C_API int spine_sequence_get_digits(spine_sequence self);
SPINE_C_API void spine_sequence_set_digits(spine_sequence self, int digits);
/**
 * The index of the region to show for the setup pose.
 */
SPINE_C_API int spine_sequence_get_setup_index(spine_sequence self);
SPINE_C_API void spine_sequence_set_setup_index(spine_sequence self, int setupIndex);
SPINE_C_API spine_array_texture_region spine_sequence_get_regions(spine_sequence self);

#ifdef __cplusplus
}
#endif

#endif /* SPINE_SPINE_SEQUENCE_H */
