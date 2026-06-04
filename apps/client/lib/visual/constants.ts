/** Shared visual constants (Vue + Pixi). See docs/visual-charter.md */

export const PIXEL_SCALE = 4 as const;

export const TILE_SRC_PX = 16;
export const PIECE_SRC_H_PX = 32;

export const CELL_PX = TILE_SRC_PX * PIXEL_SCALE;
export const PIECE_DISPLAY_H_PX = PIECE_SRC_H_PX * PIXEL_SCALE;

/** m6x11 — use 16 / 32 / 48 px only (font author). */
export const FONT_SIZES = {
  sm: 16,
  md: 32,
  lg: 48,
} as const;

export const MOTION = {
  pieceMoveMs: 200,
  cardFxMs: 280,
  cameraShakeMs: 180,
  maxBlockingMs: 400,
} as const;

export const REGNA_COLORS = {
  bg: 0x1a1a2e,
  surface: 0x16213e,
  accent: 0x3d5afe,
  danger: 0xe94560,
  text: 0xeaeaea,
  textMuted: 0xa0a0b0,
} as const;
