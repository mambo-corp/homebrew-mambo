cask "mambo" do
  version "1.0.8"

  on_arm do
    sha256 "df83ac12ade384c2a849c3ff9f898a40a2714463a7c718a0d4edc9b6b3c8b12d"

    url "https://downloads.trymambo.app/v#{version}/Mambo-macos-arm64.dmg"
  end
  on_intel do
    sha256 "4900ce017f72dd06e9418ad72060c3cf98fae1ca86bc850a470918e4b2e10978"

    url "https://downloads.trymambo.app/v#{version}/Mambo-macos-x86_64.dmg"
  end

  name "Mambo"
  desc "Keyboard-driven, multi-engine, zero-telemetry desktop database client"
  homepage "https://trymambo.app/"

  livecheck do
    url "https://downloads.trymambo.app/latest/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Mambo.app"

  zap trash: [
    "~/Library/Application Support/io.mambo.app",
    "~/Library/Caches/io.mambo.app",
    "~/Library/HTTPStorages/io.mambo.app",
    "~/Library/HTTPStorages/io.mambo.app.binarycookies",
    "~/Library/Preferences/io.mambo.app.plist",
    "~/Library/Saved Application State/io.mambo.app.savedState",
    "~/Library/WebKit/io.mambo.app",
  ]
end
