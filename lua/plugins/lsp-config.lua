return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Spell checker
      cspell = {
        cmd = { "cspell-lsp", "--stdio" },
        filetypes = {
          "go",
          "rust",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "gitcommit",
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".git")(fname)
        end,
      },

      docker_compose_language_service = {
        cmd = { "docker-compose-langserver", "--stdio" },
        filetypes = { "yaml.docker-compose" },
        root_markers = {
          "docker-compose.yaml",
          "docker-compose.yml",
          "compose.yaml",
          "compose.yml",
        },
      },

      docker_language_server = {
        cmd = {
          "docker-language-server",
          "start",
          "--stdio",
        },
        filetypes = {
          "dockerfile",
          "yaml.docker-compose",
          "hcl.docker-bake",
        },
        root_markers = {
          "Dockerfile",
          "docker-compose.yaml",
          "docker-compose.yml",
          "compose.yaml",
          "compose.yml",
          "docker-bake.json",
          "docker-bake.hcl",
          "docker-bake.override.json",
          "docker-bake.override.hcl",
        },
      },
    },
  },
}
