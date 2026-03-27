cask "trustwise-cli" do
  version "4.4.0.dev6"

  on_arm do
    sha256 "4604cabba84246114290fe86bc5fb88fb1226c12d1d6d9e3278599fe6c8fd9a6"
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
