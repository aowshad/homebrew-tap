cask "focus" do
  version "1.2.0"
  sha256 "07274989e92acd8b9855f24dfaa945740e12ff0e2b2369c562cc24ad761bda67"

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
