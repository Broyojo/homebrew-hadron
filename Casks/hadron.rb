# The Homebrew cask for Hadron. It lives in the tap (github.com/Broyojo/homebrew-hadron, as
# Casks/hadron.rb); scripts/release.sh fills in the version and the checksum of each release.
#
#   brew install --cask broyojo/hadron/hadron
cask "hadron" do
  version "0.1.0"
  sha256 "8be1e174304c681e57021c48428f4bc7ff6e3791bdf76d4d706876dd8b255d91"

  url "https://github.com/Broyojo/hadron/releases/download/v#{version}/Hadron-#{version}.dmg"
  name "Hadron"
  desc "Play Windows games from the Steam library on Apple Silicon"
  homepage "https://github.com/Broyojo/hadron"

  depends_on arch: :arm64

  app "Hadron.app"
  # The same program is the `hadron` command: setup, repair, uninstall, status, report, version.
  binary "#{appdir}/Hadron.app/Contents/MacOS/Hadron", target: "hadron"

  zap trash: [
    "~/Library/Application Support/Hadron",
    "~/Library/Caches/Hadron",
    "~/Library/Logs/Hadron",
  ]

  caveats <<~EOS
    Open Hadron once and choose "Set up Steam", or run:
      hadron setup
    macOS will ask you to allow Hadron under Privacy & Security, App Management the first time.

    Before uninstalling, take Hadron out of Steam:
      hadron uninstall
  EOS
end
