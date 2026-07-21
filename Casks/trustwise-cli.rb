cask "trustwise-cli" do
  version "4.7.1"

  on_arm do
    sha256 "cd79b1345f50c6aacf427d131ae9b1fc0cdbbd08120b78d8fcfbbd9fc61d373b"
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
