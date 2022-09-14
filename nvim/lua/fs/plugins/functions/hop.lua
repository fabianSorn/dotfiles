local hop = require("hop")
local hint = require("hop.hint")

local helper = {}

function helper.f()
  local direction = hint.HintDirection.AFTER_CURSOR
  hop.hint_char1({ direction = direction, current_line_only = true })
end

function helper.F()
  local direction = hint.HintDirection.BEFORE_CURSOR
  hop.hint_char1({ direction = direction, current_line_only = true })
end

function helper.t()
  local direction = hint.HintDirection.AFTER_CURSOR
  hop.hint_char1({ direction = direction, current_line_only = true, hint_offset = -1 })
end

function helper.T()
  local direction = hint.HintDirection.BEFORE_CURSOR
  hop.hint_char1({ direction = direction, current_line_only = true, hint_offset = -1 })
end

return helper
