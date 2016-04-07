# git

1. Discard all unstaged files from git
    ```bash
    git clean -df
    git checkout -- .

    ```
2. Log all the commits
    ```bash
    git log --pretty=format:"%h %s" --graph

    ```

3. Git status
    ```bash
    git status

    ```

4. Add all changed files to staging area
    ```bash
    git add .

    ```

5. Commit 
    ```bash
    git commit -m "commit msg here"

    ```

6. List all remotes
    ```bash
    git remote -v

    ```

7. List all existing branches
    ```bash
    git branch -av

    ```

8. Add remote repo to a git
    ```bash
    git remote add <shortname_of_remote> <remote_url>

    ```

9. Git Push
    ```bash
    git push <shortname_of_remote> <branch>

    ```

10. Git Pull
    ```bash
    git pull <shortname_of_remote> <branch>

    ```

11. Delete a local branch
    ```bash
    git branch -d the_local_branch

    ```

12. Delete a remote branch
    ```bash
    git push origin :the_remote_branch

    ```

13. Duplicate a branch
    ```bash
    git checkout -b new_branch old_branch

    ```

14. Associate Atom Text Editor with your git
    ```bash
    git config --global core.editor "atom --wait"

    ```

15. GUI Git Tool
    ```bash
    gitk --all &

    ```

16. Rewriting History
    ```bash
    git rebase -i <branch/commit_id>

    ```

17. Reset merge changes
    ```bash
    git reset --merge ORIG_HEAD

    ```


License
=======

    Copyright 2016 Nishant Srivastava

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

