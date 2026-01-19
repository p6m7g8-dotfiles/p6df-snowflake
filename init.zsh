# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::snowflake::deps()
#
#>
######################################################################
p6df::modules::snowflake::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-python
    p6m7g8-dotfiles/p6df-js
  )
}

######################################################################
#<
#
# Function: p6df::modules::snowflake::external::brew()
#
#>
######################################################################
p6df::modules::snowflake::external::brew() {

  p6df::modules::homebrew::cli::brew::install --cask snowflake-snowsql

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::snowflake::langs()
#
#>
######################################################################
p6df::modules::snowflake::langs() {

  # Python
  uv add snowflake-connector-python
  uv add snowflake-sqlalchemy
  uv add snowflake-pandas
  uv add pyarrow
  uv add snowflake-cli

  # Node.js
  p6_js_npm_global_install snowflake-sdk

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::snowflake::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_SNOWFLAKE_ACCOUNT P6_SNOWFLAKE_USER
#>
######################################################################
p6df::modules::snowflake::prompt::mod() {

  local str
  if ! p6_string_blank "$P6_SNOWFLAKE_ACCOUNT" && ! p6_string_blank "$P6_SNOWFLAKE_USER"; then
    str="snowflake:\t  a:$P6_SNOWFLAKE_ACCOUNT u:$P6_SNOWFLAKE_USER"
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::snowflake::vscodes()
#
#>
######################################################################
p6df::modules::snowflake::vscodes() {

  code --install-extension snowflake.snowflake-vsc
  code --install-extension adpyke.vscode-sql-formatter

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::snowflake::clones()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR
#>
######################################################################
p6df::modules::snowflake::clones() {

  p6_github_login_clone "snowflakedb" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

# https://www.snowflake.com/
# https://github.com/snowflakedb
# https://docs.snowflake.com/en/
