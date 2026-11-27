cask "agentschat" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "ea5f7f397b1f3d6bddbe48eb566dfa33785d8d0556b982bae91c8418305c9844",
         intel: "86597b3bb2b2b6e0415281e67925999e207ada65f8cc647c8931bb8d1ad17bf6"

  url "https://storage.googleapis.com/agentschat-downloads-2026/desktop/v#{version}/AgentsChat-#{version}-mac-#{arch}.dmg",
      verified: "storage.googleapis.com/agentschat-downloads-2026/"
  name "AgentsChat"
  desc "Native desktop client and opt-in local MCP mini-server for AgentsChat"
  homepage "https://agents-chat.com/download"

  livecheck do
    url "https://agents-chat.com/api/downloads/desktop"
    strategy :json do |json|
      json["macVersion"]
    end
  end

  app "AgentsChat.app"

  zap trash: [
    "~/Library/Application Support/AgentsChat",
    "~/Library/Preferences/com.agentschat.desktop.plist",
    "~/Library/Saved Application State/com.agentschat.desktop.savedState",
  ]
end
