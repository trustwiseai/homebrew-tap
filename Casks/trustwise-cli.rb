cask "trustwise-cli" do
  version "4.7.0"

  on_arm do
    sha256 "80296ad8bd75414cb199f80f8d06d358cbc9d3fcec2ccd1ac29cf185d999b4e8"
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
