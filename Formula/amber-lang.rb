class AmberLang < Formula
  desc "Programming language that compiles to Bash"
  homepage "https://amber-lang.com"
  url "https://github.com/amber-lang/amber/archive/refs/tags/0.4.0-alpha.tar.gz"
  sha256 "14046dd50c12c5f470177fc43029495fb8f489ba84fe301e3aada1f32493b211"
  license "GPL-3.0-only"
  head "https://github.com/amber-lang/amber.git", branch: "staging"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-amber/releases/download/amber-lang-0.4.0-alpha"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0c7fe23bb9802847687f1990bf9cb68163d460cc4faf747dcc5c2028b4ec9c55"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4c1eeca1b580187f8549ba3b97af43f85e99420429e14d914d1885342618c7ba"
    sha256 cellar: :any_skip_relocation, ventura:       "8ee8560c6358b2effdaa2ec1fdcc9c5e5d3bbc9c04976c0183bdd41ebf28793b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3f570aa5a3a1b89166c2f0fa35a913eed0e8b5b94f9fb3c2d105746ddc902c13"
  end

  depends_on "rust" => :build

  depends_on "bash"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"main.ab").write <<~EOF
      let name = "World"
      echo "Hello, {name}"
    EOF

    assert_equal "Hello, World\n", shell_output("#{bin}/amber main.ab")
  end
end
