"""Repository hygiene: safe to run without external data or GPU."""
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
required = ['.gitignore', 'README.md', 'docs/TASKLIST.md', 'docs/EXPERIMENT_PROTOCOL.md', 'docs/experiments.csv']
missing = [x for x in required if not (ROOT / x).exists()]
if missing:
    print('MISSING:', ', '.join(missing))
    sys.exit(1)

p = subprocess.run(['git', '-C', str(ROOT), 'ls-files'], capture_output=True, text=True)
if p.returncode == 0:
    bad=[]
    for name in p.stdout.splitlines():
        norm=name.replace('\\','/').lower()
        if norm.startswith(('data/raw/', 'data/processed/', 'runs/', 'outputs/', '.venv/')) or norm.endswith(('.pt','.pth','.ckpt','.onnx','.engine','.safetensors')) or norm.endswith('/kaggle.json'):
            bad.append(name)
    if bad:
        print('FAIL: tracked prohibited data/weight files:', bad)
        sys.exit(1)
print('PASS — repository skeleton present; no forbidden tracked binaries found.')
