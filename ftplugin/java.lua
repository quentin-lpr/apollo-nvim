local jdtls = require('jdtls')

-- Get the Lombok jar path from Mason
local lombok_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'

local config = {
  cmd = {
    'jdtls',
    '--jvm-arg=-javaagent:' .. lombok_path,
    -- Add other necessary arguments
  },
  -- Other configuration options...
}

jdtls.start_or_attach(config)
