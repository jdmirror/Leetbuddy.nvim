M = {}

function M.split_string_to_table(str)
  local lines = {}
  for line in str:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  return lines
end

function M.pad(contents, opts)
  vim.validate({ contents = { contents, "t" }, opts = { opts, "t", true } })
  opts = opts or {}
  local left_padding = (" "):rep(opts.pad_left or 1)
  local right_padding = (" "):rep(opts.pad_right or 1)
  for i, line in ipairs(contents) do
    contents[i] = string.format("%s%s%s", left_padding, line:gsub("\r", ""), right_padding)
  end
  if opts.pad_top then
    for _ = 1, opts.pad_top do
      table.insert(contents, 1, "")
    end
  end
  if opts.pad_bottom then
    for _ = 1, opts.pad_bottom do
      table.insert(contents, "")
    end
  end
  return contents
end

return M