cask "trustwise-cli" do
  version "4.4.0.dev3"

  on_arm do
    sha256 "6b6b11ddf86f0707dc3057bcad5f926d98c6ca35d2b80698a86af39a412f6dbc"
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
