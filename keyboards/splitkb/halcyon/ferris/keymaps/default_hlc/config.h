/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Copyright 2026 splitkb.com <support@splitkb.com> */

#pragma once

#define ENCODER_RESOLUTION 2

#ifdef HALCYON_ENABLE
#undef MATRIX_COLS
#define MATRIX_COLS 10 // 5 extra columns for buttons
#endif // HALCYON_ENABLE
