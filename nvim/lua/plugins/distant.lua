return {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.2',
    lazy = true,
    config = function()
        require('distant').setup({['*'] = require('distant.settings').chip_default()})
    end,
    cmd = {'DistantLaunch', 'DistantInstall', 'DistantOpen', 'DistantConnect', 'DistantMetadata', 'DistantShell', 'DistantSessionInfo'}
}
