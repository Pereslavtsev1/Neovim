local function biome_or_prettier()
  local cwd = vim.fn.getcwd()
  local biome_config = vim.fn.findfile("biome.json", cwd .. ";")
  local biome_dir = vim.fn.finddir(".biome", cwd .. ";")

  local biome_available = biome_config ~= "" or biome_dir ~= ""

  if vim.fn.executable("biome") == 1 and biome_available then
    return { "biome", "biome-organize-imports" }
  else
    return { "prettier" }
  end
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = biome_or_prettier,
      javascriptreact = biome_or_prettier,
      typescript = biome_or_prettier,
      typescriptreact = biome_or_prettier,
    },
  },
}
