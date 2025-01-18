{config, pkgs, ...}:
{
home = {
	username = "mozgoff";
	homeDirectory = "/home/mozgoff";
	stateVersion = "24.11";

	packages = with pkgs;[
	firefox-bin
	pcmanfm
	vscode-fhs
	neofetch
	alacritty
	telegram-desktop
	pipx
	nitrogen
	python3
	libreoffice
	qbittorrent
	unzip
	docker
	git
];

	};
 
  nixpkgs.config = {
allowbroken = true;
allowUnfree = true;

imports = [
	#./sway/default.nix
	./git.nix
];

};
}
