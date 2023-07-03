class Zentracker < Formula
  desc "Command Line Automatic Time Tracker for OSX"
  homepage "https://github.com/dohsimpson/ZenTracker"
  url "https://github.com/dohsimpson/ZenTracker/archive/master.zip"
  version "0.0.2"
  sha256 ""
  def install
    bin.install "zentrackerd"
    bin.install "zentracker"
  end

  service do
    run opt_bin/"zentrackerd"
    keep_alive true
  end
end
