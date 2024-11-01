--- Python
vim.cmd("au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")
vim.cmd("au FileType python set colorcolumn=110")
vim.cmd("au BufRead,BufNewFile requirements.txt set filetype=requirements")

--- HTML
vim.cmd("au FileType html setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Markdown
vim.cmd("au FileType markdown setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")
vim.cmd("autocmd FileType markdown setlocal spell")
vim.g.vim_markdown_folding_disabled = 1

--- gitcommit
vim.cmd("autocmd FileType NeogitCommitMessage setlocal spell textwidth=100")

--- mail
vim.cmd("autocmd FileType mail setlocal spell")

--- RST
vim.cmd("au FileType rst setlocal tabstop=6 expandtab shiftwidth=3 softtabstop=3")

--- JSON
vim.cmd("au FileType json setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")

--- Puppet
vim.cmd("au FileType puppet setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Ansible
vim.cmd("au FileType ansible setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")
vim.cmd("au FileType yaml.ansible setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")
vim.cmd("au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible")
vim.g.ansible_extra_keywords_highlight = 1

--- YAML
vim.cmd("au FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")
vim.cmd("au FileType helm setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- LUA
vim.cmd("au FileType lua setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Ruby
vim.cmd("au FileType ruby setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")

--- XML
vim.cmd("au FileType xml setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")

--- VimL
vim.cmd("au FileType vim setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")

--- Prometheus
vim.cmd("au FileType prometheus setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- TOML
vim.cmd("au FileType toml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Go
vim.cmd("au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4")
vim.cmd("au FileType gohtmltmpl setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Jenkinsfile
vim.cmd("au FileType Jenkinsfile setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")
vim.cmd("au FileType groovy setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4")

--- LaTeX
vim.cmd("au FileType tex setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")

--- Terraform
vim.cmd("au FileType terraform setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2")
