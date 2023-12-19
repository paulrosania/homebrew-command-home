class Picoleaf < Formula
  desc "Tiny CLI tool for controlling Nanoleaf"
  homepage "https://github.com/paulrosania/picoleaf"
  url "https://github.com/paulrosania/picoleaf/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "130fc64bebf74e888050f5a53ed91bbd28b32f78fbdd3c3e1f3cf7f4ac4ddd4b"
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
