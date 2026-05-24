import "./env.js";
import Fastify from "fastify";
import cors from "@fastify/cors";
import { prisma } from "./db/prisma.js";

const port = Number(process.env.PORT ?? 3001);

const app = Fastify({ logger: true });

await app.register(cors, {
  origin: process.env.CORS_ORIGIN ?? "http://localhost:3000",
});

app.get("/health", async () => {
  await prisma.$queryRaw`SELECT 1`;
  return { ok: true };
});

try {
  await app.listen({ port, host: "0.0.0.0" });
} catch (err) {
  app.log.error(err);
  process.exit(1);
}
