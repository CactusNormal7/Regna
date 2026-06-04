import type { Container } from "pixi.js";
import { MOTION } from "../visual/constants";

export type CameraShake = {
  elapsed: number;
  duration: number;
  amplitude: number;
  target: Container;
  baseX: number;
  baseY: number;
  done: boolean;
};

export function startCameraShake(
  target: Container,
  amplitudePx = 6,
  durationMs = MOTION.cameraShakeMs,
): CameraShake {
  return {
    elapsed: 0,
    duration: durationMs,
    amplitude: amplitudePx,
    target,
    baseX: target.x,
    baseY: target.y,
    done: false,
  };
}

export function tickCameraShake(shake: CameraShake, deltaMs: number): boolean {
  if (shake.done) return true;
  shake.elapsed += deltaMs;
  const t = Math.min(1, shake.elapsed / shake.duration);
  const decay = 1 - t;
  shake.target.x = shake.baseX + (Math.random() * 2 - 1) * shake.amplitude * decay;
  shake.target.y = shake.baseY + (Math.random() * 2 - 1) * shake.amplitude * decay;
  if (t >= 1) {
    shake.target.x = shake.baseX;
    shake.target.y = shake.baseY;
    shake.done = true;
  }
  return shake.done;
}
