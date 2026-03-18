local M = {}

local function exists(p)
  return p and vim.loop.fs_stat(p) ~= nil
end

-- Find TypeScript SDKs first from project, then closest NodeJS install, and last mason
function M.find_tssdk(start_dir)
  local root = start_dir or vim.loop.cwd() or vim.fn.getcwd()

  local yarn_sdks = vim.fs.find(".yarn/sdks/typescript/lib", { path = root, upward = true })[1]

  if exists(yarn_sdks) then
    return yarn_sdks
  end

  local nm_root = vim.fs.dirname(vim.fs.find('node_modules', { path = root, upward = true })[1])

  if nm_root then
    local tsdk = table.concat({nm_root, "node_modules", "typescript", "lib"})
    if exists(tsdk) then
      return tsdk
    end
  end

  local mason_tsdk = vim.fn.stdpath("data")
    .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"

  if exists(mason_tsdk) then
    return mason_tsdk
  end

  return nil
end

function M.find_mason_package(package_name)
    local mason_registry = require("mason-registry")
    local pkg = mason_registry.get_package(package_name)
    if pkg:is_installed() then
        local install_location = require("mason-core.installer.InstallLocation")
        return install_location.global():package(package_name)
    end
    return nil
end

return M
