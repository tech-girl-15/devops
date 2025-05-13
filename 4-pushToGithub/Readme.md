
PS : https://chatgpt.com/share/68231de1-b374-8012-b526-48fd0e8b23c7

# GitHub SSH Authentication Setup Guide

This guide provides step-by-step instructions for setting up Git repositories with SSH authentication for GitHub. Using SSH keys allows you to connect to GitHub without supplying your username and password each time.

## Initial Repository Setup

```bash
# Initialize a new Git repository
git init
touch app.py
git add .
git commit -m "Initial commit"
```

## Generate and Configure SSH Keys

```bash
# Generate a new SSH key pair (Ed25519 algorithm recommended)
ssh-keygen -t ed25519 -C "your.email@example.com"

# press Enter twice for no passphrase
# Start the SSH agent in the background(optional)
eval "$(ssh-agent -s)"

# Add your SSH private key to the SSH agent(Optional)
ssh-add ~/.ssh/id_ed25519

# Display your public key (copy this output)
cat ~/.ssh/id_ed25519.pub
```

## Add SSH Key to GitHub

1. Copy the output from the `cat ~/.ssh/id_ed25519.pub` command
2. Go to GitHub: https://github.com/settings/keys
3. Click "New SSH key"
4. Give your key a descriptive title (e.g., "Work Laptop")
5. Paste your public key in the "Key" field
6. Click "Add SSH key"

## Configure Repository with SSH Remote

### For a New Repository:

```bash
# Create a repository on GitHub first, then:
git remote add origin git@github.com:USERNAME/REPOSITORY-NAME.git
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
# Test your SSH connection to GitHub
ssh -T git@github.com
```

You should see a message like: "Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access."

## Troubleshooting

### Alternative SSH Config for Multiple Accounts

If you have multiple GitHub accounts, you can set up custom hosts in your SSH config:

1. Edit your SSH config file:
   ```bash
   nano ~/.ssh/config
   ```

2. Add a custom host entry:
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

3. Use the custom host in your remote URL:
   ```bash
   git remote add origin git@github-personal:USERNAME/REPOSITORY-NAME.git
   ```

### Permission Denied Issues

If you see "Permission denied" errors:

1. Ensure your SSH key is added to the SSH agent:
   ```bash
   ssh-add -l
   ```

2. Verify your public key is correctly added to your GitHub account

3. Check key permissions:
   ```bash
   chmod 600 ~/.ssh/id_ed25519
   chmod 644 ~/.ssh/id_ed25519.pub
   ```

## Common Git Commands

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