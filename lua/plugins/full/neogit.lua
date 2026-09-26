-- Git interface inside nvim: status, staging, commit, push, rebase.
-- Replaces gitui; diffview adds repo-wide diffs and file history.
return {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "sindrets/diffview.nvim",
            cmd = {"DiffviewOpen", "DiffviewFileHistory"}
        },
        "ibhagwan/fzf-lua"
    },
    opts = {
        integrations = {
            diffview = true,
            fzf_lua = true
        }
    }
}
