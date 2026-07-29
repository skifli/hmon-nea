# hmon-nea

This is the repository for the LaTeX write-up for my OCR A-Level Computer Science (H446) NEA. The repository for the code can be found here: https://github.com/exeme-project/hmon.

> [!INFO]
> The code repository is under [exeme-project](https://github.com/exeme-project) as that's the organisation I tend to use for some of my more ambitiuous programs, like my [own programming language's compiler](https://github.com/exeme-project/exeme-lang) (also written in C)!

I use [nixOS](https://github.com/skifli/nixos) on my desktop, which allows me to define my environment in the [flake.nix](flake.nix) file. I also have settings and other useful doohickeys already setup in the [.zed](.zed/) directory, as I use the [Zed](https://zed.dev) editor (although I do also love [helix](https://helix-editor.com/) for when I'm doing terminal work).

To use my development environment (on nixOS), clone this repository, open in your terminal, and type `direnv allow`. From that moment on whenever you open the cloned repository directory, you will be placed in a environment managed by direnv that contains all of the packages needed for writing the NEA. For my full experience you also need my [Zed settings](https://github.com/skifli/nixos/tree/main/users/programs/visual/zeditor.nix) defined in my [nixOS configuration repo](https://github.com/skifli/nixos).

Note that the initial running of this command will probably take a long time, and you will likely get red text in your terminal such as `[path]/bin/direnv export zsh]) is taking a while to execute. Use CTRL-C to give up` (or if you don't use zsh whatever shell you use). This will only occur the first time as the nixpkgs are being built - and it will probably take a long time as I use the full scheme for TexLive. However after the first build it'll be extremely fast after that :).

## [src](src/) setup

Informal notes: [src/class-notes.md](src/class-notes.md).

- Root file: [src/main.tex](src/main.tex).

## Zed setup

> [!NOTE]
> As of writing this Zed doesn't have support for a project-specific `keybinds.json` file, so you have to manually copy to your user keybinds file :p.

- Ctrl+Alt+W - Should automatically watch for changes to the NEA and re-build the PDF when it detects them.
- Ctrl+Alt+P - One-off build PDF.
- Ctrl+Shift+P - Clean build dir.
