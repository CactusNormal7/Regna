import { defineConfig } from "prisma/config";
import { loadServerEnv } from "./src/load-env.js";

const PLACEHOLDER_DATABASE_URL =
  "postgresql://placeholder:placeholder@127.0.0.1:5432/placeholder?schema=public";

loadServerEnv();

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: { path: "prisma/migrations" },
  datasource: {
    url: process.env.DATABASE_URL ?? PLACEHOLDER_DATABASE_URL,
  },
});
