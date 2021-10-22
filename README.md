# release-note-generator



Based on Git history (using Angular commit message syntax), this pure shell tool is used to generate a release note in a MarkDown format.



## Installation

Put the release-note.sh inside your git repository and give it some executable rights (e.g. sudo chmod +x release-note.sh).



## Usage

### Help

```bash
./release-note.sh -h
```



### Release note between last tag and HEAD

```bash
    ./release-note.sh
```



### Release note between two tags

```bash
    ./release-note.sh -f <from tag> -t <to tag> #e.g. ./release-note.sh -f 1.0.0 -t 2.0.0
```



## Result example

```
# Release Note

## From 1.0.0 to 2.0.0

### Bug Fixes
db9b8a82e - fix: this is a commit for fixing a bug 2 (Benjamin Dumont)
369eefa9e - fix: this is a commit for fixing a bug 1 (Benjamin Dumont)

### Features
8a8dbca86 - this is a commit for a feature (Benjamin Dumont)

### Configuration
1428e0136 - chore: generate changelog (Benjamin Dumont)

### Continuous Integration
3bf9378a2 - ci: build configuration (Benjamin Dumont)


```



## List of keywords used to generate the Release Note

- fix:
- feat:
- chore:
- docs:
- style:
- refactor:
- perf:
- test:
- ci:



## Limitations

Using scope like the following code will not work.

```
feat(lang): add polish language
```

If you need this feature, let me know :)
