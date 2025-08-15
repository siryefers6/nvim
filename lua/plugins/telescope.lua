return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "venv/",
        "%.venv/",
        "node_modules/",
        "%.git/",
        "__pycache__/",
        "dist/",
        "build/",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!venv/**",
        "--glob=!.venv/**",
        "--glob=!node_modules/**",
        "--glob=!.git/**",
        "--glob=!__pycache__/**",
        "--glob=!dist/**",
        "--glob=!build/**",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
  keys = {
    {
      "<leader>pp",
      function()
        require("telescope.builtin").git_files({ show_untracked = true })
      end,
      desc = "Buscar archivos Git (incluye no rastreados)",
    },
    {
      "<leader>pe",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Mostrar buffers abiertos",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Ver estado Git",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Ver commits del buffer actual",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Ver ramas de Git",
    },
    {
      "<leader>rp",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Plugins",
          cwd = vim.fn.stdpath("config") .. "/lua/plugins",
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
            end)
            return true
          end,
        })
      end,
      desc = "Buscar plugin en la carpeta de configuración",
    },
    {
      "<leader>pf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Buscar archivos",
    },
    {
      "<leader>ph",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Buscar en ayuda de Neovim",
    },
    {
      "<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:h:p",
          select_buffer = true,
        })
      end,
      desc = "Abrir explorador de archivos",
    },
    {
      "<leader>ps",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Buscar texto en archivos (live grep)",
    },
    {
      "<leader>pw",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Buscar palabra bajo el cursor (grep string)",
    },
  },
}

