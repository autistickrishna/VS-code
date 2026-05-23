# VS code

This repository stores your local VS Code workspace and a safe backup of your VS Code user settings, extensions, and a restore script so you can recreate your environment after reinstalling macOS.

Repository layout

- `New.c++` — local example source file from your workspace.
- `vscode-settings/` — backup of VS Code settings and extensions used to restore a new install:
  - `settings.json` — user settings
  - `extensions.txt` — list of extensions to reinstall
  - `restore_vscode.sh` — restore script (executable)

Restore instructions (quick)

1. Clone this repo:

   git clone https://github.com/autistickrishna/VS-code.git

2. Open VS Code and install the `code` CLI (Command Palette → `Shell Command: Install 'code' command in PATH`).

3. Run the restore script from the repo root:

   bash vscode-settings/restore_vscode.sh

   - The script copies `settings.json` into your VS Code user folder and attempts to install extensions using the `code` CLI.

If `code` is not available the script will print instructions to install it; extensions can also be restored manually by running:

   xargs -L 1 code --install-extension < vscode-settings/extensions.txt

How I (the assistant) use this repo

- I can update the `vscode-settings` folder with your latest `settings.json`, keybindings, snippets, and an updated `extensions.txt` whenever you ask.
- I can run the restore script or the `code --install-extension` commands for you after you confirm.
- If you reinstall macOS, tell me to clone the repo and I will run the restore steps for you (I may require your approval for any credential or interactive steps).

Keeping backups up-to-date

- To refresh the backup: update `Library/Application Support/Code/User/settings.json` locally, then copy it into `vscode-settings/settings.json`, update `vscode-settings/extensions.txt` from the sync data or `code --list-extensions`, commit and push.

Troubleshooting

- If `gh` or `code` CLI are not available, install them:
  - `gh`: follow https://cli.github.com/ or run the prebuilt installer we used previously (`~/bin/gh`).
  - `code`: open VS Code → Command Palette → `Shell Command: Install 'code' command in PATH`.

Security note

- The restore script does not contain or require any credentials. When I need to create or delete GitHub repos or modify account-level settings I will always ask for explicit confirmation before proceeding.

If you want, I can add automated scripts to export keybindings, snippets, and other profile items into this repo as well. Tell me what to include and I'll add it.

