#!/bin/bash
set -eu

# ========================
# CẤU HÌNH JOB
# ========================
JOB_ID="job_001"
JOB_NAME="etl_to_cuong_fact_orders"
TABLE_MODEL="cuong_fact_orders"
FULL_TABLE="DWH.cuong_fact_orders"
DATA_DATE=$(date '+%Y-%m-%d')

PROFILES_DIR="/usr/app/.dbt"
PROJECT_DIR="/usr/app"

# ========================
# GHI LOG BẮT ĐẦU JOB
# ========================
echo ">> START: Logging START"
dbt run-operation log_job_start \
  --project-dir "$PROJECT_DIR" \
  --profiles-dir "$PROFILES_DIR" \
  --args "{
    job_id: '$JOB_ID',
    job_name: '$JOB_NAME',
    full_table_name: '$FULL_TABLE'
  }"

# ========================
# CHẠY MODEL CHÍNH
# ========================
echo ">> RUNNING model: $TABLE_MODEL"
if OUTPUT=$(dbt run \
     --select "$TABLE_MODEL" \
     --project-dir "$PROJECT_DIR" \
     --profiles-dir "$PROFILES_DIR" 2>&1); then

  # ========================
  # GHI LOG THÀNH CÔNG
  # ========================
  echo ">> SUCCESS: Logging SUCCESS"
  dbt run-operation log_job_success \
    --project-dir "$PROJECT_DIR" \
    --profiles-dir "$PROFILES_DIR" \
    --args "{
      job_id: '$JOB_ID',
      job_name: '$JOB_NAME',
      full_table_name: '$FULL_TABLE'
    }"

else
  # ========================
  # GHI LOG THẤT BẠI (chỉ lấy mã lỗi ORA-xxxxx)
  # ========================
  echo ">> FAIL: Logging FAIL"
  ERROR_MSG=$(echo "$OUTPUT" | grep -o 'ORA-[0-9]\{5\}: [^ ]\+.*' | head -n 1)

  if [ -z "$ERROR_MSG" ]; then
    ERROR_MSG="Unknown Oracle error"
  fi

  dbt run-operation log_job_fail \
    --project-dir "$PROJECT_DIR" \
    --profiles-dir "$PROFILES_DIR" \
    --args "{
      job_id: '$JOB_ID',
      job_name: '$JOB_NAME',
      full_table_name: '$FULL_TABLE',
      error_message: \"$ERROR_MSG\"
    }"

  exit 1
fi
