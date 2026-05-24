import { spawnSync } from "node:child_process";
import { loadServerEnv, serverRoot } from "../src/load-env.js";

loadServerEnv({ override: true });

const directUrl = process.env.DIRECT_DATABASE_URL;
if (!directUrl) {
  console.error("DIRECT_DATABASE_URL is required for Prisma CLI.");
  process.exit(1);
}

process.env.DATABASE_URL = directUrl;

const args = process.argv.slice(2);
if (args.length === 0) {
  console.error("Usage: tsx scripts/prisma-direct.ts <prisma-args...>");
  process.exit(1);
}

const result = spawnSync("prisma", args, {
  stdio: "inherit",
  env: process.env,
  cwd: serverRoot,
});
process.exit(result.status ?? 1);
