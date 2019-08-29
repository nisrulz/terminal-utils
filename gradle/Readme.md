# Gradle

### Aliases

How to setup these aliases
- Copy-Paste these alias inside your `.bashrc` or `.zshrc`
- Save.
- Goto terminal and execute `source ~/.bashrc` or `source ~/.zshrc`.
- Done, now simply call the alias to execute the command as defined.

```bash

# ------------------ Gradle ---------------- #
alias gradleCacheSize='du -sh ~/.gradle'
alias gradleCleanCache='find ~/.gradle -type f -atime +30 -delete && find ~/.gradle -type d -mindepth 1 -empty -delete'

# Upgrade the gradle wrapper to new version
# Use as: upgradeGradleWrapper VERSION_NAME
#      - where VERSION_NAME is like 5.6.1
function upgradeGradleWrapper(){
  ./gradlew wrapper --gradle-version $1 --distribution-type all;
}
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

