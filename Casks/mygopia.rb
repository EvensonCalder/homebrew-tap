cask "mygopia" do
  version "0.3.1"
  sha256 "d452e93bf7930835ea0f13eeb9bbe65df9adae5d6393123b2b29ef856f5592f0"

  url "https://github.com/EvensonCalder/mygopia/releases/download/v#{version}/mygopia-#{version}.dmg"
  name "Mygopia"
  desc "Native desktop GUI client for Kopia backup and cross-snapshot search"
  homepage "https://github.com/EvensonCalder/mygopia"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "kopia"
  depends_on macos: :monterey

  app "Mygopia.app"

  zap trash: [
    "~/Library/Application Support/io.github.evensoncalder.mygopia",
    "~/Library/Caches/io.github.evensoncalder.mygopia",
    "~/Library/Logs/io.github.evensoncalder.mygopia",
    "~/Library/Preferences/io.github.evensoncalder.mygopia.plist",
  ]

  caveats <<~EOS
    Mygopia is not notarized with an Apple Developer ID.
    If macOS Gatekeeper blocks first launch, allow it in:
      System Settings -> Privacy & Security -> Open Anyway
    or remove the quarantine attribute manually:
      sudo xattr -dr com.apple.quarantine "#{appdir}/Mygopia.app"
  EOS
end
