import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const clientRoot = dirname(fileURLToPath(import.meta.url));
const repoSprites = resolve(clientRoot, "../../src/sprites");

export default defineNuxtConfig({
  modules: ["@vite-pwa/nuxt"],
  css: ["~/assets/css/pixel-theme.css"],
  alias: {
    "@regna/sprites": repoSprites,
  },
  vite: {
    server: {
      fs: { allow: [repoSprites] },
    },
  },
  nitro: {
    publicAssets: [{ baseURL: "/sprites", dir: repoSprites, maxAge: 60 }],
  },
  pwa: {
    manifest: {
      name: "Regna",
      short_name: "Regna",
      theme_color: "#3D5AFE",
    },
  },
});
