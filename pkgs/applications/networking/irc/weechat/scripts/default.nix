{ callPackage, luaPackages, pythonPackages }:

{
  wee-slack = callPackage ./wee-slack {
    inherit pythonPackages;
  };

  weechat-autosort = callPackage ./weechat-autosort { };

  weechat-matrix-bridge = callPackage ./weechat-matrix-bridge {
    inherit (luaPackages) cjson;
  };

  weechat-xmpp = callPackage ./weechat-xmpp {
    inherit (pythonPackages) pydns;
  };
}
