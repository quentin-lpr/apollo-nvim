-- An incremental parsing system for programming tools
-- Branch `main`: parsers go to stdpath("data")/site, and features (highlight,
-- indent) are enabled per buffer from a FileType autocmd.
-- Requires: tree-sitter CLI (brew install tree-sitter-cli), a C compiler, curl, tar.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.install({
      "asm", "bash", "c", "c_sharp", "cmake", "cpp", "css", "csv", "dart", "diff",
      "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore", "go",
      "groovy", "html", "ini", "java", "javascript", "json", "json5", "kotlin", "lua",
      "make", "markdown", "markdown_inline", "nginx", "nu", "pem", "prisma",
      "properties", "python", "query", "sql", "toml", "tsx", "typescript", "vim",
      "vimdoc", "xml", "yaml",
    })

    local function is_available(lang)
      if not available then
        available = {}
        for _, l in ipairs(ts.get_available()) do
          available[l] = true
        end
      end
      return available[lang]
    end

    local function enable(buf, lang)
      if not vim.api.nvim_buf_is_valid(buf) or not pcall(vim.treesitter.start, buf, lang) then
        return
      end
      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        if vim.treesitter.language.add(lang) then
          enable(buf, lang)
        elseif vim.bo[buf].buftype == "" and is_available(lang) then
          -- Replacement for `auto_install = true`
          ts.install(lang):await(function(err)
            if not err then
              vim.schedule(function()
                enable(buf, lang)
              end)
            end
          end)
        end
      end,
    })
  end,
}
