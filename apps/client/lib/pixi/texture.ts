import { Assets, Texture } from "pixi.js";

/** Load a texture with nearest-neighbor scaling (pixel art). */
export async function loadPixelTexture(url: string): Promise<Texture> {
  const texture = await Assets.load<Texture>(url);
  texture.source.scaleMode = "nearest";
  return texture;
}

/** Apply nearest filtering to an already-loaded texture. */
export function setNearest(texture: Texture): Texture {
  texture.source.scaleMode = "nearest";
  return texture;
}
