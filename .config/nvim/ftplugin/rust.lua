vim.keymap.set("n", "<leader>ac", "<cmd>Cargo check<cr>")
vim.keymap.set("n", "<leader>al", "<cmd>Cargo clippy -- -D clippy::pedantic<cr>")
vim.keymap.set("n", "<leader>ab", "<cmd>Cargo build<cr>")
vim.keymap.set("n", "<leader>at", "<cmd>Cargo test<cr>")
vim.keymap.set("n", "<leader>ad", "<cmd>Cargo doc --open<cr>")
vim.keymap.set("n", "<leader>ar", "<cmd>Cargo run<cr>")

vim.keymap.set("n", "<leader>aC", ":Cargo check ")
vim.keymap.set("n", "<leader>aB", ":Cargo build ")
vim.keymap.set("n", "<leader>aT", ":Cargo test ")
vim.keymap.set("n", "<leader>aD", ":Cargo doc ")
vim.keymap.set("n", "<leader>aR", ":Cargo run")

vim.keymap.set("n", "<leader>a<C-d>", "<cmd>Cargo doc<cr>")
