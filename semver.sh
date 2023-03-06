#!/bin/bash
semver_ste() {
  local VERISON_A="${1}"
  local VERISON_B="${2}"
  local SEMVER_PATTERN="[^0-9]*\([0-9][0-9]*\)[.]\([0-9][0-9]*\)[.]\([0-9][0-9]*\).*"
  local SEG1_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\1#")"
  local SEG1_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\1#")"
  (( ${SEG1_A} < ${SEG1_B} )) && return 0
  (( ${SEG1_A} > ${SEG1_B} )) && return 1
  local SEG2_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\2#")"
  local SEG2_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\2#")"
  (( ${SEG2_A} < ${SEG2_B} )) && return 0
  (( ${SEG2_A} > ${SEG2_B} )) && return 1
  local SEG3_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\3#")"
  local SEG3_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\3#")"
  (( ${SEG3_A} > ${SEG3_B} )) && return 1
  return 0
}

compare2() {
    local V1="${1}"
    local V2="${2}"
    if semver_ste $V1 $V2; then
      echo true
    else
      echo false
    fi
}
compare2 $1 $2
