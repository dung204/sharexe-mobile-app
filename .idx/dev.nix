{ pkgs }: {
  channel = "stable-25.05";
  packages = [
    pkgs.jdk17
    pkgs.unzip
    pkgs.fvm
  ];
  services.docker.enable = true;
  idx.extensions = [
    "Dart-Code.flutter"
    "vscodevim.vim"
    "dracula-theme.theme-dracula"
    "PKief.material-icon-theme"
    "streetsidesoftware.code-spell-checker"
    "usernamehw.errorlens"
    "mhutchie.git-graph"
    "aaron-bond.better-comments"
  ];
  # idx.previews = {
  #   previews = {
  #     android = {
  #       command = [
  #         "flutter"
  #         "run"
  #         "--machine"
  #         "-d"
  #         "android"
  #         "-d"
  #         "localhost:5555"
  #       ];
  #       manager = "flutter";
  #     };
  #   };
  # };
}
