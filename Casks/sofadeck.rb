cask "sofadeck" do
  version "1.0.8"
  sha256 "05d51cb772b96a2c6eef84be46b87742038259ec4198851275aadf73817b7f6b"

  url "https://www.sofadeck.com/download/SofaDeck-#{version}-mac.dmg"
  name "SofaDeck"
  desc "Phone button deck and voice remote for your computer, over the home network"
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
