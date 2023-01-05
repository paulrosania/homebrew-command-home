class Tron < Formula
  desc "Tiny CLI tool for controlling Lutron Caséta systems"
  homepage "https://github.com/paulrosania/tron"
  url "https://github.com/paulrosania/tron/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ba900a9aa7723990ef77dfb20137c56d0abdce93aa91696bc4d4f5d75c93f741"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/paulrosania/tron"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/tron"
    end
  end

  test do
    system "true"
    # TODO(ptr): implement an actual test
    # system "#{bin}/tron version"
  end
end
