class Tron < Formula
  desc "Tiny CLI tool for controlling Lutron Caséta systems"
  homepage "https://github.com/paulrosania/tron"
  url "https://github.com/paulrosania/tron/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1fba688c52480ea7cd6c00243d89583e158343dfcec1f32890882cde2eb6e7da"
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
