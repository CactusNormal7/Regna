import { Container } from "pixi.js";

export type PixiLayers = {
  root: Container;
  board: Container;
  pieces: Container;
  fx: Container;
  ui: Container;
};

/** Standard draw order: board → pieces → FX → UI overlay. */
export function createPixiLayers(): PixiLayers {
  const root = new Container();
  const board = new Container();
  const pieces = new Container();
  const fx = new Container();
  const ui = new Container();

  board.label = "board";
  pieces.label = "pieces";
  fx.label = "fx";
  ui.label = "ui";

  root.addChild(board, pieces, fx, ui);
  return { root, board, pieces, fx, ui };
}
