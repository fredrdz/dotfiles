local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  local msg = "[cmp-config] CMP; Encountered an error."
  vim.notify(msg, vim.log.levels.WARN)
  return
end

local compare = require("cmp.config.compare")

-- Set up nvim-cmp.
cmp.setup({
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
      compare.offset,
      compare.exact,
      -- compare.scopes,
      compare.score,
      compare.recently_used,
      compare.locality,
      -- compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
    }
  },
  experimental = {
    ghost_text = true,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = {
    { name = 'cmp_git', group_index = 1 }, -- You can specify the `cmp_git` source if you were installed it.
    { name = 'buffer', group_index = 2 }
  }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer', group_index = 1 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path', group_index = 1 },
    { name = 'cmdline', group_index = 2 }
  }
})
