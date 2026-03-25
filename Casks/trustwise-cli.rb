cask "trustwise-cli" do
  version "0.1.3.dev1"

  on_arm do
    sha256 "dda36758087597e75e53d4dda48c2a3ebb1d4b928c94f00dee3f2fd7f5819f9c"
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
