# Road Damage Detection — RDD2022 (Research Track C)

**Goal:** Selective implementation of modules inspired by YOLO-ERCD / YOLO-DGVG, controlled YOLOv8s/YOLOv10s baselines, then one proposed method with ablations and reproducible evaluation.

**Status:** `P0 — T03 Dataset Audit` (not yet verified on user's real RDD2022 files).

## Research principles

- YOLO-ERCD / YOLO-DGVG are **related work**. If the authors' original code and splits are not verified, call custom implementations **paper-based reimplementations**, not exact reproductions.
- Reported paper mAP on different RDD2022 splits (full multinational vs China subset) must **not** be directly ranked.
- Shared labeled RDD2022 split (created at T04) is frozen for all in-house benchmarks. Official unlabeled test is not mAP test.
- Test set is not for model selection. Save dataset manifests, code commit, configuration, seed and metric details for every run.
- No raw images, original labels, giant weights or secrets in GitHub. Data is referenced externally.

## Quick navigation

- [`docs/TASKLIST.md`](docs/TASKLIST.md) — phases P0–P5 and T01–T27
- [`docs/EXPERIMENT_PROTOCOL.md`](docs/EXPERIMENT_PROTOCOL.md) — comparison rules
- [`docs/GITHUB_WORKFLOW.md`](docs/GITHUB_WORKFLOW.md) — day-to-day Git/PR process
- [`docs/DATASET.md`](docs/DATASET.md) — where to obtain RDD2022
- [`docs/DECISIONS.md`](docs/DECISIONS.md) — important research decisions
- [`docs/experiments.csv`](docs/experiments.csv) — small run register

## Setup

Recommended Windows workspace: `D:\Road-Damage-Detection`. The environment `.venv` is local and ignored by Git.

```powershell
py -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements-audit.txt
.\.venv\Scripts\python.exe scripts/check_repo.py
```

Existing T03 notebook can be stored in `notebooks/T03_RDD2022_Dataset_Audit_Windows.ipynb` without dataset images or sensitive outputs. Set its `DATA_ROOT` to local `data/raw`.

## Project structure

```text
Road-Damage-Detection/
  .github/              # issue template + CI
  configs/              # model / train / data templates
  data/
    raw/                # ignored - downloaded RDD2022
    processed/          # ignored - prepared labels/splits
    manifests/          # tracked small CSV/TXT split manifests
  docs/                 # tasklist, decisions, experiment registry
  notebooks/            # notebooks with outputs cleared
  scripts/              # audits, training helpers, validation
  models/               # small architecture YAML tracked, weights ignored
  reports/figures/      # only reviewed small figures tracked
  runs/                 # ignored - experiment outputs
  requirements-audit.txt
```

This starter kit does not train any model, does not download the dataset, and does not create a GitHub repository automatically.
