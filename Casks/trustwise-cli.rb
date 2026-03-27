cask "trustwise-cli" do
  version "4.4.0.dev8"

  on_arm do
    sha256 "4c36bc915b6e56a7a16368ffeddd084f4b20d0de4d3879bf88d6c70dea654235"
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
