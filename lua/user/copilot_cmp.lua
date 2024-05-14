local cmp_copilot_status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not cmp_copilot_status_ok then
  return
end

-- startup copilot cmp
copilot_cmp.setup()
