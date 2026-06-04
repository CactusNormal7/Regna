import { Graphics, Sprite } from "pixi.js";
import { PIXEL_SCALE, REGNA_COLORS } from "../visual/constants";
import type { PixiLayers } from "./layers";
import {
  PLAIN_BOARD_CELL_PX,
  PLAIN_BOARD_DISPLAY_PX,
  plainBoardCellCenter,
  plainBoardUrl,
  perspBoardUrl,
} from "./plain-board";
import { loadPixelTexture } from "./texture";

export type BoardPreviewVariant = "plain" | "persp";

export type MountBoardPreviewOptions = {
  variant?: BoardPreviewVariant;
  boardIndex?: number;
  /** Logical square for the test piece (default e1: file 4, rank 0). */
  testFile?: number;
  testRank?: number;
  pieceUrl?: string;
  showGrid?: boolean;
};

const DEFAULT_PIECE = "/sprites/chess pieces/16x32 pieces/W_King.png";

export async function mountBoardPreview(
  layers: PixiLayers,
  options: MountBoardPreviewOptions = {},
): Promise<void> {
  const {
    variant = "plain",
    boardIndex = 1,
    testFile = 4,
    testRank = 0,
    pieceUrl = DEFAULT_PIECE,
    showGrid = variant === "plain",
  } = options;

  layers.board.removeChildren();
  layers.pieces.removeChildren();
  layers.fx.removeChildren();

  const boardPath = variant === "plain" ? plainBoardUrl(boardIndex) : perspBoardUrl(boardIndex);
  const boardTexture = await loadPixelTexture(boardPath);
  const boardSprite = new Sprite(boardTexture);
  boardSprite.scale.set(PIXEL_SCALE);
  boardSprite.roundPixels = true;
  layers.board.addChild(boardSprite);

  if (showGrid) {
    const grid = new Graphics();
    for (let i = 0; i <= 8; i++) {
      const p = i * PLAIN_BOARD_CELL_PX;
      grid.moveTo(p, 0).lineTo(p, PLAIN_BOARD_DISPLAY_PX);
      grid.moveTo(0, p).lineTo(PLAIN_BOARD_DISPLAY_PX, p);
    }
    grid.stroke({ width: 1, color: REGNA_COLORS.accent, alpha: 0.35 });
    layers.board.addChild(grid);
  }

  const pieceTexture = await loadPixelTexture(pieceUrl);
  const piece = new Sprite(pieceTexture);
  piece.scale.set(PIXEL_SCALE);
  piece.anchor.set(0.5, 1);
  piece.roundPixels = true;

  if (variant === "plain") {
    const { x, y } = plainBoardCellCenter(testFile, testRank);
    piece.position.set(x, y);
  } else {
    // Persp: approximate center-bottom for preview until cell mapping exists.
    piece.position.set(PLAIN_BOARD_DISPLAY_PX * 0.5, PLAIN_BOARD_DISPLAY_PX * 0.72);
  }

  layers.pieces.addChild(piece);
}
