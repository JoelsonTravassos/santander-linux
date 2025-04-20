## Git dally use commands

- `git init`: It initialize a new git repository in a local directory.
- `git clone url`: It clones a remote repository to your local pc.
- `git add .`: Add all files to the staging area to commit.
- `git add <file_name>`: Add a specific file to the staging area.
- `git commit -m "Adding some feature"`: It same the modifications and add a clear and concise description to them.
- `git push origin branchName`: Saves all your progress at the remote repository.
- `git pull`: Update your local repository with the modifications on the remote one.
- `rm -rf .git`: If you create a git repository in a wrong directory, this command will delete it recursively and forcibly (-rf).
- `git restore <file_name>`: It restores your file to the last state (Use it carefully, you may lost all your progress).
- `git log`: Use it to see your commits history.
- `git reflog`: It is a more detailed "git log" command.
- `git commit --amend -m "newMassageForYourLastCommit"`: It changes the last commit message.
- `git reset --soft commitHash`: It undo commit but keep everything staged
- `git reset --mixed commitHash`: It undo commit and unstage changes
- `git reset --hard commitHash`: it discard all changes and commits
- `git reset <file_name>`: Removes the file from the staging area (index), but keeps the changes in your working directory.
- `git restore <file_name>`: Reverts the file in your working directory to match the HEAD (last commit).

## Working with branches
- `git checkout -b branchName`: It creates a new branch called branchName and switched to it.
- `git checkout main`: It goes back (switched) to the main branch. | You can also use the same command to go back to the branchName, once it already exists (`git checkout branchName`).
- `git merge branchName`: It will merge both branches, branchName into main.
- `git branch -d branchName`: It will delete the branch branchName.

### Solving conflicts

`git pull` is essentially the same as running `git fetch` to download the latest changes, followed by `git merge` to integrate them into your current branch.

- `git fetch`: It downloads the latest changes, but don´t merge them.
- `git diff main origin/main`: It shows you the difference between the local main (main) and the remote main (origin/main)
- `git merge origin/main`: After using the `git fetch`command, if you want, you can merge integrate them into your local branch.

## Git config exemples

- `git config --global user.name "yourName"`
- `git config --global user.email "your@email.com"`