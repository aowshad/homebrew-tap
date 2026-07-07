cask "focus" do
  version "1.1.0"
  sha256 "47edb408f99b7743f5fb8adfbfa874b4ca6e0dfceb46ee5a6ece6393083b401b"

  url "https://github.com/aowshad/Focus/releases/download/v#{version}/Focus-#{version}-mac.zip"
  name "Focus"
  desc "Zero-dependency Pomodoro timer with tasks, streaks and analytics"
  homepage "https://github.com/aowshad/Focus"

  depends_on macos: ">= :monterey"

  app "Focus.app"

  # Removes the quarantine flag so the app opens without the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Focus.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/WebKit/com.aowshad.focus",
    "~/Library/Saved Application State/com.aowshad.focus.savedState",
  ]
end
