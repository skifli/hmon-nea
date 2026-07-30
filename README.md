# hmon-nea

This is the repository for the LaTeX write-up for my OCR A-Level Computer (H446)
NEA. The code repository can be found
[@exeme-project/hmon](https://github.com/exeme-project/hmon).

<!-- prettier-ignore -->
> [!NOTE]
> The code repository is under
> [exeme-project](https://github.com/exeme-project) as that is the organisation
> I tend to use for some of my more ambitiuous programs, like my
> [own programming language's compiler](https://github.com/exeme-project/exeme-lang)
> (also written in C)!

## Notes on working environment

The repository is pre-configured to my liking to make it extremely easy for me
to get started on work with the NEA whenever I want to, but that does mean if
you aren't in the same environment as I have setup stuff can easily break. If
you're planning to replicate this environment you should probably read the
following:

### General

1. My OS is [nixOS](https://nixos.org/), which is important as it's
   declarative - i.e., I have code telling the OS not just what apps to install
   but how to configure them. The repository for my nixOS configuration can be
   found [@skifli/nixos](https://github.com/skifli/nixos).
2. I use [Zed](https://zed.dev/) as my editor of choice for the NEA - although
   when I'm doing some terminal work I do also use
   [Helix](https://helix-editor.com/).

- The first thing to note is that I have scripts bound to compositor keys that
  automatically open all the windows I need for my NEA, and organise them onto
  my two monitors - the specific script for my NEA is called
  [2-niri.sh](https://github.com/skifli/nixos/blob/main/users/ami/scripts/2-niri.sh).
- This means that whenever I want to do work on my NEA I can just
  [press `Mod+Ctrl+2`](https://github.com/skifli/nixos/blob/2bf727b805cd40c07e6ee4ab36d4f43df8edaaf7/users/programs/compositor/niri/binds.nix#L345),
  and it'll open my PDF viewer, editor, etc., and organise them on the monitors
  and in the sizes I want.
- However, most of that script probably won't be useful for anyone else, with
  the exception of
  [lines 12 to 20](https://github.com/skifli/nixos/blob/2bf727b805cd40c07e6ee4ab36d4f43df8edaaf7/users/ami/scripts/2-niri.sh#L12).
  Those lines launch (if it isn't already running)
  [src/zeditor-synctex.sh](src/zeditor-synctex.sh) - more information on SyncTeX
  later, but since that's not included in this repository setup you should
  probably work out some other way of starting that script whenever you open
  this directory.

<!-- prettier-ignore -->
> [!NOTE]
> These scripts also require
> [jq](https://github.com/skifli/nixos/commit/f4797f8ef6f3d425bd14e8d208f4454ae9efadaf#diff-7ca3f7dce1c0f19e09b9826d401954d02f09deee1125502809b89dfbded43149R190)
> to be installed on your system if it's not already.

### devenv

As I'm already using Nix I use [devenv](https://devenv.sh/) to manage my
environment - it's a bit like virtualenv, but manages not just Python packages
but everything. The devenv configuration is in [flake.nix](flake.nix), and
contains all the packages needed for my environment.

To use my development environment (on nixOS), clone this repository, open in
your terminal, and type `direnv allow`. From that moment on whenever you open
the cloned repository directory, you will be placed in a environment managed by
direnv that contains all of the packages needed for writing the NEA.

### Zed setup

As I use Zed for editing, there is a settings configuration file in
[.zed/settings.json](.zed/settings.json) that should automatically configure
markdown to be formatted using `prettier` (again make sure it's installed on
your system), and also configures SyncTeX forward searching (see the below
section for more information). Don't forget to also install the `markdownlint`
extension though as well.

### SyncTeX

This connects the source code to the output PDF. Essentially, if configured
properly it means that whenever the LaTeX is updated the PDF viewer auto scrolls
to the updated area (if it's not already in the viewport) and highlights the
change, and also if you Ctrl Click on an area of the PDF it goes to the exact
line of code that defines it in the relevant LaTeX file.

I have it fully setup, but it relies on the following assumptions - change if
they are different for you:

- I use the [Evince](https://wiki.gnome.org/Apps/Evince) PDF viewer. If you
  don't, it's going to be a bit harder to change as you need to find a specific
  program that allows that PDF viewer to interface with SyncTex. The
  [rzukic/zed-latex wiki](https://github.com/rzukic/zed-latex/wiki/Preview)
  might be a good place to start. You need to first change the
  [flake.nix](flake.nix) file to package your PDF viewer's SyncTex interface
  program however relevant. Then, you need to update
  [.zed/settings.json](.zed/settings.json) under `forwardSearch` to run whatever
  new binary you have installed, with whatever arguments it expects. Lastly, you
  need to update [src/zeditor-synctex.sh](src/zeditor-synctex.sh) with code to
  communicate with your chosen PDF viewer. This should allow forward searching,
  and backwards searching, respectively.

- I use the [Zed](https://zed.dev) editor. The `latex` extension automatically
  builds the output PDF on any change, so if your editor doesn't do that you
  should work out how to do so. As I also use Evince as aforementioned, it
  automatically reloads the PDF on change (and remembers state). Lastly, I have
  Zed configured to automatically perform forward searches for Evince in
  [.zed/settings.json](.zed/settings.json) - again this should be setup in your
  editor of choice.
- Whenever I start working on my NEA my computer automatically runs the
  [src/zeditor-synctex.sh](src/zeditor-synctex.sh) script - as aforementioned
  this is baked into my hotkey setup, but you should also look into starting
  this automatically - e.g., maybe with direnv? I dunno! What this allows though
  is the backwards searching functionality of SyncTeX.
