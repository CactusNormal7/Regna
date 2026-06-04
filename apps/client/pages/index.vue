<template>
  <main class="home">
    <header class="pixel-panel intro">
      <h1 class="pixel-ui pixel-ui--lg">Regna</h1>
      <p class="pixel-ui">Chess evolved — 8-bit / fluid</p>
      <p v-if="fontMissing" class="pixel-ui hint">
        Step A: add <code>m6x11.ttf</code> → <code>public/fonts/</code> then
        <code>pnpm font:check</code>
      </p>
      <p v-else class="pixel-ui hint ok">Step A: m6x11 OK</p>
    </header>

    <ClientOnly>
      <PixiBoardPreview />
    </ClientOnly>
  </main>
</template>

<script setup lang="ts">
const fontMissing = ref(false);

onMounted(async () => {
  try {
    await document.fonts.load('16px "m6x11"');
    fontMissing.value = !document.fonts.check('16px "m6x11"');
  } catch {
    fontMissing.value = true;
  }
});
</script>

<style scoped>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 32px;
  padding: 32px 16px 48px;
}

.intro {
  width: 100%;
  max-width: 568px;
}

h1 {
  margin: 0 0 16px;
  color: var(--regna-accent);
}

.hint {
  margin-top: 16px;
  color: var(--regna-text-muted);
}

.hint.ok {
  color: var(--regna-accent);
}

code {
  color: var(--regna-danger);
}
</style>
