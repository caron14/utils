##
#
# alias
#
##
alias ls='ls -lFG $LS_OPTIONS'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l='cp -i'
alias la='ls -a'
alias rm='rm -i'

# BigQuery Command
## Table Schema
alias bq_schema='function _bq_schema() { bq query --nouse_legacy_sql "SELECT column_name, data_type, is_nullable FROM \`$1.INFORMATION_SCHEMA.COLUMNS\` WHERE table_name = '\''$2'\''"; }; _bq_schema'
alias bq_show='function _bq_show() { bq show $1:$2.$3 }; _bq_show'