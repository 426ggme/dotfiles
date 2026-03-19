-- --- UI関連の設定 ---
vim.opt.number = true         -- 行番号を表示する
vim.opt.showmatch = true      -- 対応する括弧を短時間表示する

-- --- キーバインドの設定 (vim.keymap.set を使用) ---
-- keymap.set(モード, マッピング元, マッピング先, オプションテーブル)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit Insert Mode" })


-- ノーマルモード (n) での移動を拡張
vim.keymap.set("n", "J", "10j", { noremap = true, silent = true, desc = "Move down 10 lines" })
vim.keymap.set("n", "K", "10k", { noremap = true, silent = true, desc = "Move up 10 lines" })
vim.keymap.set("n", "L", "10l", { noremap = true, silent = true, desc = "Move right 10 chars" })
vim.keymap.set("n", "H", "10h", { noremap = true, silent = true, desc = "Move left 10 chars" })


-- --- 検索関連の設定 ---
vim.opt.ignorecase = true     -- 検索時に大文字と小文字を区別しない
vim.opt.smartcase = true      -- 検索文字列に大文字が含まれている場合のみ、大文字と小文字を区別する

-- --- 編集・インデント関連の設定 ---
vim.opt.expandtab = true      -- タブ文字をスペースに展開する
vim.opt.tabstop = 4           -- タブの幅
vim.opt.shiftwidth = 4        -- 自動インデントやインデント操作の幅
vim.opt.softtabstop = 4       -- タブキーやバックスペースキーを押した際の動作幅

-- --- クリップボード関連の設定 ---
-- システムクリップボードと共有する
vim.opt.clipboard = "unnamedplus"  -- Waylandのシステムクリップボードを使用

-- --- カラースキームの設定 ---
vim.cmd.colorscheme("desert")


-- --- プラグイン管理の設定 ---
-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
})