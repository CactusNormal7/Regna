import { CELL_PX, PIXEL_SCALE } from "../visual/constants";

/** Logical square (0–7) → pixel position at current scale (top-left of cell). */
export function cellToPixel(file: number, rank: number, originX = 0, originY = 0) {
  return {
    x: originX + file * CELL_PX,
    y: originY + rank * CELL_PX,
  };
}

/** Snap display sprite to pixel grid after a tween ends. */
export function snapToGrid(value: number): number {
  return Math.round(value / PIXEL_SCALE) * PIXEL_SCALE;
}
