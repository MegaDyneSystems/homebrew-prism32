class Prism32 < Formula
  desc "Self-extending polymorphic AI super-agent"
  homepage "https://github.com/MegaDyneSystems/prism32"
  url "https://github.com/MegaDyneSystems/prism32/raw/v7.2.2/prism32.py"
  sha256 "906e2107cc7c7e173320b9cc6d96267ede88f71c6f9b7a439ebcf7372694d523"
  version "7.2.2"
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
