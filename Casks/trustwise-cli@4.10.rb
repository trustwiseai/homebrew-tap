cask "trustwise-cli@4.10" do
  version "4.10.0"

  on_arm do
    sha256 "6f4b253c084978e30f4047ee941ae8e253d5fb1f71ea1f334b341237b08171ca"
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
