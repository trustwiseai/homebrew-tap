cask "trustwise-cli" do
  version "4.5.0"

  on_arm do
    sha256 "1be5b45b23cd571049433d05d4271cd619b592dcea7f4b44fdd77ff4e0dda06b"
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
