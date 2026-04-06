cask "trustwise-cli" do
  version "4.4.0.dev12"

  on_arm do
    sha256 "e25a6cae8f5c3b11e4e6e0d51a7a02bf8363bc60b83fbf730d3d636f8a16147a"
    url "https://github.com/trustwiseai/homebrew-tap/releases/download/v#{version}/trustwise-macos-arm64.tar.gz"
  end

  name "Trustwise CLI"
  desc "AI Red-teaming and risk classification CLI"
  homepage "https://trustwise.ai"

  postflight do
    system_command "/usr/bin/find",
                   args: ["#{staged_path}", "-exec", "/usr/bin/xattr", "-c", "{}", ";"]
  end

  binary "trustwise/trustwise"
end
