cask "trustwise-cli@4.11" do
  version "4.11.0"

  on_arm do
    sha256 "eddda3d8eabf393128158e7873929bc106770ca33d265215083ddfc37bbc4aac"
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
