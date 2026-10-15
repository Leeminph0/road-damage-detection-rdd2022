# Dataset provenance — RDD2022

- Dataset mirror to audit: https://www.kaggle.com/datasets/aliabdelmenam/rdd-2022/data
- Original source DOI: https://doi.org/10.6084/m9.figshare.21431547.v1
- Target detection classes: D00 longitudinal, D10 transverse, D20 alligator, D40 pothole.
- Do not assume the Kaggle mirror exactly matches the original release: inspect layout, splits, annotation types, country folders, corrupt files.
- The official unlabeled test should not be used to calculate mAP without ground truth.

## Never commit raw data

Place downloaded data at `data/raw/` and working copies at `data/processed/`. Both directories are ignored. Commit only *small* hashes/manifests/summary CSVs necessary to reproduce provenance, unless private/source restrictions apply.

## T03 audit acceptance

Check readable images, XML/TXT correspondences, valid class names/IDs, legal box geometry, source-country inventory, source split and visually review box previews. If status is not verified on actual files, keep T03 in progress. T04 leakage-controlled split comes afterwards.
