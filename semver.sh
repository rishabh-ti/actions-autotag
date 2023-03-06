#!/bin/bash
semver_gte() {
  local VERISON_A="${1}"
  local VERISON_B="${2}"
  local SEMVER_PATTERN="[^0-9]*\([0-9][0-9]*\)[.]\([0-9][0-9]*\)[.]\([0-9][0-9]*\).*"
  local SEG1_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\1#")"
  local SEG1_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\1#")"
  (( ${SEG1_A} < ${SEG1_B} )) && return 1
  (( ${SEG1_A} > ${SEG1_B} )) && return 0
  local SEG2_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\2#")"
  local SEG2_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\2#")"
  (( ${SEG2_A} < ${SEG2_B} )) && return 1
  (( ${SEG2_A} > ${SEG2_B} )) && return 0
  local SEG3_A="$(echo "${VERISON_A}" | sed -e "s#${SEMVER_PATTERN}#\3#")"
  local SEG3_B="$(echo "${VERISON_B}" | sed -e "s#${SEMVER_PATTERN}#\3#")"
  (( ${SEG3_A} < ${SEG3_B} )) && return 1
  return 0
}
