import { access } from "node:fs/promises";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const fontPath = resolve(dirname(fileURLToPath(import.meta.url)), "../public/fonts/m6x11.ttf");

try {
  await access(fontPath);
  console.log("OK: m6x11.ttf found at public/fonts/m6x11.ttf");
  process.exit(0);
} catch {
  console.error(
    "Missing m6x11.ttf\n" +
      "  1. Download from https://managore.itch.io/m6x11\n" +
      "  2. Save as apps/client/public/fonts/m6x11.ttf\n" +
      "  3. Re-run: pnpm font:check",
  );
  process.exit(1);
}
