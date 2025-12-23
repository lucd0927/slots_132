#ifndef SPINE_SPINE_POSED_ACTIVE_H
#define SPINE_SPINE_POSED_ACTIVE_H

#include "../base.h"
#include "types.h"
#include "arrays.h"

#ifdef __cplusplus
extern "C" {
#endif

SPINE_C_API void spine_posed_active_dispose(spine_posed_active self);

SPINE_C_API bool spine_posed_active_is_active(spine_posed_active self);
SPINE_C_API void spine_posed_active_set_active(spine_posed_active self, bool active);

#ifdef __cplusplus
}
#endif

#endif /* SPINE_SPINE_POSED_ACTIVE_H */
