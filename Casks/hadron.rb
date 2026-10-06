# The Homebrew cask for Hadron. It lives in the tap (github.com/Broyojo/homebrew-hadron, as
# Casks/hadron.rb); scripts/release.sh fills in the version and the checksum of each release.
#
#   brew install --cask broyojo/hadron/hadron
cask "hadron" do
  version "0.1.0"
  sha256 "e6f97d071a799fdb4ffaca3f8be8605d36bbdf83c802ac14288d942a11b13a5c"

  url "https://github.com/Broyojo/hadron/releases/download/v#{version}/Hadron-#{version}.dmg"
  name "Hadron"
  desc "Play Windows games from the Steam library on Apple Silicon"
  homepage "https://github.com/Broyojo/hadron"

  depends_on arch: :arm64
  depends_on macos: ">= :golden_gate"

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
