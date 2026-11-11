# Terminal word navigation (zsh + iTerm2)

## Shortcuts

zsh uses emacs key bindings by default.

### Move the cursor

| Keys | Action |
|---|---|
| `Ctrl+a` | Go to the start of the line |
| `Ctrl+e` | Go to the end of the line |
| `Option+b` | Move back one word |
| `Option+f` | Move forward one word |
| `Option+←` / `Option+→` | Move back or forward one word |
| `Ctrl+b` / `Ctrl+f` | Move back or forward one character |

### Delete text

| Keys | Action |
|---|---|
| `Ctrl+w` | Delete the word before the cursor |
| `Option+d` | Delete the word after the cursor |
| `Ctrl+u` | Delete from the cursor to the start of the line |
| `Ctrl+k` | Not available. iTerm2 uses it for **Merge All Windows** (set by `./install.sh iterm`). zsh has no other key for this action. |
| `Ctrl+y` | Paste the last deleted text |

## iTerm2 setting

`Option+b` types `∫` unless the Option key acts as Meta. To set it:

1. Open **iTerm2 → Settings** (`Cmd+,`).
2. Click the **Profiles** icon in the top bar. The top-level **Keys** icon is the wrong place.
3. Select the **Default** profile.
4. Click **Keys → General**.
5. Set **Left option (⌥) key** to **Esc+**.
6. Keep **Right Option (⌥) key** at **Normal**. You need it for `#` and `€`.

The change applies at once to open tabs that use the profile.

Workaround with no setting: press `Esc`, release it, then press `b` or `f`.

## Keep it in dotfiles (not done yet)

iTerm2 stores settings in `~/Library/Preferences/com.googlecode.iterm2.plist` (binary).
For dotfiles, use a Dynamic Profile JSON file. It holds only the keys you set.

- Location: `~/Library/Application Support/iTerm2/DynamicProfiles/`. Symlink the file from this repo.
- `"Option Key Sends"` values: `0` = Normal, `1` = Meta, `2` = Esc+.

```json
{
  "Profiles": [
    {
      "Name": "Alfredo",
      "Guid": "alfredo-profile-1",
      "Dynamic Profile Parent Name": "Default",
      "Option Key Sends": 2,
      "Right Option Key Sends": 0
    }
  ]
}
```

After you add it, select the profile and click **Other Actions → Set as Default**.
