#ifndef SPINE_SPINE_ANIMATION_H
#define SPINE_SPINE_ANIMATION_H

#include "../base.h"
#include "types.h"
#include "arrays.h"

#ifdef __cplusplus
extern "C" {
#endif

SPINE_C_API spine_animation spine_animation_create(const char *name, spine_array_timeline timelines, float duration);

SPINE_C_API void spine_animation_dispose(spine_animation self);

/**
 * If the returned array or the timelines it contains are modified,
 * setTimelines() must be called.
 */
SPINE_C_API spine_array_timeline spine_animation_get_timelines(spine_animation self);
SPINE_C_API void spine_animation_set_timelines(spine_animation self, spine_array_timeline timelines);
/**
 * Returns true if this animation contains a timeline with any of the specified
 * property IDs.
 */
SPINE_C_API bool spine_animation_has_timeline(spine_animation self, spine_array_property_id ids);
/**
 * The duration of the animation in seconds, which is usually the highest time
 * of all frames in the timeline. The duration is used to know when it has
 * completed and when it should loop back to the start.
 */
SPINE_C_API float spine_animation_get_duration(spine_animation self);
SPINE_C_API void spine_animation_set_duration(spine_animation self, float inValue);
/**
 * Applies the animation's timelines to the specified skeleton.
 *
 * See Timeline::apply().
 *
 * @param skeleton The skeleton the animation is being applied to. This provides access to the bones, slots, and other skeleton components the timelines may change.
 * @param lastTime The last time in seconds this animation was applied. Some timelines trigger only at specific times rather than every frame. Pass -1 the first time an animation is applied to ensure frame 0 is triggered.
 * @param time The time in seconds the skeleton is being posed for. Most timelines find the frame before and the frame after this time and interpolate between the frame values. If beyond the getDuration() and loop is true then the animation will repeat, else the last frame will be applied.
 * @param loop If true, the animation repeats after the getDuration().
 * @param events If any events are fired, they are added to this list. Can be null to ignore fired events or if no timelines fire events.
 * @param alpha 0 applies the current or setup values (depending on blend). 1 applies the timeline values. Between 0 and 1 applies values between the current or setup values and the timeline values. By adjusting alpha over time, an animation can be mixed in or out. alpha can also be useful to apply animations on top of each other (layering).
 * @param blend Controls how mixing is applied when alpha < 1.
 * @param direction Indicates whether the timelines are mixing in or out. Used by timelines which perform instant transitions, such as DrawOrderTimeline or AttachmentTimeline.
 */
SPINE_C_API void spine_animation_apply(spine_animation self, spine_skeleton skeleton, float lastTime, float time, bool loop,
									   /*@null*/ spine_array_event events, float alpha, spine_mix_blend blend, spine_mix_direction direction,
									   bool appliedPose);
/**
 * The animation's name, which is unique across all animations in the skeleton.
 */
SPINE_C_API const char *spine_animation_get_name(spine_animation self);
/**
 * The bone indices affected by this animation.
 */
SPINE_C_API spine_array_int spine_animation_get_bones(spine_animation self);
/**
 *
 * @param target After the first and before the last entry.
 */
SPINE_C_API int spine_animation_search_1(spine_array_float values, float target);
SPINE_C_API int spine_animation_search_2(spine_array_float values, float target, int step);

#ifdef __cplusplus
}
#endif

#endif /* SPINE_SPINE_ANIMATION_H */
