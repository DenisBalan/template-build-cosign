# Contributors guide

**Want to contribute? Great!**
We try to make it easy, and all contributions, even the smaller ones, are more than welcome.
This includes bug reports, fixes, documentation, examples...
But first, read this page (including the small print at the end).

Contributions are available on https://ifconfig.me/?https://gitlab.com/to-be-continuous/template-build-cosign.

## Legal

All original contributions to _to be continuous_ are licensed under the
[GNU Lesser General Public License](https://www.gnu.org/licenses/lgpl-3.0.html),
version 3.0 or later.

All contributions are subject to the [Developer Certificate of Origin](https://developercertificate.org/) (DCO).
The DCO is a lightweight way for contributors to certify that they wrote or otherwise have the right to submit the code they are contributing to the project.
The DCO text is also included verbatim in the [DCO.txt](DCO.txt) file in the root directory of the repository.

Contributors **must** _sign-off_ that they adhere to these requirements by adding a `Signed-off-by` line to commit messages, as shown below:

```text
This is the commit message

Signed-off-by: John Dev <john.dev@developer.example.org>
```

Git has a handy [`-s` command line option](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---signoff) to append this automatically to your commit message:

```bash
$ git commit -s -m 'This is the commit message'
```

## Reporting an issue

This project uses GitLab issues to manage the issues.

Before creating an issue:

1. upgrade your project to the latest released template version, and check whether your bug is still present,
2. have a look in the opened issues if your problem is already known/tracked, and possibly contribute to the thread with your own information.

If none of the above was met, open an issue directly in GitLab, select the appropriate issue template and fill-in each section when applicable.

## Submitting a code change

### Git Setup

Before contributing, make sure you have set up your Git authorship correctly:

```bash
git config --global user.name "Your Full Name"
git config --global user.email your.email@example.com
```

### Workflow

All submissions, including submissions by project members, need to be reviewed before being merged.

To contribute:

1. Create an issue describing the bug or enhancement you want to propose (select the right issue template).
2. Make sure the issue has been reviewed and agreed.
3. Create a Merge Request, from your **own** fork (see [forking workflow](https://docs.gitlab.com/ee/user/project/repository/forking_workflow.html) documentation).
   Don't hesitate to mark your MR as `Draft` as long as you think it's not ready to be reviewed.

### Git Commit Conventions

In addition to being signed-off according the [Developer Certificate of Origin](https://developercertificate.org/) (see above),
Git commits in _to be continuous_ shall be:

1. **atomic** (1 commit `=` 1 and only 1 _thing_),
2. **semantic** (using [semantic-release commit message syntax](https://semantic-release.gitbook.io/semantic-release/#commit-message-format)).

You'll find extensive information about Git commit conventions on the [reference documentation website](https://to-be-continuous.gitlab.io/doc/dev/workflow/#git-commit-guidelines).

### Coding Guidelines

The extensive _to be continuous_ coding guidelines can be found on the [reference documentation website](https://to-be-continuous.gitlab.io/doc/dev/guidelines/).
