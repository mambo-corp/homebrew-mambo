cask "mambo" do
  version "1.1.0"

  on_arm do
    sha256 "9010721f6032d15f0b755d20158aa3ce77245ff4a2d8c852d5ba23012a1944d6"

    url "https://downloads.trymambo.app/v#{version}/Mambo-macos-arm64.dmg"
  end
  on_intel do
    sha256 "bd026825194e63b73daa2f0be67583ca0afce85814f961e0cebb9270b7121ef5"

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
