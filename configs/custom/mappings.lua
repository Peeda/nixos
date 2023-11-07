local M = {}

M.myBinds = {
    n = {
        ["<leader>yy"] = {"<cmd> :%y+ <CR>","copy to clipboard"},
    },
}


return M
