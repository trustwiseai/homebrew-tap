cask "trustwise-cli@4.9" do
  version "4.9.0"

  on_arm do
    sha256 "1a11b693cf8cc0f226744b2324501dfb8d7783eb8787454858fccef1d0c280fe"
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
