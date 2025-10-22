-- ~/.config/nvim/lua/plugins/dashboard.lua

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "                                                     ",
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set header color to ayu orange
    vim.cmd([[highlight DashboardHeader guifg=#FF8F40]])
    dashboard.section.header.opts.hl = "DashboardHeader"

    -- Set menu (empty - keybindings will be set via autocmd)
    dashboard.section.buttons.val = {}

    -- Set footer
    local function footer()
      return "⚡ Barely Functional"
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.position = "center"

    -- Custom layout without visible buttons
    dashboard.opts.layout = {
      { type = "padding", val = function() return math.floor(vim.fn.winheight(0) * 0.3) end },
      dashboard.section.header,
      { type = "padding", val = function() return math.floor(vim.fn.winheight(0) * 0.15) end },
      dashboard.section.footer,
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer, hide statusline, and set up keybindings
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable laststatus=0
      autocmd BufUnload <buffer> setlocal laststatus=3
      autocmd FileType alpha nnoremap <buffer> <silent> p :Telescope projects<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> f :Telescope find_files<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> n :ene <BAR> startinsert<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> r :Telescope oldfiles<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> t :Telescope live_grep<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> c :e $MYVIMRC<CR>
      autocmd FileType alpha nnoremap <buffer> <silent> q :qa<CR>
    ]])
  end,
}
