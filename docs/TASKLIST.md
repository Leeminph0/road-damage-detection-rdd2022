# Research Track C — 27-task roadmap

**Status source of truth:** GitHub Issues + Project Board. `docs/tasks.csv` is the initial task definition list. Do not mark a task complete just because code executed.

| Phase | Task | Work item | Deliverable |
|---|---|---|---|
| P0 | T01 | Paper comparison and protocol audit | 2 papers + hyperparam matrix, limitations |
| P0 | T02 | Verify public code, pretrained weights and provenance | Code audit with author links / missing details |
| P0 | T03 | RDD2022 image and annotation inventory audit | dataset_inventory.csv, class & country report, invalid annotations, samples |
| P0 | T04 | Create frozen leakage-audited labeled split | Train/val/test manifest, duplicates/groups, checksums |
| P0 | T05 | EDA of class, bbox and country distributions | EDA figures, imbalance diagnostics, YAML label mapping |
| P0 | T06 | Lock runtime, deps and configuration | Environment lock, GPUs, seeds, reproducibility plan |
| P1 | T07 | Train YOLOv8s reference baseline | Baseline logs, validation metrics, checkpoint reference |
| P1 | T08 | Train YOLOv10s reference baseline | Baseline logs, validation metrics, checkpoint reference |
| P1 | T09 | Error analysis of the two baselines | Per-class AP, false positive/negative audit |
| P2 | T10 | Implement R-CBAM module | Module source, unit/forward tests |
| P2 | T11 | Selective YOLOv10s plus R-CBAM run | Model config and validation results |
| P2 | T12 | Implement GSConv and VoVGSCSP neck | Module source, shape/gradient checks |
| P2 | T13 | Selective YOLOv8s lightweight neck run | Model config and validation results |
| P2 | T14 | Compare selected modules and choose proposed backbone | Per-class + efficiency table |
| P3 | T15 | Define proposed ORA hypothesis and success criteria | Design note, comparison questions |
| P3 | T16 | Implement orientation-aware attention module | Module code and unit tests |
| P3 | T17 | Integrate proposed module into YOLOv8s | YAML/model config, forward + train smoke test |
| P3 | T18 | Combine proposed attention with lightweight neck | Candidate model code and config |
| P3 | T19 | Pilot, profiling and select valid candidates | Pilot logs, VRAM/time, validation results |
| P4 | T20 | Run controlled full ablation matrix | A0–A7 shared-protocol summary |
| P4 | T21 | Analyze AP/latency trade-offs and finalize candidate | Pareto or balanced selection, error analysis |
| P4 | T22 | Repeat baseline/proposed with multiple seeds | Seed-level metrics, mean ± std |
| P4 | T23 | Robustness and cross-country evaluation | Country-level results / lighting stress tests |
| P4 | T24 | Locked final evaluation on held-out test | Final evaluation table and checkpoint hashes |
| P5 | T25 | Write paper: methodology and experiments | Methods, data setup, tables, citations |
| P5 | T26 | Package code, configs and release evidence | README, lockfiles, manifests, checkpoint refs |
| P5 | T27 | Prepare final presentation and submissions | Slides, report, demo, two-course emphasis |

## Task closing checklist

- [ ] Code, artifact, metrics/log links are attached to the GitHub Issue.
- [ ] Reviewer confirms output correctness and no data leakage.
- [ ] Changes reviewed in a Pull Request and merged into `main`.
- [ ] `docs/experiments.csv` or decisions updated if the task generates new results.
- [ ] Project Board item moved to Done only after evidence is confirmed.

At present, T03 is **in progress**. T01 has a literature matrix, T02 has outstanding verification gaps; later tasks are unstarted.
