import {
  mountBoardPreview,
  type BoardPreviewVariant,
  type MountBoardPreviewOptions,
} from "~/lib/pixi/mount-board-preview";
import { PLAIN_BOARD_DISPLAY_PX } from "~/lib/pixi/plain-board";

export type UsePixiBoardOptions = {
  variant?: MaybeRef<BoardPreviewVariant>;
  boardIndex?: MaybeRef<number | undefined>;
  testFile?: number;
  testRank?: number;
  pieceUrl?: string;
  showGrid?: MaybeRef<boolean | undefined>;
  width?: number;
  height?: number;
};

/**
 * Step C — Board preview: plain/persp board + test piece on a Pixi canvas (uses usePixiApp).
 */
export function usePixiBoard(
  hostRef: Ref<HTMLElement | null>,
  options: UsePixiBoardOptions = {},
) {
  const boardReady = ref(false);
  const boardError = ref<string | null>(null);

  const displayWidth = options.width ?? PLAIN_BOARD_DISPLAY_PX;
  const displayHeight = options.height ?? PLAIN_BOARD_DISPLAY_PX;

  const pixi = usePixiApp(hostRef, {
    width: displayWidth,
    height: displayHeight,
    resizeTo: hostRef,
  });

  async function loadBoard() {
    if (!pixi.layers.value) return;
    boardReady.value = false;
    boardError.value = null;
    try {
      const mountOpts: MountBoardPreviewOptions = {
        variant: toValue(options.variant) ?? "plain",
        boardIndex: toValue(options.boardIndex) ?? 1,
        testFile: options.testFile,
        testRank: options.testRank,
        pieceUrl: options.pieceUrl,
        showGrid: toValue(options.showGrid),
      };
      await mountBoardPreview(pixi.layers.value, mountOpts);
      boardReady.value = true;
    } catch (e) {
      boardError.value = e instanceof Error ? e.message : String(e);
    }
  }

  watch(
    () =>
      [
        pixi.ready.value,
        toValue(options.variant),
        toValue(options.boardIndex),
        toValue(options.showGrid),
      ] as const,
    ([isReady]) => {
      if (isReady) void loadBoard();
    },
    { immediate: true },
  );

  return {
    ...pixi,
    boardReady,
    boardError,
    reloadBoard: loadBoard,
  };
}
