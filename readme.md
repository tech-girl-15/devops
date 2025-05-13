steps to connect to GitHub using SSH:

# Connect to GitHub with SSH

This guide will walk you through the process of setting up SSH to securely connect to GitHub and clone/push repositories.

## Prerequisites

- Git installed on your machine.
- A GitHub account.

## Steps

### 1. **Generate an SSH Key**

If you don't have an SSH key yet, you'll need to generate one.

Open your terminal and run the following command:

```bash
ssh-keygen -t rsa -b 4096 -C "shraddhathorbole15@gmail.com"


* This will create a new SSH key associated with your GitHub email (`shraddhathorbole15@gmail.com`).
* You can press Enter to accept the default location to save the key (`~/.ssh/id_rsa`).
* Optionally, you can enter a passphrase for additional security or press Enter to skip.

### 2. **Start the SSH Agent**

To load the SSH key automatically, start the SSH agent in the background by running:

```bash
eval "$(ssh-agent -s)"
```

### 3. **Add the SSH Key to the SSH Agent**

Next, add your SSH private key to the agent:

```bash
ssh-add ~/.ssh/id_rsa
```

Make sure to replace `~/.ssh/id_rsa` with the correct path if your key is stored in a different location.

### 4. **Add Your SSH Key to GitHub**

* First, copy your SSH public key to the clipboard. You can display the key with:

  ```bash
  cat ~/.ssh/id_rsa.pub
  ```

* Copy the output of the command.

* Now, go to GitHub and follow these steps:

  1. In the upper-right corner of any page, click your profile photo, then click **Settings**.
  2. In the left sidebar, click **SSH and GPG keys**.
  3. Click **New SSH key**.
  4. Paste your SSH key into the "Key" field.
  5. Give it a title (e.g., "My Laptop SSH Key").
  6. Click **Add SSH Key**.

### 5. **Test the SSH Connection**

To make sure everything is working properly, test the connection with the following command:

```bash
ssh -T git@github.com
```

You will be asked if you want to continue connecting (type `yes`). If everything is set up correctly, you should see the following message:

```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```
