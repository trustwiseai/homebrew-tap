cask "trustwise-cli@4.12" do
  version "4.12.0"

  on_arm do
    sha256 "2e98d660745e6799516d7ee2814f7bb488324facab63bf8dc6b9ed9c3f005796"
    url "https://github.com/trustwiseai/homebrew-tap/releases/download/v#{version}/trustwise-macos-arm64.tar.gz"
  end

  name "Trustwise CLI"
  desc "AI Red-teaming and risk classification CLI"
  homepage "https://trustwise.ai"

  conflicts_with cask: "trustwise-cli"

  postflight do
    system_command "/usr/bin/find",
                   args: ["#{staged_path}", "-exec", "/usr/bin/xattr", "-c", "{}", ";"]
  end

  binary "trustwise/trustwise"
end
