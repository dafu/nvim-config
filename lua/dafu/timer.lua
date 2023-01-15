local function is_valid_date(datestr)
  return datestr:match('^%d%d%d%d%-%d%d%-%d%d%s+') or datestr:match('^%d%d%d%d%-%d%d%-%d%d$')
end

local function is_valid_time(time)
  if time == nil then return false end
  if time == '' then return false end
  return time:match('%d%d:%d%d%[-]%d%d:%d%d')
end

local function time_pos(time)
  if time == nil then return false end
  if time == '' then return false end
  return time:match('%d%d:%d%d%[-]%d%d:%d%d')
end

function timediff(s)
  if time == nil then return false end
  if time == '' then return false end
  local pattern = "(%d%d):(%d%d)[-](%d%d):(%d%d)"
  local h1, m1, h2, m2 = string.match(s, pattern)
  local total = (((h2*3600)+(m2*60)) - ((h1*3600)+(m1*60))) / 60
  local h = tonumber(string.format("%.2f", total / 60))
  local m = total
  return h..'h ('..m..'m)'
end

local ns = vim.api.nvim_create_namespace('timer')

local function update_vt_line(k)
  local v = vim.api.nvim_get_current_line()
  local time = timediff(v)
  if not time then return false end
  local td = ' -> '..time
  vim.api.nvim_buf_del_extmark(0,ns,k)
  vim.api.nvim_buf_set_extmark(0,ns,k-1,0,{ id = k, virt_text = {{td, "Todo" }}}) -- 2 param = HighlightGroup
end

-- @TODO: add function to write the totals to file
      -- vim.api.nvim_buf_set_text(0,k-1,final,k-1,final,{r})
      -- local id = vim.api.nvim_buf_get_extmark(0,ns,k)
      --vim.api.nvim_buf_set_extmark(0,ns,k-1,0,{ id = k, virt_text = {{td, "Todo" }}})
      -- vim.api.nvim_buf_set_text(0,k-1,0,k-1,string.len(v),{v..' -> '..timediff(v)..'m'})

local function update_vt_all_lines()
  local b = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false) 
  for k, v in pairs(b) do
    -- local start, final, match = time_pos(v)
    if(time_pos(v)) then
      local td = ' -> '..timediff(v)
      vim.api.nvim_buf_del_extmark(0,ns,k)
      vim.api.nvim_buf_set_extmark(0,ns,k-1,0,{ id = k, virt_text = {{td, "Todo" }}})
    end
  end
end

local function update_ts()
  local line = vim.api.nvim_get_current_line()
  local k = vim.api.nvim_win_get_cursor(0)[1]

  local t = os.date("%H:%M")
  local pattern = ".*%d%d:%d%d[-]%d%d:%d%d.*"
  local pattern_start = ".*%d%d:%d%d[-]%D*"
  local update = false
  if line:match(pattern) then -- line already exists, update current timestamp
    result = line:gsub("(%d%d:%d%d[-])%d%d:%d%d", "%1"..t)
  elseif line:match(pattern_start) then -- line has no time, insert current timestamp
    result = line:gsub("(%d%d:%d%d[-])", "%1"..t)
  else -- insert current starttime
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    -- result = line:sub(0, pos) .. t .. '-' .. line:sub(pos + 1)
    result = t .. '- ' .. line
  end

  vim.api.nvim_set_current_line(result)
  -- if update then update_vt_line(k) end
  update_vt_all_lines()
end

return {
  update_vt_all_lines = update_vt_all_lines,
  update_ts = update_ts
}

