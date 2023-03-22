local M = {}

local utils = require("utils")
local if_nil = vim.F.if_nil

local function git_cmd(opts)
  local plenary_loaded, Job = pcall(require, "plenary.job")
  if not plenary_loaded then
    return 1, { "" }
  end

  opts = opts or {}
  opts.cwd = opts.cwd or utils.get_config_dir()

  local stderr = {}
  local stdout, ret = Job:new({
    command = "git",
    args = opts.args,
    cwd = opts.cwd,
    on_stderr = function(_, data)
      table.insert(stderr, data)
    end,
  }):sync()

  return ret, stdout, stderr
end

function M.get_nvim_branch()
  local _, results = git_cmd({ args = { "rev-parse", "--abbrev-ref", "HEAD" } })
  local branch = if_nil(results[1], "")
  return branch
end

function M.get_nvim_tag()
  local args = { "describe", "--tags", "--abbrev=0" }

  local _, results = git_cmd({ args = args })
  local tag = if_nil(results[1], "")
  return tag
end

function M.get_nvim_description()
  local _, results = git_cmd({ args = { "describe", "--dirty", "--always" } })

  local description = if_nil(results[1], M.get_nvim_branch())
  return description
end

function M.get_nvim_version()
  local current_branch = M.get_nvim_branch()

  local nvim_version
  if current_branch ~= "HEAD" or "" then
    nvim_version = current_branch .. "-" .. M.get_nvim_description()
  else
    nvim_version = "v" .. M.get_nvim_tag()
  end
  return nvim_version
end

return M
