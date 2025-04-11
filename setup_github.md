# GitHub Setup Documentation

This document outlines the steps taken to initialize the Git repository for this Django project and push it to GitHub.

## Initial Git Setup

1. Created a `.gitignore` file with Django-specific exclusions:

   ```bash
   # Created .gitignore with Django, Python, venv, and OS-specific exclusions
   ```

2. Initialized a Git repository:

   ```bash
   git init
   ```

3. Renamed the default branch to 'main':

   ```bash
   git branch -m main
   ```

4. Added the project files to the staging area:

   ```bash
   git add .
   ```

5. Made the initial commit:
   ```bash
   git commit -m "Initial commit - Django project setup"
   ```

## Setting Up GitHub Remote

1. Created a new GitHub repository at `https://github.com/bemaintainSa/django_project`

2. Added the GitHub repository as a remote:

   ```bash
   git remote add origin https://github.com/bemaintainSa/django_project.git
   ```

3. Attempted to push but encountered authentication issues due to Git being configured with a different GitHub account.

## Resolving Authentication Issues

1. Updated Git configuration to use the correct email address:

   ```bash
   git config user.name "bemaintainSa"
   git config user.email "bemaintainSa24@gmail.com"
   ```

2. Created a new SSH key specifically for the bemaintainSa GitHub account:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "bemaintainSa24@gmail.com" -f ~/.ssh/id_rsa_bemaintainsa
   ```

3. Added the new SSH key to the SSH agent:

   ```bash
   ssh-add ~/.ssh/id_rsa_bemaintainsa
   ```

4. Added the public SSH key to the bemaintainSa GitHub account:

   - Copied the contents of `~/.ssh/id_rsa_bemaintainsa.pub`
   - Added it to GitHub: Settings → SSH and GPG keys → New SSH key

5. Created SSH config file to use the new key for GitHub:

   ```
   # ~/.ssh/config
   Host github.com
     HostName github.com
     User git
     IdentityFile ~/.ssh/id_rsa_bemaintainsa
     IdentitiesOnly yes
   ```

6. Changed the remote URL to use SSH:
   ```bash
   git remote set-url origin git@github.com:bemaintainSa/django_project.git
   ```

## Pushing to GitHub

1. Successfully pushed the repository to GitHub using the explicit SSH key:

   ```bash
   GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_bemaintainsa" git push -u origin main
   ```

2. Verified the successful push and tracking relationship:
   ```bash
   git branch -vv
   # Output: * main e5ad654 [origin/main] Initial commit - Django project setup
   ```

## For Future Git Operations

If needed, you can explicitly specify the SSH key to use:

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_bemaintainsa" git push
```

Or set it for the entire session:

```bash
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_bemaintainsa"
```
