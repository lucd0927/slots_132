#ifndef SPINE_SPINE_TIMELINE_H
#define SPINE_SPINE_TIMELINE_H

#include "../base.h"
#include "types.h"
#include "arrays.h"

#ifdef __cplusplus
extern "C" {
#endif

SPINE_C_API void spine_timeline_dispose(spine_timeline self);

SPINE_C_API spine_rtti spine_timeline_get_rtti(spine_timeline self);
/**
 * Sets the value(s) for the specified time.
 *
 * @param skeleton The skeleton the timeline is being applied to. This provides access to the bones, slots, and other skeleton components the timeline may change.
 * @param lastTime lastTime The time this timeline was last applied. Timelines such as EventTimeline trigger only at specific times rather than every frame. In that case, the timeline triggers everything between lastTime (exclusive) and time (inclusive).
 * @param time The time within the animation. Most timelines find the key before and the key after this time so they can interpolate between the keys.
 * @param events If any events are fired, they are added to this array. Can be NULL to ignore firing events or if the timeline does not fire events. May be NULL.
 * @param alpha alpha 0 applies the current or setup pose value (depending on pose parameter). 1 applies the timeline value. Between 0 and 1 applies a value between the current or setup pose and the timeline value. By adjusting alpha over time, an animation can be mixed in or out. alpha can also be useful to apply animations on top of each other (layered).
 * @param blend Controls how mixing is applied when alpha is than 1.
 * @param direction Indicates whether the timeline is mixing in or out. Used by timelines which perform instant transitions such as DrawOrderTimeline and AttachmentTimeline.
 * @param appliedPose True to modify the applied pose.
 */
SPINE_C_API void spine_timeline_apply(spine_timeline self, spine_skeleton skeleton, float lastTime, float time, /*@null*/ spine_array_event events,
									  float alpha, spine_mix_blend blend, spine_mix_direction direction, bool appliedPose);
SPINE_C_API size_t spine_timeline_get_frame_entries(spine_timeline self);
SPINE_C_API size_t spine_timeline_get_frame_count(spine_timeline self);
SPINE_C_API spine_array_float spine_timeline_get_frames(spine_timeline self);
SPINE_C_API float spine_timeline_get_duration(spine_timeline self);
SPINE_C_API spine_array_property_id spine_timeline_get_property_ids(spine_timeline self);
SPINE_C_API spine_rtti spine_timeline_rtti(void);

#ifdef __cplusplus
}
#endif

#endif /* SPINE_SPINE_TIMELINE_H */
