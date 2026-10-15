# GitHub setup — Windows + VS Code

1. Install Git for Windows (https://git-scm.com/downloads/win), then restart VS Code. In terminal: `git --version`.
2. Confirm VS Code opened `D:\Road-Damage-Detection` — the existing T03 project, not a new copy.
3. Extract this ZIP into a **separate scratch folder first**. Copy the files into the existing project. Back up files with the same names; do not blindly overwrite existing notebooks/configs.
4. Check `.gitignore` exists in the project root; examine `git status --short`. Verify `data/raw` and `.venv` are ignored with `git check-ignore -v data/raw/example.jpg .venv/pyvenv.cfg`.
5. Run `git config --global user.name "..."` and `git config --global user.email "..."` (use GitHub no-reply email if preferred).
6. If `git status` says not a repository, run `git init -b main` in the project root. Do not initialize another repository inside `notebooks/`.
7. Before staging, remove huge notebook outputs and inspect for secrets. Run `git add .` then `git diff --cached --stat`; if dataset/weights are staged, unstage and fix `.gitignore` BEFORE committing.
8. `git commit -m "chore: initialize RDD2022 research repository"`.
9. GitHub website → New repository → name `road-damage-detection-rdd2022`, choose **Private** initially, and leave README / .gitignore / license unchecked (already present locally).
10. `git remote add origin <URL-COPIED-FROM-GITHUB>`; `git push -u origin main`. Sign in using browser/Git Credential Manager if prompted; do not type account passwords into remote URLs.
11. On GitHub: Issues → create T03 issue; Profile → Projects → New project → Board; statuses Todo, In Progress, Review, Done. Move T03 to In Progress.
12. Optional later: Install GitHub CLI from https://cli.github.com, run `gh auth login`, then use `scripts/seed_github_issues.ps1` in preview mode; `-Create` will actually open missing GitHub issues.

GitHub is not cloud data storage for the raw RDD2022 images or `.pt` weights. Use data provenance, small manifests and code, with locally/external stored runs.
