## master

* Add your own contribution below

* Transform `line` into an int before comparing it with ranges when posting inline comments to GitHub - barbosa

## 4.0.4

[Full Changelog](https://github.com/danger/danger/compare/v4.0.3...v4.0.4)

* Test on Ruby 2.4.0 - Connor Shea
* Don't rely on regular expressions to determine whether or not a file will register a plugin. - Ray Zane
* Fixes parsing Gems for pulling in their plugin JSON metadata - orta/barbosa

## 4.0.3

[Full Changelog](https://github.com/danger/danger/compare/v4.0.2...v4.0.3)

* Print out an error when posting a comment to BitBucket Server fails - Buju77

## 4.0.2

[Full Changelog](https://github.com/danger/danger/compare/v4.0.1...v4.0.2)

* Refactor plugin_support/plugin_file_resolver.rb - Juanito Fatas
* Extend BitBucket Server request source support - Alexandr Chaplyuk

## 4.0.1

[Full Changelog](https://github.com/danger/danger/compare/v4.0.0...v4.0.1)

* Fixed --new-comment not working with Bitbucket - Bruno Rocha
* Adjust GitHub comment output for new Markdown parser - Yuki Izumi

## 4.0.0

[Full Changelog](https://github.com/danger/danger/compare/v3.6.0...v4.0.0)

Welcome to 4.0. This one comes with _only_ breaking changes. There are two of them.
They both change pretty fundamental behavior in Danger:

* Switch messaging's sticky to default to `false` - Bogren
* Move the `gitlab` gem into `danger-gitlab` - Orta

#### Sticky

The sticky one affects every Dangerfile. When we first introduced the feature, we wanted
to experiment with how people used it. Looks like in general, people are writing `sticky: false`
a lot in their Dangerfiles. Enough that it is worth going through the pain of migrating the change.

If you prefer the old behavior, you need to add `sticky: true` to the end of every call to
`warn`, `fail` and `message`. E.g. `message("Let's show something", sticky: true)`.

Otherwise, you can just remove `sticky: false` from the Dangerfile.

#### GitLab

We want to keep the dependency tree for Danger as small as possible for the majority of our users.
What this means is that we are moving the gitlab dependencies out into a separate gem. `danger-gitlab`.

This reduces the number of dependencies we have for the majority of Danger's users. We _love_ GitLab, I've
been super happy with their work, and we use GitLab for Danger.Systems. This is not a slight on the project.

However, as of 4.0. Anyone using Danger with GitLab will need to use `danger-gitlab` instead of `danger`. It will stay
in lock-step with the same major SemVer releases with Danger. That should be your only change.

./orta

---


## 3.6.0

[Full Changelog](https://github.com/danger/danger/compare/v3.5.5...v3.6.0)

* Support for Jenkins pipelines - fwal
* Implemented '--new-comment' support for GitLab - Nikolay Kasyanov
* Improves Danger: Ignore "[warning/error text]" parsing - Juanito Fatas

## 3.5.5

[Full Changelog](https://github.com/danger/danger/compare/v3.5.4...v3.5.5)

* Show warning when Danger is missing permissions to update PR status, even on successful build - hanneskaeufler
* Fixed '--new-comment' creating multiple GitHub status checks, and removing the argument on a subsequent build will now make Danger correctly edit it's last comment - Bruno Rocha
* Fix crash in git_repo.rb (#636) - Kyle McAlpine & Viktor Benei & orta & Juanito Fatas

## 3.5.4

[Full Changelog](https://github.com/danger/danger/compare/v3.5.3...v3.5.4)

* fail fast if still cannot find the commit after fetch - Juanito Fatas
* Adds the `--new-comment` argument to `danger` command - Bruno Rocha

  Makes Danger post a brand new comment by ignoring other Danger instances.

* Fixed an issue where EnvironmentManager's output UI could be `nil`, and would blackhole error messages - @notjosh
* `danger pr` now accepts `--dangerfile` argument - Juanito Fatas

  ```
  danger pr https://github.com/danger/danger/pull/518 --dangerfile ~/Dangerfile
  ```

## 3.5.3

[Full Changelog](https://github.com/danger/danger/compare/v3.5.2...v3.5.3)

* Removes the mr/pr diff from the tabled output during `danger pr`, `danger local` and `danger --verbose`. This is because it can be a very large output that's not too useful, and can occasionally cause errors. - orta

## 3.5.2

[Full Changelog](https://github.com/danger/danger/compare/v3.5.1...v3.5.2)

* `danger pr` takes an argument as PR URL instead of `--use-pr` option - Juanito Fatas

  Work with Open PR:

  ```
  danger pr https://github.com/danger/danger/pull/615
  ```

  Work with Merged PR:

  ```
  danger pr https://github.com/danger/danger/pull/613
  ```

  Works with forks, too:

  ```
  danger pr https://github.com/JuanitoFatas/danger/pull/3
  ```

## 3.5.1

[Full Changelog](https://github.com/danger/danger/compare/v3.5.0...v3.5.1)

* Adds `danger pr` command to run against Pull Requests - Juanito Fatas

  Work with Open PR:

  ```
  danger pr --use-pr=https://github.com/danger/danger/pull/615
  ```

  Work with Merged PR:

  ```
  danger pr --use-pr=https://github.com/danger/danger/pull/613
  ```

  Works with forks, too:

  ```
  danger pr --use-pr=https://github.com/JuanitoFatas/danger/pull/3
  ```

## 3.5.0

[Full Changelog](https://github.com/danger/danger/compare/v3.4.2...v3.5.0)

* Adds a template for for creating a gem-based Dangerfile - dblock (+ orta)

  Adding two new commands:

  `danger dangerfile init` which creates the same Dangerfile generated in `danger init` but without all the talking.

  `danger dangerfile gem [gemname]` which uses the [dangerfile-gem-template](https://github.com/danger/dangerfile-gem-template) repo to create a Gem based on our current best practices.

## 3.4.2

[Full Changelog](https://github.com/danger/danger/compare/v3.4.1...v3.4.2)

* Adds backwards compatibility for plugin testing API - sorry - @orta
* Multiple remotes support for Jenkins - Juanito Fatas
* Fixed a problem when checking if the latest PR commit have been fetched - @fwal

## 3.4.1

[Full Changelog](https://github.com/danger/danger/compare/v3.4.0...v3.4.1)

* Added option to run a Dangerfile from a `branch` and/or `path` when using a remote repo - felipesabino
* Add specs for `Danger::EnvironmentManager` - Juanito Fatas
* Fixes plugin that inherits from `Danger::Plugin` should not raise error - Juanito Fatas

## 3.4.0

[Full Changelog](https://github.com/danger/danger/compare/v3.3.2...v3.4.0)

* Simplify initialization of Octokit client in request_sources/github.rb - Juanito Fatas
* Ensure commits exist inside the local git repo before using them for diffs - orta
* Big improvements to the warning around no API tokens being found - orta
* Support for failing on errors - orta/Juanito Fatas (the PR was pretty shared)
* Improves `danger local` merged Pull Request finding logic - Juanito Fatas
* Adds some tests for Danger::Runner - Juanito Fatas
* Remove unused CLI options from `danger local` - Juanito Fatas
* Raises error if plugin file doesn't contain any class inherits from Plugin - Juanito Fatas

## 3.3.2

[Full Changelog](https://github.com/danger/danger/compare/v3.3.1...v3.3.2)

* Use danger_id as context for GitHub status - Thiago Felix
* Increase the number of commits `danger local` to search for merged PR - Juanito Fatas
* Fix rubocop offenses in plugin_linter.rb - Juanito Fatas
* Add missing require statements in bitbucket cloud and server - Juanito Fatas

## 3.3.1

[Full Changelog](https://github.com/danger/danger/compare/v3.3.0...v3.3.1)

* "danger local" can find squash-and-merge-type Pull Request - Juanito Fatas
* Fix request_sources files and specs location - Juanito Fatas
* Fix request_sources references in CI subclasses - Juanito Fatas
* trying to fix danger bugs - Juanito Fatas
* Fix Danger breaks when files are moved - Juanito Fatas

## 3.3.0

[Full Changelog](https://github.com/danger/danger/compare/v3.2.2...v3.3.0)

* Add support for Bitbucket Cloud - Wolfgang Damm

  This adds a new object to the DSL, `bitbucket_cloud` which offers the same API as Bitbucket Server!
  To use it, ensure `DANGER_BITBUCKETCLOUD_USERNAME` and `DANGER_BITBUCKETCLOUD_PASSWORD` are in your
  Jenkins environment, and you should be good to go.

* Add `git.info_for_file("some/file.txt")`: line counts and before/after file contents - tikitu
* Remove `String#danger_class` - Juanito Fatas
* Set defaults for file and line args of Violation#new & Markdown#new - Juanito Fatas
* Add docs to `String#danger_pluralize` & `String#danger_underscore` - Juanito Fatas
* Refactor Comment class out of CommentsHelper - Juanito Fatas

## 3.2.2

[Full Changelog](https://github.com/danger/danger/compare/v3.2.1...v3.2.2)

* Link to https://danger.systems/ in Bitbucket Server comments - HeEAaD
* Add `markdown_link` for the Bitbucket Server plugin - HeEAaD
* Updated Bitrise documentation about env vars - kylejm
* Fix `html_link` for gitlab - hanneskaeufler

## 3.2.1

[Full Changelog](https://github.com/danger/danger/compare/v3.2.0...v3.2.1)

* Fix for markdown accidentally crashing Danger when sending a message #520 - orta
* Improved the width handling for the output of the `danger local` table - orta
* Added a check for the merge inflection point inside the diff, and will fetch it if needed - orta
* Improved the width handling for the output of the `danger local` table - orta
* Update comment & remove unused regexp name in request_source.rb - JuanitoFatas
* Mask password on BitbucketServerAPI object - JuanitoFatas
* Add `scm_provider` to the DSL allowing users and plugins ot check which scm provider is being used when running danger - K0nserv
* Deprecated `branch_for_merge` for GitLab. Use `branch_for_base` instead. - K0nserv
* Added `branch_for_base` and `branch_for_head` for GitLab. - K0nserv

## 3.2.0

[Full Changelog](https://github.com/danger/danger/compare/v3.1.1...v3.2.0)

* Added `file` and `line` optional parameters to methods on the messaging plugin - champo

 This means that if you'd like to comment specifically on a line in a file inside the diff, you
 can use an API like:

 ```ruby
 message("Please add your name to the CHANGELOG", file: "CHANGELOG.md", line: 4)
 ```

 If you are using GitHub (who are the only ones with an API that supports line comments) you
 will have the comments added inline. This makes changes to a lot of the logic inside the github
 API, so we'd love bug reports (or PRs! :D) on things like "I expected this comment to be deleted."

 On other platforms, it will ignore the `file` and `line` parameters.

* Add Bitbucket Server aka. Stash integration - heeaad

  This adds a new object to the DSL, `bitbucket_server` which offers the following API:

  ```ruby
  bitbucket_server.pr_title # The title of the Pull Request

  bitbucket_server.mr_body # The body text of the Pull Request

  bitbucket_server.mr_author # The username of the author of the Pull Request

  bitbucket_server.mr_labels # The labels assigned to the Pull Request

  bitbucket_server.branch_for_merge # The branch to which the PR is going to be merged into

  bitbucket_server.base_commit # The base commit to which the PR is going to be merged as a parent

  bitbucket_server.head_commit # The head commit to which the PR is requesting to be merged from

  bitbucket_server.mr_json # The hash that represents the PR's JSON

  bitbucket_server.html_link (paths: String or Array, full_path=true: Bool) # Returns a list of HTML anchors for a file, or files in the head repository.
  ```

* Deprecated `import_dangerfile(String)` in favor of `import_dangerfile(Hash)` - dblock

  The new `import_dangerfile` method supports loading Dangerfile from Github.

  ```ruby
  danger.import_dangerfile github: 'ruby-grape/danger'
  ```

  You can package a Dangerfile in a gem, add it to Gemfile and import it.

  ```ruby
  danger.import_dangerfile gem: 'ruby-grape-danger'
  ```

  Use a local path for testing Dangerfile changes.

  ```ruby
  danger.import_dangerfile path: '/Users/me/source/ruby-grape/danger'
  ```

  See [#504](https://github.com/danger/danger/pull/504) for details.
* Prints updated danger message when installed danger is outdated - JuanitoFatas
* Remove a variable assignment in comments_helper.rb - JuanitoFatas
* Minor improvement to Danger.gem_path - JuanitoFatas

## 3.1.1

[Full Changelog](https://github.com/danger/danger/compare/v3.1.0...v3.1.1)

* Fixes for `danger.import_dangerfile "org/repo"` - orta re:#487

## 3.1.0

[Full Changelog](https://github.com/danger/danger/compare/v3.0.3...v3.1.0)

* Show appropriate error message when GitHub repo was moved - KrauseFx
* `danger plugins json [gem]` will now give gem metadata too - orta
* Crash fix for `bundle exec danger` - hanneskaeufler
* Fix Buildkite repo slug URL generation - phillfarrugia
* Added support for [Bitrise](http://bitrise.io) - kylejm
* Set LANG variable to en_US.UTF-8 before running git commands - bogren

## 3.0.3

[Full Changelog](https://github.com/danger/danger/compare/v3.0.2...v3.0.3)

* Add `mr_diff`/`pr_diff` for `Danger::DangerfileGitLabPlugin` - K0nserv
* Fixes a bug where `danger` wouldn't work on Jenkins when setup with the GitHub Pull Request Builder plugin - vittoriom

## 3.0.2

[Full Changelog](https://github.com/danger/danger/compare/v3.0.1...v3.0.2)

* Spelling and grammar fixes. - connorshea
* More crash fixes for `danger local`, maybe we need more tests here - orta

## 3.0.1

[Full Changelog](https://github.com/danger/danger/compare/v3.0.0...v3.0.1)

* Crash fix for `danger local` - hanneskaeufler

## 3.0.0

[Full Changelog](https://github.com/danger/danger/compare/v2.1.6...v3.0.0)

* GitLab support - k0nserv / deanpcmad / hjanuschka

  This started back in February, and is now shipping.
  Documentation has been updated on the [Getting Started](http://danger.systems/guides/getting_started.html#creating-a-bot-account-for-danger-to-use) for those interested in the setup.

  This adds a new object to the DSL, `gitlab` which offers the following API:

  ```ruby
  gitlab.mr_title # The title of the Merge Request

  gitlab.mr_body # The body text of the Merge Request

  gitlab.mr_author # The username of the author of the Merge Request

  gitlab.mr_labels # The labels assigned to the Merge Request

  gitlab.branch_for_merge # The branch to which the MR is going to be merged into

  gitlab.base_commit # The base commit to which the MR is going to be merged as a parent

  gitlab.head_commit # The head commit to which the MR is requesting to be merged from

  gitlab.mr_json # The hash that represents the MR's JSON

  gitlab.api # Provides access to the GitLab API client used inside Danger

  gitlab.html_link (paths: String or Array, full_path=true: Bool) # Returns a list of HTML anchors for a file, or files in the head repository.
  ```

  A lot of thanks for the GitLab team also, who helped handle updates for one of our dependencies.

* Adapt CI Sources that support GitLab - k0nserv

* **BREAKING** Removes the implicit Dangerfile support. - orta

  The implicit support was a feature that would check for an `[org]/danger`
  repo, and automatically parse that Dangerfile. Think it was a bit too magic,
  and the only person who I know is using it, said they think it should have
  been this way from the start. I'm cool with this.

  To handle the replacement, we've added a new object to the DSL.
  This is the `danger` API. It has two responsibilities at the moment,
  downloading a Dangerfile:

  ```ruby
  danger.import_dangerfile = "artsy/danger"
  ```

  and importing local plugins:

  ```ruby
  danger.import_plugin [path_or_url]
  ```

  Which the astute may have remembered used to be the purview of `plugin.import`.
  Which is now removed, in favour of the `danger.import_plugin`. Think there's more
  space for improvement inside the context of `danger` than `plugin`.

  I also removed `plugin.download` - couldn't see a use for it inside a Dangerfile. Happy
  to change that, if it's being used it.

* Rename `DANGER_GITHUB_API_HOST` to `DANGER_GITHUB_API_BASE_URL`. - k0nserv
  Using `DANGER_GITHUB_API_HOST` is still supported to preserve backwards
  comaptibility, but using `DANGER_GITHUB_API_BASE_URL` is encouraged.

## 2.1.6

[Full Changelog](https://github.com/danger/danger/compare/v2.1.5...v2.1.6)

* Crash fix for `danger init` - marcelofabri

## 2.1.5

[Full Changelog](https://github.com/danger/danger/compare/v2.1.4...v2.1.5)

* Lols, more Circle CI stuff, and importantly - more documentation - orta

## 2.1.4

[Full Changelog](https://github.com/danger/danger/compare/v2.1.3...v2.1.4)

* Improve detection of PR content on CircleCI. - jamtur01

## 2.1.3

[Full Changelog](https://github.com/danger/danger/compare/v2.1.2...v2.1.3)

* Improve detection of Buildkite's PR context - cysp
* An attempt at fixing a misalignment with what Danger says is inside the diff range, and what people have seen #160 #316 - orta/yimingtang/jamtur01/segiddins
* Copyedit the README and vision statement - suchow

## 2.1.2

[Full Changelog](https://github.com/danger/danger/compare/v2.1.1...v2.1.2)

* Improvements to `danger init` - orta
* Circle CI validation improvements - orta

## 2.1.1

[Full Changelog](https://github.com/danger/danger/compare/v2.1.0...v2.1.1)

* Adds `danger-junit` to the `danger/danger` repo, requiring changes to the plugin testing systems - orta
* Improves the "is a shared Dangerfile from the Danger Repo" check #366 - orta
* Replaces `redcarpet` through `kramdown` to avoid jruby foo - LeFnord

## 2.1.0

[Full Changelog](https://github.com/danger/danger/compare/v2.0.1...v2.1.0)

* Refactors the CI Source init, and verification section - orta
* Adds a `danger systems ci_docs` command that outputs the CI sources and their docs - orta
* Merges some of the work on splitting the request source done in #299 - orta, who merged k0nserv's work.
* Add `git.diff_for_file("some/file.txt")` to get a Git::Diff::DiffFile - dbgrandi
* Improves the default file resolves for all the `danger plugins` commands, it will now work with a new plugin by default. - orta
* \n now works in HTML tables - marcelofabri
* You can now pass `full_path: false` to `github.html_link("/path/file.txt", full_path: false)` to have it only show the filename. - orta
* `danger plugins readme` shows attributes correctly. - orta

## 2.0.1

[Full Changelog](https://github.com/danger/danger/compare/v2.0.0...v2.0.1)

* Updates the `danger init` template to 2.0 syntax - orta

## 2.0.0

[Full Changelog](https://github.com/danger/danger/compare/v0.10.1...v2.0.0)

* **BREAKING** Removes a lot of top-level attributes in the DSL, moving them into scoped plugins - orta

Full list of changes:

```
# Git Stuff
modified_files -> git.modified_files
added_files -> git.added_files
deleted_files -> git.deleted_files
lines_of_code -> git.lines_of_code
deletions -> git.deletions
insertions -> git.insertions
commits -> git.commits

# GitHub Stuff
pr_title ->  github.pr_title
pr_body -> github.pr_body
pr_author -> github.pr_author
pr_labels -> github.pr_labels
branch_for_base -> github.branch_for_base
branch_for_head -> github.branch_for_head
base_commit -> github.base_commit
head_commit -> github.head_commit
env.request_source.pr_json -> github.pr_json
env.request_source.api -> github.api

# Importing Stuff
import -> plugin.import
```

The main reason for this is that we can support many code review APIs without having to fudge the Dangerfile DSL to make them conform to GitHub standards. This would mean a gitlab user could write `gitlab.mr_author` to access the author once [#229](https://github.com/danger/danger/pull/299) lands.

It also ensures that Danger's plugins are treated like external plugins. This means any work going into improving core plugins (via documentation or automation for example) will improve the upcoming plugin community.

I don't like breaking backwards compatibility. Sorry, for as far as I can see at this point, this is the only one Danger needs.

* add `pr_diff` exposing the unified diff for the PR to the GitHub plugin - champo
* Improvements to the linter and the JSON output for plugin docs - orta
* Add `html_link` to the GitHub plugin - marcelofabri
I don't like breaking backwards comparability. Sorry, for as far as I can see at this point, this is the only one Danger needs.
* add `pr_diff` exposing the unified diff for the PR to the Github plugin - champo
* Improvements to the linter, readme generator and the JSON output for plugin docs - orta

## 0.10.1

[Full Changelog](https://github.com/danger/danger/compare/v0.10.0...v0.10.1)

* Add `danger local --pry`, which drops into a Pry shell after eval-ing the Dangerfile - dbgrandi

## 0.10.0

[Full Changelog](https://github.com/danger/danger/compare/v0.9.1...v0.10.0)

* Improves wording when failing a OSS build - orta
* Add support for org-wide Dangerfile -- KrauseFx
  - To use this, create a repo on your GitHub organization called "danger" (or "Danger")
  - Add a `Dangerfile` to the root of that repo.
  - This new `Dangerfile` is ran after current repo's `Dangerfile`.

  The org `Dangerfile` will have access to all of the same plugins, and metadata.
  For an example, see: https://github.com/Themoji/danger
* Breaking: `import_url` does not append `.rb` to your url anymore. - KrauseFx
* Minor core documentation updates - orta
* `danger plugin lint` now says it's failed when it's failed, not when it succeeds - orta
* Fixes to the markdown support in `warn`, `fail` and `message` - orta
* Add http caching for Github API calls when running `danger local` - dbgrandi

## 0.9.1

[Full Changelog](https://github.com/danger/danger/compare/v0.9.0...v0.9.1)

* Danger no longer relies on the GNU utilities and can run on Windows - henriwatson
* `danger plugins lint` is a linter - orta
* `danger plugins json` will show you the JSON output of your docs - orta

## 0.9.0

[Full Changelog](https://github.com/danger/danger/compare/v0.8.5...v0.9.0)

* `danger plugin` is removed in favor of `danger plugins` - dbgrandi/orta
  - `danger plugin lint` is now `danger plugins lint`
  - `danger plugin readme` is now `danger plugins readme`
* use `claide-plugins` gem to provide plugin management - dbgrandi
  - extends `claide-plugins` gem with list, search, create commands
  - `list` is the default command for `danger plugins`
  - `list` shows all plugins
  - `search` let's you search with a regexp
  - `create` uses https://github.com/danger/danger-plugin-template to bootstrap a new danger plugin
* Warn users not to store GitHub tokens in the repository -- dantoml
* Crash on load fix for `danger plugins readme` -- orta
* Add support for Surf CI (https://github.com/surf-build/surf) -- paulcbetts
* `danger plugins lint` contains more information - orta
* Make link instructions in onboarding OS aware -- K0nserv

## 0.8.5

[Full Changelog](https://github.com/danger/danger/compare/v0.8.4...v0.8.5)

* Converts the message link to be http://danger.systems - orta
* Fix `danger lib lint` with no params not finding the plugin paths - orta
* Converts `""` usage to `''` where possible -- dantoml
* More documentation params are exposed to the linter - orta
* Documentation audit - orta
* Use proper commits for calculating diff.
* Update environment variables used by Buildkite - bentrengrove

## 0.8.4

[Full Changelog](https://github.com/danger/danger/compare/v0.8.3...v0.8.4)

* Initial work on `danger plugin lint` command - orta
* `danger plugin lint` can run with either:
  - a list of file paths
  - a list of gems
  - no arguments, which will parse `lib/**/**/*` to lint your local plugins
* Moved new plugin to `danger plugin new` - orta
* Added `api` to the DSL, which is a shortcut to the active `Octokit::Client` - orta
* Renamed `branch_for_merge` to `branch_for_base` and also added `branch_for_head` - orta
* Initial work on namespacing existing plugins - orta
* Notify the user to add the new GitHub account as collaborator to Close Source project
* Fixes a problem running `danger local` due to a missing dependency on yard - ashfurrow
* Improvements for CircleCI CI detection - orta

## 0.8.3

[Full Changelog](https://github.com/danger/danger/compare/v0.8.2...v0.8.3)

* Fix updating of the commit status after danger check. - justMaku
* Relies on the current git HEAD, instead of pulling a merge branch from GitHub - justMaku
* Use Cork for console output. - DanToml
* Print a list of results, instead of a table. - DanToml

## 0.8.2

[Full Changelog](https://github.com/danger/danger/compare/v0.8.1...v0.8.2)

* Support multiple Danger instances with `--dangerId` - marcelofabri
* Add base request source so services other than GitHub could be used with Danger. - justMaku
* Don't validate CI sources that don't expose all required environment variables.  - justMaku
* Add support for TeamCity CI - rbuussyghin

## 0.8.1

[Full Changelog](https://github.com/danger/danger/compare/v0.8.0...v0.8.1)

* Fix Ruby 2.0 support - segiddins

## 0.8.0

[Full Changelog](https://github.com/danger/danger/compare/v0.7.4...v0.8.0)

* Considerable under-the-hood changes around the DSL, shouldn't affect end-user Dangerfiles though - orta
* Fix for `danger local` crash due to ^ - dbgrandi
* Add support for Drone CI - gabro
* [BREAKING] Add initial support for more expressive and documented plugins. Breaks all existing plugins. - dbgrandi/orta
* All core DSL attributes are handled via Danger Plugins - orta
* Initial work on the Plugin -> JSON mapper - orta
* Add support for Semaphore CI - starsirius
* Add Ruby 2.3 support - segiddins
* Allow Dangerfile path to be configured - gabro

## 0.7.4

[Full Changelog](https://github.com/danger/danger/compare/v0.7.3...v0.7.4)

* Adds the ability to specify a PR number in `danger local` - orta
* Ensures local branches are set up with  `danger local` - orta
* Add `commits` for the Git SCM source - segiddins

## 0.7.3

[Full Changelog](https://github.com/danger/danger/compare/0b0e428...v0.7.3)

* Minor `danger init` typo fixes - orta + danger
* Added support for CLAide-based plugins - segiddins

## 0.7.2

[Full Changelog](https://github.com/danger/danger/compare/917113d...0b0e428)

* Auto follow of remote plugin URL redirects - KrauseFx
* Adding XcodeServer provider - antondomashnev

## 0.7.1

[Full Changelog](https://github.com/danger/danger/compare/3a6a212...917113d)

* Hotfix: import of plugins didn't work depending on alphabetical order - KrauseFx

## 0.7.0

[Full Changelog](https://github.com/danger/danger/compare/bf4cfea...3a6a212)

* Added support for local plugins - KrauseFx
* Added support for remote plugins - KrauseFx
* Added new `danger new_plugin` command to create plugins in the fastlane - KrauseFx
* Added printing of table summaries after running danger - KrauseFx
* Refactored all plugins to be classes instead of methods - KrauseFx
* Added auto-import of local plugins - KrauseFx
* Resolved issues are now crossed out by Danger - marcelofabri
* Added new `markdown` command to Danger DSL - KrauseFx
* Added new `modified_files.include?("rakelib/*_stats.rake")` file globbing support - KrauseFx

## 0.6.5

[Full Changelog](https://github.com/danger/danger/compare/be16fdb...bf4cfea)

* Enterprise GitHub support - dbgrandi
* Use branches for comparison, not commits - orta
* Breaking: DSL change `files_*` to `*_files` for readability - jeroenvisser101

## 0.6.0

[Full Changelog](https://github.com/danger/danger/compare/v0.5.2...be16fdb)

* Added internal plugin system - KrauseFx
* Refactored unit tests - KrauseFx
* Fixed issue when PR Title or PR body is nil - KrauseFx
* Added support for `git://`-prefixed url as remote - jeroenvisser101
* Added comment based violation suppression - marcelofabri

## 0.5.2

[Full Changelog](https://github.com/danger/danger/compare/v0.5.1...v0.5.2)

* Typo fixes for `danger init` - lumaxis

## 0.5.1

[Full Changelog](https://github.com/danger/danger/compare/v0.5.0...v0.5.1)

* Fixes for `danger init` - krausefx

## 0.5.0

[Full Changelog](https://github.com/danger/danger/compare/v0.3.0...v0.5.0)

* New: Converted `danger init` into a wizard for setting up Danger, walking you though tokens/ci - orta
* Breaking: `files_removed` to `files_deleted` ( to be more consistent with git's terminology. ) - orta
* Revised underlying git tooling for generating file/diff metadata - orta
* re-revise underlying git tooling to not use something based on libgit2 - orta
* Set CHANGELOG merge strategy to union - marcelofabri
* Remove `nap` dependency - marcelofabri
* Show command summary in help - marcelofabri
* Use 100% width tables for messages - marcelofabri

## 0.3.0

[Full Changelog](https://github.com/danger/danger/compare/v0.2.1...v0.3.0)

* Adding Jenkins provider - marcelofabri
* Add a `danger local` command to test your current Dangerfile against the last PR merged on the repo - orta
* Calling CircleCI API when `CI_PULL_REQUEST` is not set - marcelofabri
* Look inside PR JSON for the commit range (instead of getting from CI providers) - marcelofabri
* Adds `pr_labels` to DSL - marcelofabri
* Makes the CircleCI provider validate, but not run on non-PR builds - orta
* Take the git before...after references out of ENV vars from CI providers - orta
* Fixes CircleCI when dealing with URLs like `https://github.com/artsy/eigen/compare/b0f6a2a9ff6f%5E...316b694875c8` - orta
* Ensure all comments are downloaded, previously it was capped at 30 - orta
* Attach commit metadata to the message invisibly - orta
* On danger/danger we now fail if there's no changelog entry - orta
* Moved to an org [feb 9]
* Adds support for Circle CI on danger/danger

## 0.2.1

[Full Changelog](https://github.com/danger/danger/compare/v0.2.0...v0.2.1)

* Edits an existing ticket rather than making a new one - orta

## 0.2

[Full Changelog](https://github.com/danger/danger/compare/v0.1.1...v0.2.0)

* Support making comments on a GitHub PR - Felix
* Use GitHub status API to provide extra info on a PR - Felix
* DRY the HTML comment - orta
* Don't show a message if there are not warnings/errors - orta

## 0.1

[Full Changelog](https://github.com/danger/danger/compare/4aaf47f...v0.1.1)

* Parses a `Dangerfile` - orta
* Gets GitHub details from Travis & CircleCI - orta
* Gets PR details from GitHub - orta
* Gets Git details from local Git - orta
* Fails when you say it's failed in  the  Dangerfile - orta
