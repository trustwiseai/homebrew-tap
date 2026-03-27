cask "trustwise-cli" do
  version "4.4.0.dev5"

  on_arm do
    sha256 "140018144105d98efdb0210f77b7a9b5c4718095f6dceb3fc1be742f8217c668"
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
