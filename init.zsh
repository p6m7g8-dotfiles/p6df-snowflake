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
    sfc-gh-dflippo/snowflake-dbt-demo
  )
}

# https://www.snowflake.com/
# https://github.com/snowflakedb
# https://docs.snowflake.com/en/
######################################################################
#<
#
# Function: p6df::modules::snowflake::external::brews()
#
#>
######################################################################
p6df::modules::snowflake::external::brews() {

  p6df::core::homebrew::cli::brew::install --cask snowflake-snowsql

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
# Function: p6df::modules::snowflake::vscodes()
#
#>
######################################################################
p6df::modules::snowflake::vscodes() {

  p6df::modules::vscode::extension::install snowflake.snowflake-vsc
  p6df::modules::vscode::extension::install adpyke.vscode-sql-formatter

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::snowflake::vscodes::config()
#
#  Environment:	 HOME
#>
######################################################################
p6df::modules::snowflake::vscodes::config() {

  cat <<'EOF'
  "snowflake.connectionsConfigFile": "$HOME/.snowflake/connections.toml"
EOF

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

  p6_github_cli_parallel_clone "snowflakedb" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

######################################################################
#<
#
# Function: words snowflake $SNOWFLAKE_ACCOUNT $SNOWFLAKE_DATABASE $SNOWFLAKE_SCHEMA $SNOWFLAKE_WAREHOUSE $SNOWFLAKE_ROLE $SNOWFLAKE_USER $SNOWFLAKE_HOME = p6df::modules::snowflake::profile::mod()
#
#  Returns:
#	words - snowflake $SNOWFLAKE_ACCOUNT $SNOWFLAKE_DATABASE $SNOWFLAKE_SCHEMA $SNOWFLAKE_WAREHOUSE $SNOWFLAKE_ROLE $SNOWFLAKE_USER $SNOWFLAKE_HOME
#
#  Environment:	 SNOWFLAKE_ACCOUNT SNOWFLAKE_DATABASE SNOWFLAKE_SCHEMA SNOWFLAKE_WAREHOUSE SNOWFLAKE_ROLE SNOWFLAKE_USER SNOWFLAKE_HOME
#>
######################################################################
p6df::modules::snowflake::profile::mod() {

  p6_return_words 'snowflake' '$SNOWFLAKE_ACCOUNT' '$SNOWFLAKE_DATABASE' '$SNOWFLAKE_SCHEMA' '$SNOWFLAKE_WAREHOUSE' '$SNOWFLAKE_ROLE' '$SNOWFLAKE_USER' '$SNOWFLAKE_HOME'
}
