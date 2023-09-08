#!/usr/bin/env sh

TAG="$(git describe --tags --exact-match 2>/dev/null)"

GDSCRIPT=$(
	cat <<-EOF
		extends Node

		const BUILD = ${GITHUB_RUN_NUMBER:-null}
		const BRANCH = "$(git rev-parse --abbrev-ref HEAD)"
		const COMMIT = "$(git rev-parse --short HEAD)"
		const TAG = ${TAG:-null}
	EOF
)

echo "${GDSCRIPT}" > "git_info.gd"