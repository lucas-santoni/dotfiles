vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = { 'Salut beau gosse...' }

vim.g.dashboard_custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
}

vim.g.dashboard_custom_section = {
   a = { description = { '  Find File                 SPC f f' }, command = tdb('find_files') },
   b = { description = { '  Recents                   SPC f p' }, command = tdb('oldfiles') },
   c = { description = { '  Find Word                 SPC f g' }, command = tdb('live_grep') },
   d = { description = { '洛 New File                  SPC a N' }, command = 'DashboardNewFile' },
}

vim.g.dashboard_custom_footer = { '' }
