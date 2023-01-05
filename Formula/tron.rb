class Tron < Formula
  desc "Tiny CLI tool for controlling Lutron Caséta systems"
  homepage "https://github.com/paulrosania/tron"
  url "https://github.com/paulrosania/tron/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "49d22d86123b1155d0df88473b16f3fb4fa7cc945af1eb6c0e6b0f2971648403"
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
