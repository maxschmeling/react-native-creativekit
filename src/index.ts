import { NativeModules } from "react-native";

const { SnapchatCreativeManager } = NativeModules;

export async function share(
  path: string | null | undefined,
  url: string,
  videoPath: string | null | undefined,
  caption: string | null | undefined
): Promise<void> {
  await SnapchatCreativeManager.share(path, url, videoPath, caption);
}
