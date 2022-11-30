local status_ok, git = pcall(require, "git")
if not status_ok then
  return
end

git.setup {
  keymaps = {
    -- open blame window
    blame = "<Leader>gb",
    -- open file/folder in git repo
    browser = "<Leader>go"
  }
}
