# OpenGitOps Documents

<!-- markdownlint-disable MD033 -->
<p><img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/opengitops/icon/color/opengitops-icon-color.svg" alt="OpenGitOps logo icon color" width="150" valign="middle">
<img src="https://openmoji.org/data/color/svg/1F4D1.svg" alt="Bookmark Tabs emoji Unicode 1F4D1. OpenMoji CC BY-SA 4.0" width="150" valign="middle"></p>

This repository holds lasting documents for the OpenGitOps project, which should be versioned and [released](https://github.com/open-gitops/documents/releases) together.
The `main` branch is a work in progress, including:

- [GitOps Principles](./PRINCIPLES.md)
- [GitOps Glossary](./GLOSSARY.md)

See the [releases](https://github.com/open-gitops/documents/releases) page for published versions.
Note the difference between pre-releases and full releases, defined by the [Semantic Versioning](https://semver.org/) scheme followed by this repo.
See [open milestones](https://github.com/open-gitops/documents/milestones) for planned future releases.

Please find translations of the principles as well as the glossary in the [i18n](./i18n/) folder.

## About OpenGitOps

For more information about the OpenGitOps project, see: <https://github.com/open-gitops/project>

## Code of Conduct

The OpenGitOps community follows the [CNCF Code of Conduct](https://github.com/open-gitops/.github/blob/main/CODE_OF_CONDUCT.md).

## Reference this Content

Below is a [BibTex](https://www.bibtex.org) code snippet to use as reference for the content available in this repository. There is one required change, and several optional adjustments you may make to the snippet.

Required:
- at minimum you will need to change the `Accessed` date (when you accessed this material) in the [note](https://www.bibtex.com/f/note-field/) field.

Optional: You may choose to reference a different release version. If so:
- Change the `Release version` in the [note](https://www.bibtex.com/f/note-field/) field.
- Update the [year](https://www.bibtex.com/f/year-field/) field to match. See list of releases by date [here](https://github.com/open-gitops/documents/releases).
- Update the file link in `Authors` in the [note](https://www.bibtex.com/f/note-field/) field. You may find the list of authors by your chosen release version in the [reference](https://github.com/open-gitops/documents/blob/main/reference/) directory in this Git repo.

Optional: You may reference multiple versions in the same article. If so:
- Update the [CiteKey](https://www.bibtex.com/g/bibtex-format/#citekey) below ("GitOps-Principles-and-Glossary") so each is unique (for example, append the version "-v1.0.0").
- ⚠️ Note that the GitOps Principles and Glossary are versioned together, so when citing an individual principle and glossary item, ensure the versions match. This is because the two files have hyperlinks from one to the other that may be incorrect or broken between different versions.

```
@misc{GitOps-Principles-and-Glossary,
  title        = {{GitOps Principles and Glossary}},
  howpublished = {\url{https://github.com/open-gitops/documents}},
  note         = {Accessed: YYYY-MM-DD. Release version: 1.0.0. Authors: \url{https://github.com/open-gitops/documents/blob/main/reference/authors-v1.0.0.md}.},
  year         = {2021}
```
}
```