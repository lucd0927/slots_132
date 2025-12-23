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
import 'package:universal_ffi/ffi_utils.dart';
import 'spine_dart_bindings_generated.dart';
import '../spine_bindings.dart';
import 'arrays.dart';
import 'attachment.dart';
import 'color.dart';
import 'sequence.dart';
import 'slot.dart';
import 'texture_region.dart';

/// Attachment that displays a texture region.
class RegionAttachment extends Attachment {
  final Pointer<spine_region_attachment_wrapper> _ptr;

  RegionAttachment.fromPointer(this._ptr)
      : super.fromPointer(SpineBindings.bindings.spine_region_attachment_cast_to_attachment(_ptr));

  /// Get the native pointer for FFI calls
  @override
  Pointer get nativePtr => _ptr;

  factory RegionAttachment(String name) {
    final ptr = SpineBindings.bindings.spine_region_attachment_create(name.toNativeUtf8().cast<Char>());
    return RegionAttachment.fromPointer(ptr);
  }

  void dispose() {
    SpineBindings.bindings.spine_region_attachment_dispose(_ptr);
  }

  void updateRegion() {
    SpineBindings.bindings.spine_region_attachment_update_region(_ptr);
  }

  double get x {
    final result = SpineBindings.bindings.spine_region_attachment_get_x(_ptr);
    return result;
  }

  set x(double value) {
    SpineBindings.bindings.spine_region_attachment_set_x(_ptr, value);
  }

  double get y {
    final result = SpineBindings.bindings.spine_region_attachment_get_y(_ptr);
    return result;
  }

  set y(double value) {
    SpineBindings.bindings.spine_region_attachment_set_y(_ptr, value);
  }

  double get rotation {
    final result = SpineBindings.bindings.spine_region_attachment_get_rotation(_ptr);
    return result;
  }

  set rotation(double value) {
    SpineBindings.bindings.spine_region_attachment_set_rotation(_ptr, value);
  }

  double get scaleX {
    final result = SpineBindings.bindings.spine_region_attachment_get_scale_x(_ptr);
    return result;
  }

  set scaleX(double value) {
    SpineBindings.bindings.spine_region_attachment_set_scale_x(_ptr, value);
  }

  double get scaleY {
    final result = SpineBindings.bindings.spine_region_attachment_get_scale_y(_ptr);
    return result;
  }

  set scaleY(double value) {
    SpineBindings.bindings.spine_region_attachment_set_scale_y(_ptr, value);
  }

  double get width {
    final result = SpineBindings.bindings.spine_region_attachment_get_width(_ptr);
    return result;
  }

  set width(double value) {
    SpineBindings.bindings.spine_region_attachment_set_width(_ptr, value);
  }

  double get height {
    final result = SpineBindings.bindings.spine_region_attachment_get_height(_ptr);
    return result;
  }

  set height(double value) {
    SpineBindings.bindings.spine_region_attachment_set_height(_ptr, value);
  }

  Color get color {
    final result = SpineBindings.bindings.spine_region_attachment_get_color(_ptr);
    return Color.fromPointer(result);
  }

  String get path {
    final result = SpineBindings.bindings.spine_region_attachment_get_path(_ptr);
    return result.cast<Utf8>().toDartString();
  }

  set path(String value) {
    SpineBindings.bindings.spine_region_attachment_set_path(_ptr, value.toNativeUtf8().cast<Char>());
  }

  TextureRegion? get region {
    final result = SpineBindings.bindings.spine_region_attachment_get_region(_ptr);
    return result.address == 0 ? null : TextureRegion.fromPointer(result);
  }

  set region(TextureRegion? value) {
    SpineBindings.bindings.spine_region_attachment_set_region(_ptr, value?.nativePtr.cast() ?? Pointer.fromAddress(0));
  }

  Sequence? get sequence {
    final result = SpineBindings.bindings.spine_region_attachment_get_sequence(_ptr);
    return result.address == 0 ? null : Sequence.fromPointer(result);
  }

  set sequence(Sequence? value) {
    SpineBindings.bindings
        .spine_region_attachment_set_sequence(_ptr, value?.nativePtr.cast() ?? Pointer.fromAddress(0));
  }

  ArrayFloat get offset {
    final result = SpineBindings.bindings.spine_region_attachment_get_offset(_ptr);
    return ArrayFloat.fromPointer(result);
  }

  ArrayFloat get uVs {
    final result = SpineBindings.bindings.spine_region_attachment_get_u_vs(_ptr);
    return ArrayFloat.fromPointer(result);
  }

  void computeWorldVertices(Slot slot, ArrayFloat worldVertices, int offset, int stride) {
    SpineBindings.bindings.spine_region_attachment_compute_world_vertices_2(
        _ptr, slot.nativePtr.cast(), worldVertices.nativePtr.cast(), offset, stride);
  }
}
