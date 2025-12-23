//
// Spine Runtimes License Agreement
// Last updated April 5, 2025. Replaces all prior versions.
//
// Copyright (c) 2013-2025, Esoteric Software LLC
//
// Integration of the Spine Runtimes into software or otherwise creating
// derivative works of the Spine Runtimes is permitted under the terms and
// conditions of Section 2 of the Spine Editor License Agreement:
// http://esotericsoftware.com/spine-editor-license
//
// Otherwise, it is permitted to integrate the Spine Runtimes into software
// or otherwise create derivative works of the Spine Runtimes (collectively,
// "Products"), provided that each user of the Products must obtain their own
// Spine Editor license and redistribution of the Products in any form must
// include this license and copyright notice.
//
// THE SPINE RUNTIMES ARE PROVIDED BY ESOTERIC SOFTWARE LLC "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL ESOTERIC SOFTWARE LLC BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES,
// BUSINESS INTERRUPTION, OR LOSS OF USE, DATA, OR PROFITS) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THE SPINE RUNTIMES, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

// AUTO GENERATED FILE, DO NOT EDIT.

import 'package:universal_ffi/ffi.dart';
import 'spine_dart_bindings_generated.dart';
import '../spine_bindings.dart';
import 'rtti.dart';
import 'arrays.dart';
import 'mix_blend.dart';
import 'mix_direction.dart';
import 'skeleton.dart';

/// Timeline wrapper
abstract class Timeline {
  final Pointer<spine_timeline_wrapper> _ptr;

  Timeline.fromPointer(this._ptr);

  /// Get the native pointer for FFI calls
  Pointer get nativePtr => _ptr;

  Rtti get rtti {
    final result = SpineBindings.bindings.spine_timeline_get_rtti(_ptr);
    return Rtti.fromPointer(result);
  }

  /// Sets the value(s) for the specified time.
  ///
  /// [skeleton] The skeleton the timeline is being applied to. This provides access to the bones, slots, and other skeleton components the timeline may change.
  /// [lastTime] lastTime The time this timeline was last applied. Timelines such as EventTimeline trigger only at specific times rather than every frame. In that case, the timeline triggers everything between lastTime (exclusive) and time (inclusive).
  /// [time] The time within the animation. Most timelines find the key before and the key after this time so they can interpolate between the keys.
  /// [events] If any events are fired, they are added to this array. Can be NULL to ignore firing events or if the timeline does not fire events. May be NULL.
  /// [alpha] alpha 0 applies the current or setup pose value (depending on pose parameter). 1 applies the timeline value. Between 0 and 1 applies a value between the current or setup pose and the timeline value. By adjusting alpha over time, an animation can be mixed in or out. alpha can also be useful to apply animations on top of each other (layered).
  /// [blend] Controls how mixing is applied when alpha is than 1.
  /// [direction] Indicates whether the timeline is mixing in or out. Used by timelines which perform instant transitions such as DrawOrderTimeline and AttachmentTimeline.
  /// [appliedPose] True to modify the applied pose.
  void apply(Skeleton skeleton, double lastTime, double time, ArrayEvent? events, double alpha, MixBlend blend,
      MixDirection direction, bool appliedPose) {
    SpineBindings.bindings.spine_timeline_apply(_ptr, skeleton.nativePtr.cast(), lastTime, time,
        events?.nativePtr.cast() ?? Pointer.fromAddress(0), alpha, blend.value, direction.value, appliedPose);
  }

  int get frameEntries {
    final result = SpineBindings.bindings.spine_timeline_get_frame_entries(_ptr);
    return result;
  }

  int get frameCount {
    final result = SpineBindings.bindings.spine_timeline_get_frame_count(_ptr);
    return result;
  }

  ArrayFloat get frames {
    final result = SpineBindings.bindings.spine_timeline_get_frames(_ptr);
    return ArrayFloat.fromPointer(result);
  }

  double get duration {
    final result = SpineBindings.bindings.spine_timeline_get_duration(_ptr);
    return result;
  }

  ArrayPropertyId get propertyIds {
    final result = SpineBindings.bindings.spine_timeline_get_property_ids(_ptr);
    return ArrayPropertyId.fromPointer(result);
  }

  static Rtti rttiStatic() {
    final result = SpineBindings.bindings.spine_timeline_rtti();
    return Rtti.fromPointer(result);
  }
}
