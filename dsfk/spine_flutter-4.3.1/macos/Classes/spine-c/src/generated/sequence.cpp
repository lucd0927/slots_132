#include "sequence.h"
#include <spine/spine.h>

using namespace spine;

spine_sequence spine_sequence_create(int count) {
	return (spine_sequence) new (__FILE__, __LINE__) Sequence(count);
}

void spine_sequence_dispose(spine_sequence self) {
	delete (Sequence *) self;
}

spine_sequence spine_sequence_copy(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return (spine_sequence) &_self->copy();
}

void spine_sequence_apply(spine_sequence self, /*@null*/ spine_slot_pose slot, /*@null*/ spine_attachment attachment) {
	Sequence *_self = (Sequence *) self;
	_self->apply((SlotPose *) slot, (Attachment *) attachment);
}

const char *spine_sequence_get_path(spine_sequence self, const char *basePath, int index) {
	Sequence *_self = (Sequence *) self;
	return (const char *) &_self->getPath(String(basePath), index);
}

int spine_sequence_get_id(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return _self->getId();
}

void spine_sequence_set_id(spine_sequence self, int id) {
	Sequence *_self = (Sequence *) self;
	_self->setId(id);
}

int spine_sequence_get_start(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return _self->getStart();
}

void spine_sequence_set_start(spine_sequence self, int start) {
	Sequence *_self = (Sequence *) self;
	_self->setStart(start);
}

int spine_sequence_get_digits(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return _self->getDigits();
}

void spine_sequence_set_digits(spine_sequence self, int digits) {
	Sequence *_self = (Sequence *) self;
	_self->setDigits(digits);
}

int spine_sequence_get_setup_index(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return _self->getSetupIndex();
}

void spine_sequence_set_setup_index(spine_sequence self, int setupIndex) {
	Sequence *_self = (Sequence *) self;
	_self->setSetupIndex(setupIndex);
}

spine_array_texture_region spine_sequence_get_regions(spine_sequence self) {
	Sequence *_self = (Sequence *) self;
	return (spine_array_texture_region) &_self->getRegions();
}
