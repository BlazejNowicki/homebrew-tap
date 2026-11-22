cask "simpletile" do
  version "0.1.0"
  sha256 "b39947b8dff3f7613d570f7c2faec6b9352885503e1a8206bd04637d936a9647"

  url "https://github.com/BlazejNowicki/simpletile/releases/download/v#{version}/SimpleTile-#{version}.zip"
  name "SimpleTile"
  desc "Keyboard window tiling and a per-window switcher"
  homepage "https://github.com/BlazejNowicki/simpletile"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SimpleTile.app"

  # The app is self-signed, not notarized: without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/SimpleTile.app"], must_succeed: false
  end

  uninstall quit: "io.github.blazejnowicki.simpletile"
end
