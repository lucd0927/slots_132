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

/// Property enum
enum Property {
  rotate(1),
  x(1),
  y(1),
  scaleX(1),
  scaleY(1),
  shearX(1),
  shearY(1),
  inherit(1),
  rgb(1),
  alpha(1),
  rgb2(1),
  attachment(1),
  deform(1),
  event(1),
  drawOrder(1),
  ikConstraint(1),
  transformConstraint(1),
  pathConstraintPosition(1),
  pathConstraintSpacing(1),
  pathConstraintMix(1),
  physicsConstraintInertia(1),
  physicsConstraintStrength(1),
  physicsConstraintDamping(1),
  physicsConstraintMass(1),
  physicsConstraintWind(1),
  physicsConstraintGravity(1),
  physicsConstraintMix(1),
  physicsConstraintReset(1),
  sequence(1),
  sliderTime(1),
  sliderMix(1);

  const Property(this.value);
  final int value;

  static Property fromValue(int value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid Property value: $value'),
    );
  }
}
