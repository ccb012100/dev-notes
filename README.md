# notes

various notes/documentation

## Linux

- Change colors in terminal: <https://askubuntu.com/a/466203>
- Reload .bashrc: `source .bashrc`
- useful packages
  - `htop`
  - `[diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)`
  - [bat](https://github.com/sharkdp/bat)
  - `fzf`
  - `glances`
- reload `.bashrc`
  - `source ~/.bashrc`
  - `. ~/.bashrc`
  - `exec bash`
  - <https://stackoverflow.com/a/35073891> for explanation of differences

## Nano

### switches

- **-B** (backs up the file prior to editing it)
- **-E** (converts tabs to spaces when editing)
- **-c** (constantly show the cursor position stats)
- **-i** (automatically indents new lines to the same position as the previous line)
- **-k** (toggle cut so that it cuts from cursor position instead of the whole line)
- **-m** (provides mouse support to the editor)
- **-v** (opens file as readonly)

### nanorc

- run `nano -V` to check if `--enable-nanorc option` is present
- apply settings to
  - all users:
    - copy `nanorc` to `/etc/nanorc`
  - a single user:
    - copy `nanorc` to `$HOME/.nanorc`

## Resharper

- settings file is located at `%AppData%\JetBrains\Shared\vAny\GlobalSettingsStorage.DotSettings`

## VS Code

### Settings files

- `%AppData%\Code\User\keybindings.json`
- `%AppData%\Code\User\settings.json`
- `%AppData%\Code\User\snippets\typescript.json`

#### Export list of Extensions to text

- open Terminal in Code and enter the command `code --list-extensions | xargs -L 1 echo code --install-extension`
- To install the same extensions in a new VS Code environment (new machine, etc.), just take the output from the above and paste into the Terminal (see <https://stackoverflow.com/a/49398449)>

#### Set VS Code as Git diff tool

- add to file `C:\Program Files\Git\mingw64\etc\gitconfig`:

```bash
[difftool "vscode"]
cmd = \"C:\\Program Files\\Microsoft VS Code\\Code.exe\" \"$LOCAL\" \"$REMOTE\" --diff --wait
trustExitCode = false
```

## Git

### Configuration

- Config file location: %USERPROFILE%/.gitconfig
- Atlassian page on git config: <https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config>
- Change the directory new windows open in: <https://stackoverflow.com/a/32125911>
- Set Notepad++ as the text editor:
  - `git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`
- Set TortoiseGit as diff and merge tool: <https://stackoverflow.com/a/16494703>
- Prompt customization file is located in `C:\Program Files\Git\etc\profile.d\git-prompt.sh`

### Show current branch in CLI

- <https://askubuntu.com/a/730758>

### Set TortoiseGit diff and merge tools

```bash
[diff]
tool = tortoisediff
[difftool]
prompt = false
[merge]
tool = tortoisemerge
[mergetool]
prompt = false
keepBackup = false
[difftool "tortoisediff"]
cmd = \""c:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe"\" -mine "$REMOTE" -base "$LOCAL"
[mergetool "tortoisemerge"]
cmd = \""c:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe"\" -base "$BASE" -theirs "$REMOTE" -mine "$LOCAL" -merged "$MERGED"
```

## Angular

### RouterModule

`RouterModule.forRoot(routes, {enableTracing: true} )`

- `enableTracing` → makes the router log all its internal events to the console.

### Templates

- To be able to reference an enum in a template, you have to add a reference to the enum in the component.
  - see <https://stackoverflow.com/questions/45361006/using-enums-in-angular2-view-templates/45361066#45361066>
  - example:

```typescript
  import { sampleEnum } from './sampleEnum';

  export class SampleComponent { sampleEnum = sampleEnum; ... }
```

### RxJS

- `import { Observable } from 'rxjs/Observable';`
  - note that `Observable` must be capitalized or you'll get the error `TypeError: observable_1.Observable.of is not a function`

#### v6 changes

- `import 'rxjs/add/operator/map'`=> `import { map } from "rxjs/operators";`
- `Observable.of(x)` => `of(x)`
- `Observable.subscribe().map(x => x + x)` => `Observable.subscribe().pipe(map(x => x + x))`

### Tests

- new test files won't be picked up unless you restart `ng test`
- Pending tests:

```typescript
xit("can be declared 'xit'", function() {
  expect(true).toBe(false);
}); // shows as pending spec

it("can be declared with 'it' but without a function");

it("can be declared by calling 'pending' in the spec body", function() {
  expect(true).toBe(false);

  pending();
});
```

### Selectors

- `fixture.debugElement.nativeElement.querySelector('div')` → return first match

- `fixture.debugElement.nativeElement.querySelectorAll('div')` → return all matches

### Http

- add `import {Response} from '@angular/http'` or you will get weird errors when the tests run because it resolves to the wrong `Response` type
  - (see <https://stackoverflow.com/a/45065503)>

### Test NOT Equal

- `expect(result).not.toEqual(x)`

### lodash

- import in the files using `lodash` (such as `app-config.service.ts`) have to be:
  - `import \- as \_ from 'lodash'`
  - NOT: `import \_ from 'lodash'`

### console messages

- `beforeEach(function(){ spyOn(console, 'error'); })`

```typescript
it('should print error to console', function() {
  yourApp.start();

  expect(console.error).toHaveBeenCalled();
});
```

- force a test failure
  - `fail(message: string)`

### Listening for keyboard input

- example:

```typescript
  // prevents keyboard input in the Adjustment Date field so user must use DatePicker
  @HostListener('body:keydown', ['$event'])

  keypress(event: any) {
      if (event.target.name === 'adjDate') {
          event.preventDefault();
      }
  }
```
