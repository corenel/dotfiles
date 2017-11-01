#!/usr/bin/env bash

which curl >/dev/null || {
  echo "curl not found in path..."
  exit 1
}
which git >/dev/null || {
  echo "git not found in path..."
  exit 1
}

for BASE_DIR in "${HOME}/.vim"; do
  BUNDLES_DIR="${BASE_DIR}/bundle"

  if [[ -d "${BUNDLES_DIR}" ]]; then
    echo "Updating bundles in ${BUNDLES_DIR}..."
    for bundle in "${BUNDLES_DIR}/"*; do
      if [[ -d "${bundle}/.git" ]]; then
        echo "Bundle: ${bundle}..."
        cd "${bundle}"
        git pull
      fi
    done
  fi
done
