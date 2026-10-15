# Unified Experiment Protocol — draft; finalize after T03/T04

## Models

- B0: YOLOv8s, primary baseline.
- B1: YOLOv10s, second baseline.
- R1: YOLOv10s + R-CBAM (selective paper-based reimplementation).
- R2: YOLOv8s + GSConv / VoVGSCSP (selective paper-based reimplementation).
- A0..A7: ablation on shared YOLOv8s backbone, where A2 introduces proposed ORA (orientation-aware attention), and A5 combines ORA with lightweight neck.

Exact architecture, module placement and code provenance must be documented *before* full training; don't assume the reimplementation matches unpublished original code.

## Shared protocol (to be locked)

- Dataset: labeled portion of RDD2022, 4 classes D00/D10/D20/D40.
- Fixed split: propose 70/15/15 of *labeled* data, with group/near-duplicate leakage checks. Save manifest and checksums. Never reshuffle per model or per seed.
- Input: initial candidate 640, validate feasibility on local GPU.
- Primary accuracy: mAP50-95; also mAP50, AP/class, Precision and Recall.
- Efficiency: Params, GFLOPs, peak VRAM, batch-1 end-to-end latency / FPS on identical hardware and precision; state warm-up and timings protocol.
- Pilot seed 42, final multi-seed at least 3 if resources permit; compare mean ± std on fixed split.
- Tune on validation only. Hold out test until final model is locked.
- Train budgets (e.g. max 150 epochs, optimizer SGD, batch=16) are **provisional** until pilot and author protocol audit; record deviations.

## Experiment logging — required per run

1. Exact git commit hash; dirty/clean working tree.
2. Dataset manifest version/hash; train/val/test counts.
3. Model config YAML, pretrained init, libraries/CUDA/GPU, img size, optimizer, LR, epochs, batch, seed and augmentation.
4. Training logs, best checkpoint (local/external storage, not raw Git), validation metrics and selected checkpoint criterion.
5. Final test figures (only once per locked selection), per-class metrics and run notes.
6. In `docs/experiments.csv`, store small tabular summary and external artifact reference; never raw image or weights.
