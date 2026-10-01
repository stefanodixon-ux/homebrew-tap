cask "sofadeck" do
  version "1.0.2"
  sha256 "38fabcfefd32b84e0af3267279d109c2ddb3a94c412c5e077222a2700c6e8945"

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
