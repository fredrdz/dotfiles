-- nvimtree
vim.api.nvim_set_keymap('n', '<leader><leader>', ':NvimTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>f', ':NvimTreeFindFile<cr>', { noremap = true })

-- fterm
vim.api.nvim_set_keymap('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
  { noremap = true, silent = true })

-- avoid clashing with leader as space
vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true, silent = true })

-- jj as <esc>
vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('t', 'jj', [[<C-\><C-n>]], { noremap = true })

-- resize windows
vim.api.nvim_set_keymap('n', '<a-up>', '<cmd>resize -5<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<a-down>', '<cmd>resize +5<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<a-right>', '<cmd>vertical resize -5<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<a-left>', '<cmd>vertical resize +5<cr>', { noremap = true })

-- mergetool
vim.api.nvim_set_keymap('n', '<c-left>', '&diff? "<plug>(MergetoolDiffExchangeLeft)" : "\\<c-left>"', { expr = true })
vim.api.nvim_set_keymap('n', '<c-right>', '&diff? "<plug>(MergetoolDiffExchangeRight)" : "\\<c-right>"', { expr = true })
vim.api.nvim_set_keymap('n', '<c-up>', '&diff? "<plug>(MergetoolDiffExchangeUp)" : "\\<c-up>"', { expr = true })
vim.api.nvim_set_keymap('n', '<c-down>', '&diff? "<plug>(MergetoolDiffExchangeDown)" : "\\<c-down>"', { expr = true })
vim.api.nvim_set_keymap('n', '<up>', '&diff ? "[c" : "<up>"', { expr = true })
vim.api.nvim_set_keymap('n', '<down>', '&diff ? "]c" : "<down>"', { expr = true })

-- EasyAlign
vim.api.nvim_set_keymap('n', 'ga', '<plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('x', 'ga', '<plug>(EasyAlign)', {})

-- discoverable mappings
local wk = require("which-key")

-- turn off search highlighting
vim.api.nvim_set_keymap('n', '<leader>/', ':set hls!<CR>', { noremap = true })

wk.register({
  n = { "<cmd>lua require('utils').toggleNum()<cr>", "Toggle Number" },

  f = {
    name = "find",
    b = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "File Browser" },
    f = { "<cmd>lua require('telescope.builtin').find_files({hidden=true, file_ignore_patterns={'.git/', 'node_modules/'}})<cr>",
      "list Files" },
    -- g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "grep in files" },
    S = { "<cmd>lua require('spectre').open_visual()<cr>", "Search and Replace (across files)" },
    n = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
    B = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    F = { "<cmd>Telescope find_files<cr>", "Find File" },
    t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text (across files)" },
    s = { "<cmd>Telescope grep_string theme=ivy<cr>", "Find String (across files)" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    -- i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  b = {
    name = "buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers({sort_lastused=true})<cr>", "List Buffers" },
    d = { "<cmd>:BWipeout this<cr>", "Delete current buffer" },
    c = { "<cmd>:BWipeout other<cr>", "Close all buffers except current" },
    C = { "<cmd>:BWipeout all<cr>", "Close all buffers" },
    l = { "<cmd>BufferLineCycleNext<cr>", "Go to next buffer" },
    h = { "<cmd>BufferLineCyclePrev<cr>", "Go to previous buffer" },
    s = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search and Replace (buffer)" }
  },

  v = {
    name = "version control",
    f = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Find commits" },
    b = { "<cmd>Telescope git_branches<cr>", "Show branches" },
    g = { "<cmd>Telescope git_status<cr>", "Current changes" },
    B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame current line" },
    o = { "<cmd>Neogit<cr>", "Open neogit" },
    d = { "<cmd>DiffviewOpen<cr>", "Open diffsplit" },
    c = { "<cmd>DiffviewClose<cr>", "Close diffsplit" },
    P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview current hunk" },
    R = { "<cmd>Gitsigns reset_hunk<cr>", "Reset current hunk" },
    p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    m = { "<plug>(MergetoolToggle)", "Toggle mergetool" }
  },

  m = {
    name = "mergetool",
    t = { "<plug>(MergetoolToggle)", "Toggle mergetool" },
    s = { "<leader>mb :call mergetool#toggle_layout('mr')<cr>", "toggle mergetool (merged | remote )", noremap = true,
      silent = true },
    b = { "<leader>mb :call mergetool#toggle_layout('mr,b')<cr>", "toggle mergetool (merged | remote _ base )",
      noremap = true, silent = true },
    l = { "<leader>mb :call mergetool#toggle_layout('LBR')<cr>", "toggle mergetool (local | base | remote)",
      noremap = true, silent = true }
  },

  t = {
    name = "tests",
    f = { "<cmd>TestNearest -count=1 -v<cr>", "Test nearest function" },
    a = { "<cmd>TestFile -v<cr>", "Test all" },
    i = { "<cmd>TestNearest -count=1 -tags integration -v<cr>", "Integration test nearest function" }
  }

}, { prefix = "<leader>" })
