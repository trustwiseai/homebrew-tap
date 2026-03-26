cask "trustwise-cli" do
  version "0.1.3.dev1"

  on_arm do
    sha256 "e4794ebd3b7ed3e803f462eb16426b9c140e37eb1ec46c5bb0bd9f1a46e70211"
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
