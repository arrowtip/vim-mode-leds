local group_id = vim.api.nvim_create_augroup("vim-mode-leds", { clear = true })

-- normal
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:n*' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 1')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 1)
  end
})

-- visual
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:[vV\x16]*' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 2')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 2)
  end
})

-- select
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:[sS\x13]*' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 3')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 3)
  end
})

-- insert
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:i*' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 4')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 4)
  end
})

-- cmdline
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:c' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 5')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 5)
  end
})

-- ex
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:cv' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 6')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 6)
  end
})

-- terminal
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { '*:t' },
  group = group_id,
  callback = function ()
    vim.cmd('LedMode 7')
    vim.api.nvim_win_set_var(0, 'VimModeLeds_ModeStore', 7)
  end
})

-- idle
vim.api.nvim_create_autocmd({"FocusLost", "VimLeave", "VimSuspend"}, {
  pattern = { '*' },
  group = group_id,
  command = 'LedMode 0'
})

vim.api.nvim_create_autocmd("FocusGained", {
  pattern = { '*' },
  group = group_id,
  -- command = 'LedMode'..vim.api.nvim_win_get_var(0, 'led_mode')
  callback = function ()
    vim.cmd('LedMode'..vim.api.nvim_win_get_var(0, 'VimModeLeds_ModeStore'))
  end
})
