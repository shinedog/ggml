{
  description = "A flake to help with building ggml";
  nixConfig.bash-prompt = ''\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]:\[\033[0m\]\[nixshell(ggml)\]$ '';
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/23.05";

  outputs = { nixpkgs, ... }:
	let
		system = builtins.currentSystem;
		pkgs = import nixpkgs { inherit system; };
	in
	{
		devShells.${system}.default = pkgs.mkShell {
			packages = [ pkgs.cowsay ];
		};
	};
}
