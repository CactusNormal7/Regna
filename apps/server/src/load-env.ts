import dotenv from "dotenv";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

export const serverRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");

/** Load `apps/server/.env`. Use `override: true` so stale shell exports do not win. */
export function loadServerEnv({ override = false } = {}) {
  return dotenv.config({ path: resolve(serverRoot, ".env"), override });
}
