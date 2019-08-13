{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "weechat-script-text-item";
  version = "0.9";

  src = fetchFromGitHub {
    repo = "weechat-scripts";
    owner = "weechatter";
    rev = "40eb0e53129c4797cc1dac45f30b049a17f069e8";
    sha256 = "05mw52vr2ya5bf7sbyzbnca02kj9v5nv0f9cgplan51d1r3m5sfq";
  };

  dontBuild = true;

  installPhase = ''
    install -D -m 0644 python/text_item.py $out/share/text_item.py
  '';

  meta = with stdenv.lib; {
    homepage = "https://weechat.org/scripts/source/text_item.py.html/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ bdesham ];
    description = "A WeeChat script to add plain-text bar items.";
  };
}
