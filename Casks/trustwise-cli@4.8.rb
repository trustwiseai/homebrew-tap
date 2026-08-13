cask "trustwise-cli@4.8" do
  version "4.8.0"

  on_arm do
    sha256 "b83a0fd6643207c74853f6ed02af97a49aa68f45cb925f74c825f35d8404a418"
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
