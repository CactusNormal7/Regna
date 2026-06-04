import { PIXEL_SCALE } from "../visual/constants";

/** Pixel Chess plain board asset (`board_plain_*.png`). */
export const PLAIN_BOARD_SRC_PX = 142;

export const PLAIN_BOARD_DISPLAY_PX = PLAIN_BOARD_SRC_PX * PIXEL_SCALE;

/** Cell size on the scaled plain board (142÷8 ≠ 16 — pack-specific). */
export const PLAIN_BOARD_CELL_PX = PLAIN_BOARD_DISPLAY_PX / 8;

export function plainBoardCellCenter(file: number, rank: number) {
  const visualRow = 7 - rank;
  return {
    x: file * PLAIN_BOARD_CELL_PX + PLAIN_BOARD_CELL_PX / 2,
    y: visualRow * PLAIN_BOARD_CELL_PX + PLAIN_BOARD_CELL_PX / 2,
  };
}

export function plainBoardUrl(index = 1): string {
  const id = String(index).padStart(2, "0");
  return `/sprites/chess pieces/boards/board_plain_${id}.png`;
}

export function perspBoardUrl(index = 1): string {
  const id = String(index).padStart(2, "0");
  return `/sprites/chess pieces/boards/board_persp_${id}.png`;
}
