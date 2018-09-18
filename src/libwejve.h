/* 
 * Gmu Music Player
 *
 * Copyright (c) 2006-2014 Johannes Heimansberg (wejp.k.vu)
 *
 * File: libwejve.h  Created: 141120
 *
 * Description: Simple WAVE decoder library
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 of
 * the License. See the file COPYING in the Gmu's main directory
 * for details.
 */

#ifndef WEJ_WAVE
#define WEJ_WAVE

typedef struct LibWejve {
	int x;
} LibWejve;

LibWejve *lw_init(void);
#endif
