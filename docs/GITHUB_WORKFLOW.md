# GitHub daily workflow

## First time (only after validating `.gitignore`)

```powershell
git --version
git config --global user.name "Your Git display name"
git config --global user.email "YOUR_GITHUB_EMAIL_OR_NOREPLY"
git init -b main
git status --short
git check-ignore -v data/raw/road.jpg .venv/pyvenv.cfg runs/demo/best.pt
git add .
git diff --cached --stat
git commit -m "chore: initialize RDD2022 research repository"
```

Then create an **empty** GitHub repository using the website (without adding another README/.gitignore/license), and use its exact HTTPS URL:

```powershell
git remote add origin https://github.com/YOUR_ACCOUNT/road-damage-detection-rdd2022.git
git push -u origin main
```

If this folder is already a Git repo, **do not** run `git init` or add another `origin`; instead inspect `git status` and `git remote -v`. You may also use VS Code **Publish to GitHub** rather than manually creating remote; don't do both.

## Each task

1. In GitHub Issues: create/use `T##` issue, assign owner, checklist and proof of done.
2. Update local `main`: `git switch main; git pull --ff-only`.
3. Create branch: `git switch -c feat/t03-rdd-audit` (example).
4. Implement, execute offline local tests, clear notebook outputs and review `git diff`.
5. Stage only intended files (`git add notebooks/... docs/...`), then `git diff --cached --stat`.
6. Commit: `git commit -m "feat(t03): implement RDD2022 inventory audit"`.
7. Push: `git push -u origin feat/t03-rdd-audit`.
8. GitHub → Compare & pull request → link `Closes #<issue-number>` if fully done, request review → merge.
9. Update Board status and record evidence, e.g. `reports/t03...` small summaries or screenshot in Issue, large files externally.

### Commit message patterns

- `docs(t01): add paper protocol gaps`
- `feat(t03): add XML annotation audit`
- `fix(t03): correct country inference`
- `exp(b0): record yolov8s seed42 validation`
- `report(p5): add final figure captions`

Never push whole `data/raw`, `runs`, `*.pt`, API tokens or personally identifying data. A Jupyter notebook may contain outputs/paths/secrets inside its JSON; clear outputs and inspect before commit.

### Team roles

Have one integration owner, module/implementation owner and experiment/QA owner (roles may rotate). One branch and PR per task, avoid editing the same `.ipynb` simultaneously. On a shared workstation, save checkpoints and datasets outside Git.
