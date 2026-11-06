cask "sofadeck" do
  version "1.0.23"
  sha256 "0639f639e1282181deac1b212b78e08726af91941a457088fbebce64d3235c50"

  url "https://www.sofadeck.com/download/SofaDeck-#{version}-mac.dmg"
  name "SofaDeck"
  desc "Phone button deck and voice remote for your computer, over the home network"
  homepage "https://www.sofadeck.com/"

  livecheck do
    url "https://www.sofadeck.com/download/"
    regex(/SofaDeck[._-]v?(\d+(?:\.\d+)+)[._-]mac\.dmg/i)
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
