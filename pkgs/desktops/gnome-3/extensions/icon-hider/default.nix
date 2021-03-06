{ stdenv, fetchFromGitHub, gnome3 }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-icon-hider";
  version = "23";

  src = fetchFromGitHub {
    owner = "ikalnytskyi";
    repo = "gnome-shell-extension-icon-hider";
    rev = "v${version}";
    sha256 = "18c8zkdrmdbghqqz7b450vhgpykgz25mgigwn2nggcb2lxmvm9ks";
  };

  uuid = "icon-hider@kalnitsky.org";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions
    cp -r ${uuid} $out/share/gnome-shell/extensions
  '';

  meta = with stdenv.lib; {
    description = "Icon Hider is a GNOME Shell extension for managing status area items";
    license = licenses.bsd3;
    maintainers = with maintainers; [ jonafato ];
    platforms = gnome3.gnome-shell.meta.platforms;
    homepage = https://github.com/ikalnytskyi/gnome-shell-extension-icon-hider;
    broken = versionAtLeast gnome3.gnome-shell.version "3.32"; # Doesn't support 3.34
  };
}
