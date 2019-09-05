# gitlab-release-notes
GitLab Changelog Generator with release notes

---

GitLab release notes are stored in the database, not in the Git repo while the message is stored in the Git repo.

The only way you could get release notes would be to use the [GitLab API - Releases API](https://docs.gitlab.com/ee/api/releases/#get-a-release-by-a-tag-name).

## Prerequisites

In order to use the API you have to [create a personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token).

## Modify script

In the script is a `SETUP` section where you have to modify the gitlab url:

```bash

#####################################
# Setup                             #
#####################################

$repoURL = 'https://gitlab.example.com'

```

## Run the script

The following command is generating a changelog.txt file for your project with the `ID 13`.

*PowerShell Script*
```console
.\generateChangelog.ps1 -token 'mySecretToken' -projectID '13' > changelog.txt
```

*Batch Script*
```console
generateChangelog.bat 'mySecretToken' '13' > changelog.txt
```