#include "linked_mesh.h"
#include <spine/spine.h>

using namespace spine;

spine_linked_mesh spine_linked_mesh_create(spine_mesh_attachment mesh, const int skinIndex, size_t slotIndex, const char *parent,
										   bool inheritTimelines) {
	return (spine_linked_mesh) new (__FILE__, __LINE__)
		LinkedMesh(*((MeshAttachment *) mesh), skinIndex, slotIndex, String(parent), inheritTimelines);
}

spine_linked_mesh spine_linked_mesh_create2(spine_mesh_attachment mesh, const char *skin, size_t slotIndex, const char *parent,
											bool inheritTimelines) {
	return (spine_linked_mesh) new (__FILE__, __LINE__)
		LinkedMesh(*((MeshAttachment *) mesh), String(skin), slotIndex, String(parent), inheritTimelines);
}

void spine_linked_mesh_dispose(spine_linked_mesh self) {
	delete (LinkedMesh *) self;
}
