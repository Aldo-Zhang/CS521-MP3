#!/usr/bin/env bash
set -Eeuo pipefail

# 让脚本用“当前目录”为源，用 XLA 的 simplifiers 目录为目标，并打印执行细节
SRC_DIR="$PWD" \
DST_DIR="$HOME/xla/xla/hlo/transforms/simplifiers" \

echo "[INFO] SRC=$(realpath "$SRC_DIR")"
echo "[INFO] DST=$(realpath "$DST_DIR")"

test -d "$DST_DIR" || { echo "[ERR] DST not found"; exit 1; }

for f in algebraic_simplifier.cc algebraic_simplifier_test.cc; do
  src="$SRC_DIR/$f"
  dst="$DST_DIR/$f"
  if [[ ! -f "$src" ]]; then echo "[ERR] missing $src"; exit 1; fi
  echo "[COPY] $src -> $dst"
  install -D "$src" "$dst"             # 更鲁棒的 cp
  echo "[HASH]"
  sha256sum "$src" "$dst"
done

# 明确切到工作区再跑测试（如果你需要顺便触发一次）
cd "$HOME/xla"
pwd