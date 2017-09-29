### Are you stuck and not ready for the next step?

Actually, no problem! You can just skip up to the starting point of whatever we're working on right now.

For example, if you get stuck on "Step 04 - xxxx", you can just move to the `04-solution` branch and keep working along with us on the next step (all explained below).

### How to switch to a step?

First, find out which step you want to switch to. Then, run the following command, replacing `04` with the name of the branch from the step before. NOTE: this will move any work you've done to a separate branch and move you to **our** version of the fresh branch.

The first commands save all your work and preserve it, and the second command actually switches you to the new starting point.

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 04"
git branch 04-wip

# get back on track
git reset --hard 04-solution
```
