class Mop < Formula
  desc "modeio all-in-one process monitor with AI security review"
  homepage "https://github.com/Egbertjing/all-in-one-modeio"
  url "https://github.com/Egbertjing/all-in-one-modeio.git",
      tag: "v0.9.3",
      revision: "233dd0e12eb4cd1a181560df0a049733e341a703"
  version "0.9.3"

  depends_on :linux
  depends_on "python@3.12"

  def install
    (libexec/"share/modeio-mop").install "mop"
    %w[mop hmop bmop].each do |name|
      (libexec/"bin").install "packaging/launcher.py" => name
      inreplace libexec/"bin"/name, "/usr/bin/python3", Formula["python@3.12"].opt_bin/"python3.12"
      chmod 0755, libexec/"bin"/name
      bin.install_symlink libexec/"bin"/name
    end
  end

  def caveats
    <<~EOS
      Run mop, hmop, or bmop.
      AI review uses a separately running model; deep collectors are optional.
      Setup: https://github.com/Egbertjing/all-in-one-modeio/blob/main/docs/system-install.md
    EOS
  end

  test do
    assert_match "MOP #{version}", shell_output("#{bin}/mop --version")
    assert_match "H-MOP #{version}", shell_output("#{bin}/hmop --version")
    assert_match "B-MOP #{version}", shell_output("#{bin}/bmop --version")
    assert_match '"proc": true', shell_output("#{bin}/mop doctor")
  end
end
