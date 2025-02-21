local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,

    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,

    null_ls.builtins.formatting.prettier.with {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
    },
    null_ls.builtins.diagnostics.eslint.with {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
    },
    null_ls.builtins.code_actions.eslint.with {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
    },
  },
}
