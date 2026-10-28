cask "sofadeck" do
  version "1.0.14"
  sha256 "b32578f1a53272e3a2ddd4c041ba33c268a65233e6cbe80c4aa0fba4e2c3ffe5"

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
