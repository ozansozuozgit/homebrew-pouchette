cask "pouchette" do
  version "0.1.7"
  sha256 "e4969e048681a723a021a361f10847c800167c5d5ee7195d7fa92d0724295175"

  url "https://github.com/ozansozuozgit/pouchette-releases/releases/download/v#{version}/Pouchette-#{version}.dmg"
  name "Pouchette"
  desc "On-device meeting and lecture memory — no bot, no account, every answer cited"
  homepage "https://pouchette.com"

  livecheck do
    url "https://github.com/ozansozuozgit/pouchette-releases"
    strategy :github_latest
  end

  auto_updates true # Sparkle
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Pouchette.app"

  # Deliberately NOT zapping ~/Library/Application Support/Pouchette: it holds the
  # user's meeting library (recordings, transcripts, notes). Deleting memories on
  # uninstall would betray the product; users can remove that folder themselves.
  zap trash: [
    "~/Library/Caches/com.pouchette.app",
    "~/Library/Preferences/com.pouchette.app.plist",
    "~/Library/HTTPStorages/com.pouchette.app",
  ]
end
