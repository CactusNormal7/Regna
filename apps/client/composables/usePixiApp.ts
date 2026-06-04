import { Application, type Ticker } from "pixi.js";
import { createPixiLayers, type PixiLayers } from "~/lib/pixi/layers";
import { REGNA_COLORS } from "~/lib/visual/constants";

export type PixiTickHandler = (deltaMs: number) => void;

export type UsePixiAppOptions = {
  width?: number;
  height?: number;
  backgroundColor?: number;
  /** Attach canvas to this element and match its size when it resizes. */
  resizeTo?: Ref<HTMLElement | null>;
};

/**
 * Step B — Pixi Application lifecycle: init, layers, ticker, destroy on unmount.
 */
export function usePixiApp(
  hostRef: Ref<HTMLElement | null>,
  options: UsePixiAppOptions = {},
) {
  const app = shallowRef<Application | null>(null);
  const layers = shallowRef<PixiLayers | null>(null);
  const ready = ref(false);
  const error = ref<string | null>(null);

  const tickHandlers: PixiTickHandler[] = [];

  function onTick(handler: PixiTickHandler) {
    tickHandlers.push(handler);
    return () => {
      const i = tickHandlers.indexOf(handler);
      if (i >= 0) tickHandlers.splice(i, 1);
    };
  }

  let resizeObserver: ResizeObserver | undefined;

  async function initPixi(host: HTMLElement) {
    const application = new Application();
    const width = options.width ?? host.clientWidth || 568;
    const height = options.height ?? host.clientHeight || 568;

    await application.init({
      width,
      height,
      backgroundColor: options.backgroundColor ?? REGNA_COLORS.bg,
      antialias: false,
      resolution: 1,
      autoDensity: false,
    });

    host.replaceChildren(application.canvas as unknown as Node);

    const layerStack = createPixiLayers();
    application.stage.addChild(layerStack.root);

    application.ticker.add((ticker: Ticker) => {
      const deltaMs = ticker.deltaMS;
      for (const fn of tickHandlers) fn(deltaMs);
    });

    if (options.resizeTo) {
      resizeObserver = new ResizeObserver(() => {
        const el = options.resizeTo?.value;
        if (!el || !application.renderer) return;
        const w = Math.max(1, Math.floor(el.clientWidth));
        const h = Math.max(1, Math.floor(el.clientHeight));
        application.renderer.resize(w, h);
      });
      resizeObserver.observe(host);
    }

    app.value = application;
    layers.value = layerStack;
    ready.value = true;
  }

  onMounted(async () => {
    const host = hostRef.value;
    if (!host) return;
    try {
      await initPixi(host);
    } catch (e) {
      error.value = e instanceof Error ? e.message : String(e);
    }
  });

  onUnmounted(() => {
    resizeObserver?.disconnect();
    tickHandlers.length = 0;
    app.value?.destroy(true, { children: true });
    app.value = null;
    layers.value = null;
    ready.value = false;
  });

  return { app, layers, ready, error, onTick };
}
