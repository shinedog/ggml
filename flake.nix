{
  description = "A flake to help with building ggml";
  nixConfig.bash-prompt = ''\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ '';
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/23.05";

  outputs = { nixpkgs, ... }:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
	in
	{
		devShells.${system}.default = pkgs.mkShell {
			packages = [ pkgs.cmake pkgs.gitFull pkgs.nano pkgs.wget pkgs.curl ];
		};
	};
}
