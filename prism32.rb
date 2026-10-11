class Prism32 < Formula
  desc "Self-extending polymorphic AI super-agent"
  homepage "https://github.com/MegaDyneSystems/prism32"
  url "https://github.com/MegaDyneSystems/prism32/raw/v7.2.3/prism32.py"
  sha256 "90154027e22f5a7821ae2d4f94c36194b3bddcb7dbcaa43e82cfb58d4f22561a"
  version "7.2.3"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    libexec.install "prism32.py"
    (bin/"prism32").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.12"].opt_bin}/python3" "#{libexec}/prism32.py" "$@"
    EOS
    chmod 0755, bin/"prism32"
  end

  test do
    system bin/"prism32", "--version"
  end
end
