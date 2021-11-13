require "language/node"

class Gtop < Formula
  desc "System monitoring dashboard for terminal"
  homepage "https://github.com/aksakalli/gtop"
  url "https://registry.npmjs.org/gtop/-/gtop-1.1.2.tgz"
  sha256 "04fa0e7d72c07c863258d802d1fd1fbb421ea7ec9130d69dc079be8771c621fc"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d8dd667ec7922211b271a4392d7b4040748b9741606d89d74e5ef62a201a1b4a"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e5adce5d3f299b11b5a5278e89c8201eb5cc4f2617b1ef88f07020a33b1df655"
    sha256 cellar: :any_skip_relocation, monterey:       "e91e34957b1c18263e1ca702de14758014ef3c81196c5225c220ffd6b8f9bb95"
    sha256 cellar: :any_skip_relocation, big_sur:        "d155b9fe2f75deabbd70c7cb6f07ac09cb69158a770b6ed8cca07d6d12cc7e60"
    sha256 cellar: :any_skip_relocation, catalina:       "d155b9fe2f75deabbd70c7cb6f07ac09cb69158a770b6ed8cca07d6d12cc7e60"
    sha256 cellar: :any_skip_relocation, mojave:         "d155b9fe2f75deabbd70c7cb6f07ac09cb69158a770b6ed8cca07d6d12cc7e60"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e5adce5d3f299b11b5a5278e89c8201eb5cc4f2617b1ef88f07020a33b1df655"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    assert_match "Error: Width must be multiple of 2", shell_output(bin/"gtop 2>&1", 1)
  end
end
