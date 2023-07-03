class Filesweeper < Formula
  desc "Deletes old files from downloads and desktop"
  homepage "https://github.com/mjeffryes/homebrew-mjeffryes/tree/main"
  url "https://raw.githubusercontent.com/mjeffryes/homebrew-mjeffryes/25baf53275da64bbda94b608eddcb043ff822717/README.md"
  sha256 "8d4aa992768cba792eab2c0b62b20e8ff6dd6e84bf66d1eaf37069058a70eacc"
  version "0.0.1"
  license "MIT"

  depends_on "fd"

  def install
    (bin/"delete-old-files.sh").write <<~EOS
    #!/bin/bash
    set -eu

    now=$(date -Iminutes)

    for dirname in "$HOME/Desktop" "$HOME/Downloads"; do
      if [[ -n $(fd . "$dirname" --changed-before 2d -1) ]]; then
        prefix=$(basename "$dirname")
        trashdir="$HOME/.Trash/$now-$prefix"
        mkdir -p "$trashdir"
        fd . "$dirname" --changed-before 2d -x mv {} "$trashdir"
      fi
    done
    EOS

  end

  service do
    run bin/"delete-old-files.sh"
    interval (3600 * 4)
  end
end
