require 'formula'

class Parrot < Formula
  homepage 'http://www.parrot.org/'
  url 'ftp://ftp.parrot.org/pub/parrot/releases/supported/6.0.0/parrot-6.0.0.tar.bz2'
  sha256 '6cb9223ee389a36588acf76ad8ac85e2224544468617412b1d7902e5eb8bd39b'

  devel do
    url 'ftp://ftp.parrot.org/pub/parrot/releases/devel/6.1.0/parrot-6.1.0.tar.bz2'
    sha256 'bb1294ad2a7d5b3c4688fc736fb775e94ecfe35fdc072a2631c2080eb5f366f7'
  end

  head 'https://github.com/parrot/parrot.git'

  conflicts_with 'rakudo-star'

  depends_on 'gmp' => :optional
  depends_on 'icu4c' => :optional
  depends_on 'pcre' => :optional
  depends_on 'readline' => :optional
  depends_on 'libffi' => :optional

  def install
    system "perl", "Configure.pl", "--prefix=#{prefix}",
                                   "--mandir=#{man}",
                                   "--debugging=0",
                                   "--cc=#{ENV.cc}"

    system "make"
    system "make install"
    # Don't install this file in HOMEBREW_PREFIX/lib
    rm_rf lib/'VERSION'
  end
end
