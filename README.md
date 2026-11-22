This folder is a **catkin_workspace**.


To update submodules:

```
git submodule init
git submodule update
```


run `catkin_make` in this directory then use `source gaga/devel/setup.bash`
to execute the code.

## Pinned submodules

The workspace records the following submodule commits in Git. Keep these pins
when restoring this historical workspace; do not update them to a branch tip.

### `src/pr2_mechanism`

- Repository: `git@github.mit.edu:goretkin/pr2_mechanism.git`
- Pinned commit: `862e3b9199c7d641f3faf109b1df3c44c2d6122b`

### `src/my_controller_pkg`

- Repository: `git@github.mit.edu:goretkin/force_feedback_controller.git`
- Pinned commit: `a9759ca1859f26cda7ec9cc97d30b0085458a9b3`

### `src/lis_pr2_pkg`

- Repository: `git@github.com:Learning-and-Intelligent-Systems/lis_pr2_pkg.git`
- Pinned commit: `f610d74851433441b0a4558163cca07e2f7e6db2`

The two `github.mit.edu` repositories may require institutional access. Their
availability has not been verified here. The public repository records the pins,
but does not include the submodules' source contents.

The `src/force_feedback_controller` section in `.gitmodules` uses the local path
`src/my_controller_pkg`. This name/path distinction is preserved as recorded.
