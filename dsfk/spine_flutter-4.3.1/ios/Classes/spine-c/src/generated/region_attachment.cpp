#include "region_attachment.h"
#include <spine/spine.h>

using namespace spine;

spine_region_attachment spine_region_attachment_create(const char *name) {
	return (spine_region_attachment) new (__FILE__, __LINE__) RegionAttachment(String(name));
}

void spine_region_attachment_dispose(spine_region_attachment self) {
	delete (RegionAttachment *) self;
}

spine_rtti spine_region_attachment_get_rtti(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_rtti) &_self->getRTTI();
}

void spine_region_attachment_update_region(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->updateRegion();
}

void spine_region_attachment_compute_world_vertices_1(spine_region_attachment self, spine_slot slot, /*@null*/ float *worldVertices, size_t offset,
													  size_t stride) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->computeWorldVertices(*((Slot *) slot), worldVertices, offset, stride);
}

void spine_region_attachment_compute_world_vertices_2(spine_region_attachment self, spine_slot slot, spine_array_float worldVertices, size_t offset,
													  size_t stride) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->computeWorldVertices(*((Slot *) slot), *((Array<float> *) worldVertices), offset, stride);
}

float spine_region_attachment_get_x(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getX();
}

void spine_region_attachment_set_x(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setX(inValue);
}

float spine_region_attachment_get_y(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getY();
}

void spine_region_attachment_set_y(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setY(inValue);
}

float spine_region_attachment_get_rotation(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getRotation();
}

void spine_region_attachment_set_rotation(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setRotation(inValue);
}

float spine_region_attachment_get_scale_x(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getScaleX();
}

void spine_region_attachment_set_scale_x(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setScaleX(inValue);
}

float spine_region_attachment_get_scale_y(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getScaleY();
}

void spine_region_attachment_set_scale_y(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setScaleY(inValue);
}

float spine_region_attachment_get_width(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getWidth();
}

void spine_region_attachment_set_width(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setWidth(inValue);
}

float spine_region_attachment_get_height(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getHeight();
}

void spine_region_attachment_set_height(spine_region_attachment self, float inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setHeight(inValue);
}

spine_color spine_region_attachment_get_color(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_color) &_self->getColor();
}

const char *spine_region_attachment_get_path(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getPath().buffer();
}

void spine_region_attachment_set_path(spine_region_attachment self, const char *inValue) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setPath(String(inValue));
}

/*@null*/ spine_texture_region spine_region_attachment_get_region(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_texture_region) _self->getRegion();
}

void spine_region_attachment_set_region(spine_region_attachment self, /*@null*/ spine_texture_region region) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setRegion((TextureRegion *) region);
}

/*@null*/ spine_sequence spine_region_attachment_get_sequence(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_sequence) _self->getSequence();
}

void spine_region_attachment_set_sequence(spine_region_attachment self, /*@null*/ spine_sequence sequence) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->setSequence((Sequence *) sequence);
}

spine_array_float spine_region_attachment_get_offset(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_array_float) &_self->getOffset();
}

spine_array_float spine_region_attachment_get_u_vs(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_array_float) &_self->getUVs();
}

spine_attachment spine_region_attachment_copy(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return (spine_attachment) &_self->copy();
}

const char *spine_region_attachment_get_name(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getName().buffer();
}

int spine_region_attachment_get_ref_count(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	return _self->getRefCount();
}

void spine_region_attachment_reference(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->reference();
}

void spine_region_attachment_dereference(spine_region_attachment self) {
	RegionAttachment *_self = (RegionAttachment *) self;
	_self->dereference();
}

spine_rtti spine_region_attachment_rtti(void) {
	return (spine_rtti) &RegionAttachment::rtti;
}
