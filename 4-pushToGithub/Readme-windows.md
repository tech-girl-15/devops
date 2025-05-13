# GitHub SSH Authentication Setup Guide for Windows

This guide provides step-by-step instructions for setting up Git repositories with SSH authentication for GitHub on Windows systems.

## Prerequisites

1. Install Git for Windows from [git-scm.com](https://git-scm.com/download/win)
2. Have a GitHub account ready

## Initial Repository Setup

```powershell
# Open Git Bash or PowerShell

# Navigate to your project folder (create one if needed)
# Example with PowerShell:
mkdir my-project
cd my-project

# Initialize a new Git repository
git init

# Create any initial project files 
touch app.py  # Git Bash

# Add all files to staging
git add .

# Make the initial commit
git commit -m "Initial commit"
```

## Generate and Configure SSH Keys on Windows

### Using Git Bash (Recommended)

```bash
# Open Git Bash

# Generate a new SSH key pair (Ed25519 algorithm recommended)
ssh-keygen -t ed25519 -C "vinaybasargekar@gmail.com"

# When prompted, press Enter to accept the default file location
# (C:\Users\YOUR_USERNAME\.ssh\id_ed25519)

# press Enter twice for no passphrase

# Display your public key (copy this output)
cat ~/.ssh/id_ed25519.pub
```

## Add SSH Key to GitHub

1. Copy the output from the `cat ~/.ssh/id_ed25519.pub` or `Get-Content` command
2. Go to GitHub: https://github.com/settings/keys
3. Click "New SSH key"
4. Give your key a descriptive title (e.g., "Windows Laptop")
5. Paste your public key in the "Key" field
6. Click "Add SSH key"

## Configure Repository with SSH Remote

### For a New Repository:

```bash
# Create a repository on GitHub first, then:
git remote add origin git@github.com:USERNAME/REPOSITORY-NAME.git
git branch -M main  # Ensure your default branch is named "main"
git push -u origin main
```

### For Existing Repository with HTTPS:

```bash
# Check current remote URL
git remote -v

# Remove the existing HTTPS remote
git remote remove origin

# Add the new SSH remote URL
git remote add origin git@github.com:USERNAME/REPOSITORY-NAME.git

# Push to the repository using SSH
git push -u origin main
```

### Verify SSH Connection

```bash
# Test your SSH connection to GitHub (run in Git Bash or PowerShell)
ssh -T git@github.com
```

You should see a message like: "Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access."

## Windows-Specific Troubleshooting

### SSH Agent Issues

If you encounter issues with the SSH agent:

```powershell
# Check if SSH agent is running (PowerShell)
Get-Service ssh-agent

# Start SSH agent if not running
Start-Service ssh-agent
```

### Path Issues

If Git can't find your SSH key:

1. Make sure your key is in `C:\Users\YOUR_USERNAME\.ssh\`
2. Use absolute paths when adding keys:
   ```
   ssh-add C:\Users\YOUR_USERNAME\.ssh\id_ed25519
   ```

### Permission Issues

If you see "Permission denied" errors:

1. Check key permissions in Git Bash:
   ```bash
   ls -la ~/.ssh/
   ```

2. Adjust permissions if needed:
   ```bash
   chmod 600 ~/.ssh/id_ed25519
   chmod 644 ~/.ssh/id_ed25519.pub
   ```

### Multiple GitHub Accounts

If you have multiple GitHub accounts, create or edit `C:\Users\YOUR_USERNAME\.ssh\config`:

```
Host github-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal

Host github-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_work
```

Then use:
```
git remote add origin git@github-personal:USERNAME/REPOSITORY-NAME.git
```

## GUI Alternative: Using GitHub Desktop

If you prefer a GUI approach:

1. Download and install [GitHub Desktop](https://desktop.github.com/)
2. Sign in to your GitHub account
3. GitHub Desktop will automatically generate and configure SSH keys
4. Use the interface to clone, commit, and push repositories

## Common Git Commands on Windows

```bash
# Check status of your repository
git status

# Create and switch to a new branch
git checkout -b feature-branch

# Pull latest changes
git pull origin main

# Push changes to your branch
git push origin feature-branch
```

Happy coding!