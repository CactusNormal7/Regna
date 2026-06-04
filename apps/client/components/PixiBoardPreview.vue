<template>
  <section class="pixi-board-preview">
    <div class="toolbar pixel-ui">
      <button
        type="button"
        class="pixel-btn"
        :class="{ active: variant === 'plain' }"
        @click="variant = 'plain'"
      >
        Plain
      </button>
      <button
        type="button"
        class="pixel-btn"
        :class="{ active: variant === 'persp' }"
        @click="variant = 'persp'"
      >
        Persp
      </button>
    </div>
    <div
      ref="hostRef"
      class="board-host pixel-sprite"
      :style="{ width: `${size}px`, height: `${size}px` }"
    />
    <p v-if="error" class="pixel-ui status err">{{ error }}</p>
    <p v-else-if="!boardReady" class="pixel-ui status">Loading board…</p>
    <p v-else class="pixel-ui status">
      {{ variant === "plain" ? "Grid 8×8 · W king e1" : "Perspective preview · king centered" }}
    </p>
  </section>
</template>

<script setup lang="ts">
import { PLAIN_BOARD_DISPLAY_PX } from "~/lib/pixi/plain-board";
import type { BoardPreviewVariant } from "~/lib/pixi/mount-board-preview";

const size = PLAIN_BOARD_DISPLAY_PX;
const hostRef = ref<HTMLElement | null>(null);
const variant = ref<BoardPreviewVariant>("plain");

const { boardReady, boardError, error: pixiError } = usePixiBoard(hostRef, {
  variant,
  testFile: 4,
  testRank: 0,
  showGrid: computed(() => variant.value === "plain"),
});

const error = computed(() => boardError.value ?? pixiError.value);
</script>

<style scoped>
.pixi-board-preview {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
}

.toolbar {
  display: flex;
  gap: 8px;
}

.pixel-btn.active {
  background: var(--regna-accent);
  color: var(--regna-bg);
}

.board-host {
  border: 4px solid var(--regna-text-muted);
  overflow: hidden;
}

.board-host :deep(canvas) {
  display: block;
  image-rendering: pixelated;
  image-rendering: crisp-edges;
}

.status {
  color: var(--regna-text-muted);
  font-size: var(--regna-font-sm);
}

.status.err {
  color: var(--regna-danger);
}
</style>
