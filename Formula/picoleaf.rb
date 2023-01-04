class Picoleaf < Formula
  desc "A tiny CLI tool for controlling Nanoleaf"
  homepage "https://github.com/paulrosania/picoleaf"
  url "https://github.com/paulrosania/picoleaf/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "31e298da324c3c71f00322e4aae3bf7ad845813fd5aad5cdf506e15526b02d07"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/paulrosania/picoleaf"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/picoleaf"
    end
  end

  test do
    system "true"
    # TODO(ptr): implement an actual test
    # system "#{bin}/picoleaf version"
  end
end
