# MOP for Homebrew on Linux

MOP is modeio's all-in-one process monitor with AI security review.

With GitHub access to both private repositories configured (`gh auth login` and `gh auth setup-git`):

```bash
brew install Egbertjing/mop/mop
mop
```

The formula pins MOP 0.9.3. It installs the core Linux terminals `mop`, `hmop`, and `bmop`. Models and privileged collectors are configured separately. macOS and Windows monitoring are not supported.

[Installation and validation details](https://github.com/Egbertjing/all-in-one-modeio/blob/main/docs/packages.md)

Update: `brew update && brew upgrade Egbertjing/mop/mop`.
