class Prism32 < Formula
  desc "Self-extending polymorphic AI super-agent"
  homepage "https://github.com/MegaDyneSystems/prism32"
  url "https://github.com/MegaDyneSystems/prism32/raw/v7.2.4/prism32.py"
  sha256 "a290fb3193baadc83e9bf3483d9a6009e885725561636d0498ee6b7fadb812c0"
  version "7.2.4"
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
