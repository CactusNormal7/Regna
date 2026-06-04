import { MOTION } from "../visual/constants";

export function easeOutCubic(t: number): number {
  return 1 - (1 - t) ** 3;
}

export type ActiveTween = {
  elapsed: number;
  duration: number;
  from: number;
  to: number;
  onUpdate: (value: number) => void;
  onComplete?: () => void;
  done: boolean;
};

export function createTween(
  from: number,
  to: number,
  durationMs: number,
  onUpdate: (value: number) => void,
  onComplete?: () => void,
): ActiveTween {
  return {
    elapsed: 0,
    duration: durationMs,
    from,
    to,
    onUpdate,
    onComplete,
    done: false,
  };
}

/** Advance tweens by delta ms; mutates and returns still-active tweens. */
export function tickTweens(tweens: ActiveTween[], deltaMs: number): ActiveTween[] {
  const active: ActiveTween[] = [];
  for (const tween of tweens) {
    if (tween.done) continue;
    tween.elapsed += deltaMs;
    const t = Math.min(1, tween.elapsed / tween.duration);
    const v = tween.from + (tween.to - tween.from) * easeOutCubic(t);
    tween.onUpdate(v);
    if (t >= 1) {
      tween.done = true;
      tween.onComplete?.();
    } else {
      active.push(tween);
    }
  }
  return active;
}

export const defaultPieceMoveMs = MOTION.pieceMoveMs;
