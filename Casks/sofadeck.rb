cask "sofadeck" do
  version "1.0.1"
  sha256 "90df2e7728b6c14b2980035b54f6ff7fc113308c463cd2d9d1927d4f71fe0682"

  url "https://www.sofadeck.com/download/SofaDeck-#{version}-mac.dmg"
  name "SofaDeck"
  desc "Phone button deck and remote for your computer, over the home network"
  homepage "https://www.sofadeck.com/"

  livecheck do
    url "https://www.sofadeck.com/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :big_sur"

  app "SofaDeck.app"

  uninstall launchctl: "com.dixonappstudio.sofadeck",
            quit:      "com.dixonappstudio.sofadeck"

  zap trash: [
    "~/Library/Application Support/SofaDeck",
    "~/Library/LaunchAgents/com.dixonappstudio.sofadeck.plist",
    "~/Library/Logs/SofaDeck",
  ]
end
