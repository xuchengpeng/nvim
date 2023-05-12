# Changelog

## [1.8.13](https://github.com/xuchengpeng/nvim/compare/v1.8.12...v1.8.13) (2023-05-12)


### Bug Fixes

* **heirline:** show tabline after leaving alpha ([ff53b26](https://github.com/xuchengpeng/nvim/commit/ff53b26caa11598e1deaa7e2a061875807f5334e))

## [1.8.12](https://github.com/xuchengpeng/nvim/compare/v1.8.11...v1.8.12) (2023-05-10)


### Bug Fixes

* **alpha:** redrawing after footer update ([4201be6](https://github.com/xuchengpeng/nvim/commit/4201be6b25f3807f4fe1d071ce51ac2a1af4d3d5))
* **heirline:** use alphanumeric characters as buffer picker ([3f3447a](https://github.com/xuchengpeng/nvim/commit/3f3447a47a620a6e5b10d6bfa2605bb2b9d24123))
* **lualine:** add trouble extension ([a0b711a](https://github.com/xuchengpeng/nvim/commit/a0b711a332dda94a7772bf7fe9bb92dab2c49adc))

## [1.8.11](https://github.com/xuchengpeng/nvim/compare/v1.8.10...v1.8.11) (2023-05-06)


### Bug Fixes

* **autocmds:** add missing information for autocmd ([983e28c](https://github.com/xuchengpeng/nvim/commit/983e28ccc3afec24f9bf265c0bee542569327eed))
* **icons:** update obsolete icons ([8f06c3d](https://github.com/xuchengpeng/nvim/commit/8f06c3d7e16ff89d14e5522efb9c7535b689b399))
* **mason:** exclude filetype mason in indent-blankline and illuminate ([7cff183](https://github.com/xuchengpeng/nvim/commit/7cff18363ad8ef4d9154a42f4545b16041c77dd0))

## [1.8.10](https://github.com/xuchengpeng/nvim/compare/v1.8.9...v1.8.10) (2023-04-28)


### Bug Fixes

* **heirline:** customize sidebar with special statusline ([be14aee](https://github.com/xuchengpeng/nvim/commit/be14aee4327dcd7258086048ed634c7f2caf833f))
* **heirline:** customize sidebar,terminal name ([938083a](https://github.com/xuchengpeng/nvim/commit/938083a4af7c89f3b1ba91dd018bf97b75791495))
* **heirline:** show treesitter status in section_x ([791def1](https://github.com/xuchengpeng/nvim/commit/791def12c12e201c8497c86aac3a1ae05b2a208a))
* **ui:** customize border with single style ([afd7e08](https://github.com/xuchengpeng/nvim/commit/afd7e08547a8eacae8a1502886ed638c8bf11d64))

## [1.8.9](https://github.com/xuchengpeng/nvim/compare/v1.8.8...v1.8.9) (2023-04-25)


### Bug Fixes

* **heirline:** close with bd ([376daf1](https://github.com/xuchengpeng/nvim/commit/376daf19c2f7a6abc71ab50067014e3c2f74c545))
* **treesitter:** disable for large files ([165e44a](https://github.com/xuchengpeng/nvim/commit/165e44a3da38498e0fb7115abc38ef3c57942286))

## [1.8.8](https://github.com/xuchengpeng/nvim/compare/v1.8.7...v1.8.8) (2023-04-24)


### Bug Fixes

* **heirline:** customize active tabline with normal_bg ([fde18a8](https://github.com/xuchengpeng/nvim/commit/fde18a8ebe66bf76fe5a36980656c9511fbbaf4b))

## [1.8.7](https://github.com/xuchengpeng/nvim/compare/v1.8.6...v1.8.7) (2023-04-21)


### Bug Fixes

* **heirline:** fix redrawtabline on TablineCloseButton ([66f559e](https://github.com/xuchengpeng/nvim/commit/66f559e43853e8bf91a9e5f765a94a5c163046de))

## [1.8.6](https://github.com/xuchengpeng/nvim/compare/v1.8.5...v1.8.6) (2023-04-19)


### Bug Fixes

* **heirline:** remove workarounds for nvim &lt; 0.9 ([a03535b](https://github.com/xuchengpeng/nvim/commit/a03535bb6180fe2308459e0ad5ce657181b9830a))

## [1.8.5](https://github.com/xuchengpeng/nvim/compare/v1.8.4...v1.8.5) (2023-04-18)


### Bug Fixes

* **autocmds:** add checkhealth filetype to close_with_q list ([cf7f032](https://github.com/xuchengpeng/nvim/commit/cf7f032aecc35738f70c508f9c7a0e5cdc693e50))
* **autocmds:** don't auto create dirs for urls ([426d30d](https://github.com/xuchengpeng/nvim/commit/426d30dea35203f41330a13b5d3232ecf4225382))
* **telescope:** use the new dynamic workspace symbols ([043f72f](https://github.com/xuchengpeng/nvim/commit/043f72f3be95b50533c722e674447f4250283d07))

## [1.8.4](https://github.com/xuchengpeng/nvim/compare/v1.8.3...v1.8.4) (2023-04-13)


### Bug Fixes

* **treesitter:** rename help with vimdoc ([2991c89](https://github.com/xuchengpeng/nvim/commit/2991c89bfb90d8e632a75c78fc42b941405b7424))

## [1.8.3](https://github.com/xuchengpeng/nvim/compare/v1.8.2...v1.8.3) (2023-04-12)


### Bug Fixes

* **statusline:** buffer_matches accepts bufnr argument ([ee85907](https://github.com/xuchengpeng/nvim/commit/ee85907cc89b2ce8b12018aeff52506cff9cd4aa))

## [1.8.2](https://github.com/xuchengpeng/nvim/compare/v1.8.1...v1.8.2) (2023-04-07)


### Bug Fixes

* **buffer:** fix conditions ([c8e1de1](https://github.com/xuchengpeng/nvim/commit/c8e1de112a27d1c181d35167455fe9210c597382))

## [1.8.1](https://github.com/xuchengpeng/nvim/compare/v1.8.0...v1.8.1) (2023-04-03)


### Bug Fixes

* **colorscheme:** remove nord ([f9eed0d](https://github.com/xuchengpeng/nvim/commit/f9eed0db459336f9463cc10a514e82114cfa7f94))

## [1.8.0](https://github.com/xuchengpeng/nvim/compare/v1.7.16...v1.8.0) (2023-04-03)


### Features

* **autocmds:** use q to close aerial navigation window ([a293a2e](https://github.com/xuchengpeng/nvim/commit/a293a2ec5ae2a0156dd7bc11ea4346df2c9abbb3))


### Bug Fixes

* **heirline:** customize highlight bg of tabline ([0b0a9cc](https://github.com/xuchengpeng/nvim/commit/0b0a9cc2227bc963f76fe366dafa5717ad7b4308))
* **lualine:** added lazy extension ([254c5cc](https://github.com/xuchengpeng/nvim/commit/254c5ccc3b1089eb3406a3b55662258b63346a3d))
* **treesitter:** enable treesitter indentation ([d06a715](https://github.com/xuchengpeng/nvim/commit/d06a715a404974985a04b9395f2498207f16edd0))

## [1.7.16](https://github.com/xuchengpeng/nvim/compare/v1.7.15...v1.7.16) (2023-03-31)


### Bug Fixes

* **statusline:** put diagnostics component in section x ([b8c16a3](https://github.com/xuchengpeng/nvim/commit/b8c16a38a270d35936428a32ca73c7e3659a7715))

## [1.7.15](https://github.com/xuchengpeng/nvim/compare/v1.7.14...v1.7.15) (2023-03-31)


### Bug Fixes

* **heirline:** customize separator highlight ([c78716a](https://github.com/xuchengpeng/nvim/commit/c78716a35190d7d33fcddc4c09b5e675929bab11))
* **winbar:** customize file name without modified flags ([cb2c8c8](https://github.com/xuchengpeng/nvim/commit/cb2c8c8c477bcab1437d0096e89168cf83d0b964))

## [1.7.14](https://github.com/xuchengpeng/nvim/compare/v1.7.13...v1.7.14) (2023-03-30)


### Bug Fixes

* **heirline:** customize style like lualine ([48a70a4](https://github.com/xuchengpeng/nvim/commit/48a70a4a567a13d78f63ba5c3a470b13093b1448))
* **heirline:** customize terminal statusline highlight ([387f7fd](https://github.com/xuchengpeng/nvim/commit/387f7fdddc524c42732820e62782234dc72f9b82))
* **icons:** customize icons ([a886fee](https://github.com/xuchengpeng/nvim/commit/a886fee1951ada8f2151b6d66c5cf740fb15984e))
* **icons:** unify ui icons ([5e29375](https://github.com/xuchengpeng/nvim/commit/5e293757fe7cea5864aa046c2feecab87a57fb40))
* **utils:** use new nvim_get_hl api for neovim 0.9 ([acce4e1](https://github.com/xuchengpeng/nvim/commit/acce4e1fb1b86bc2e1d1b2af52fd96fc750795f4))

## [1.7.13](https://github.com/xuchengpeng/nvim/compare/v1.7.12...v1.7.13) (2023-03-28)


### Bug Fixes

* **lazy:** set install colorscheme with global settings ([99dec2b](https://github.com/xuchengpeng/nvim/commit/99dec2bba9b845f89ab3d8ed38a986320f01b324))
* **lsp:** add format_on_save settings ([bb1ea50](https://github.com/xuchengpeng/nvim/commit/bb1ea500e40496284ee664e5cca36a8c2b83f348))
* **lsp:** customize providers ([cf1a862](https://github.com/xuchengpeng/nvim/commit/cf1a8623aef33a6caa7158e76a82a5c169cb1d91))

## [1.7.12](https://github.com/xuchengpeng/nvim/compare/v1.7.11...v1.7.12) (2023-03-28)


### Bug Fixes

* add settings ([54a1eee](https://github.com/xuchengpeng/nvim/commit/54a1eee7977fff9c0022d5452cb5890a7f6d1147))
* **aerial:** customize max width ([e6f9fc3](https://github.com/xuchengpeng/nvim/commit/e6f9fc3c3820f6d19c7a24af568722a44ca4283b))
* **cmp:** customize formatting style ([fdc36cb](https://github.com/xuchengpeng/nvim/commit/fdc36cb1d430c6743a5990192adf016184f5051f))
* **heirline:** add space after icons ([45039f3](https://github.com/xuchengpeng/nvim/commit/45039f3e09fb2447aa66886e982ce37454db2f5d))
* **heirline:** add terminal icon ([3c69777](https://github.com/xuchengpeng/nvim/commit/3c6977770fefc741081db49cf7aff2573a9609fc))
* **heirline:** customize breadcrumbs on_click ([aaaf426](https://github.com/xuchengpeng/nvim/commit/aaaf42676ce2e0be6da6233a701e74bf68acccc3))
* **heirline:** customize breadcrumbs separator ([caf6be4](https://github.com/xuchengpeng/nvim/commit/caf6be483f5e1be0065954d709d4e969f7f4ea3c))
* **heirline:** customize highlight with colorscheme ([fb85141](https://github.com/xuchengpeng/nvim/commit/fb85141dd23430d300de1abe4e76d7dd44dce327))
* **heirline:** customize tabline modified icon ([a305956](https://github.com/xuchengpeng/nvim/commit/a305956f1f89fba95345e350dbf4579a54158918))
* **heirline:** customize tabline separator ([c509b80](https://github.com/xuchengpeng/nvim/commit/c509b80ce387df88fc6a9d79db190a7dedad27aa))
* **heirline:** do not show treesitter by default ([0898828](https://github.com/xuchengpeng/nvim/commit/089882828671f4dd53167ed6d6cd6233c0cbcb55))
* **heirline:** padding 1 space left ([d1362c7](https://github.com/xuchengpeng/nvim/commit/d1362c7c9103f33ccbea041b47d70b3b3a597b29))
* **heirline:** show file icon on winbar ([bd69b38](https://github.com/xuchengpeng/nvim/commit/bd69b3883a8f824d7683060453b26e4d0341518a))
* **heirline:** show file name block on breadcrumbs if there is no symbols ([992a636](https://github.com/xuchengpeng/nvim/commit/992a636a699bd6244341470d695ae61c73ced34f))
* **heirline:** simply tabline close button display conditions ([966b249](https://github.com/xuchengpeng/nvim/commit/966b249782c5ad6d289cf16485e55d8995179d9f))
* **icons:** remove useless icons ([d86d618](https://github.com/xuchengpeng/nvim/commit/d86d61864bcdbb09fe9a3d739316002749f2379a))
* **lualine:** do not show lsp when there is no active client ([1ec90b3](https://github.com/xuchengpeng/nvim/commit/1ec90b32f7e0aa7375567e85d7ce62750c487471))
* **lualine:** set lualine as default statusline ([7f8d63a](https://github.com/xuchengpeng/nvim/commit/7f8d63a9fc47f7aba055de5ff52e86035a0b9c3f))
* **statusline:** add style configuration ([f0611f8](https://github.com/xuchengpeng/nvim/commit/f0611f8d4eb0f52c0e2be15ca8bffff715924e1d))

## [1.7.11](https://github.com/xuchengpeng/nvim/compare/v1.7.10...v1.7.11) (2023-03-25)


### Bug Fixes

* **heirline:** add treesitter component ([6e9aee3](https://github.com/xuchengpeng/nvim/commit/6e9aee3abbf4a5a690624b58a39e857646d5d62d))
* **heirline:** customize file misc info on the right ([952a6d0](https://github.com/xuchengpeng/nvim/commit/952a6d00da555add6d2fff310b9272a2a3d4b41a))
* **heirline:** set bold diagnostics icons ([07654db](https://github.com/xuchengpeng/nvim/commit/07654dbda451c0b5169d3a141522b2b0a0484070))

## [1.7.10](https://github.com/xuchengpeng/nvim/compare/v1.7.9...v1.7.10) (2023-03-25)


### Bug Fixes

* **aerial:** display symbols for the current window ([7816073](https://github.com/xuchengpeng/nvim/commit/7816073f52e19b734497f1f45ff5a184c041b177))
* **heirline:** add tabline picker ([df13646](https://github.com/xuchengpeng/nvim/commit/df13646f9812d0041b7a6b960afb71546ca183fb))
* **heirline:** customize tabline close button ([6f3b83d](https://github.com/xuchengpeng/nvim/commit/6f3b83db1e4b60615dc2400aee64a735afa0c899))
* **heirline:** remove bold highlight for lsp,file_type,file_name ([79ef8e9](https://github.com/xuchengpeng/nvim/commit/79ef8e9aacdb4fc4ba86f184f8dbda8b2a63d5d6))
* **heirline:** remove tabline bufnr ([23fb604](https://github.com/xuchengpeng/nvim/commit/23fb60478c377e280dec2b6d2dab582d472d4027))
* **heirline:** show search count if cmdheight==0 ([574eb1a](https://github.com/xuchengpeng/nvim/commit/574eb1acba8878ac6b0db902f51d0ea3ed1977a4))
* **keymaps:** proper description for nohlsearch ([4df4d46](https://github.com/xuchengpeng/nvim/commit/4df4d46cf7273ff8e8efd55f3b49c8622a96a781))

## [1.7.9](https://github.com/xuchengpeng/nvim/compare/v1.7.8...v1.7.9) (2023-03-24)


### Bug Fixes

* **colorscheme:** remove onedark ([4674e83](https://github.com/xuchengpeng/nvim/commit/4674e83dc72b014798605919a0dde538403a36a9))
* **heirline:** add winbar left padding ([3b663ed](https://github.com/xuchengpeng/nvim/commit/3b663ed48e676cbf1191969fcd075e09625d6244))
* **heirline:** add winbar support ([75be440](https://github.com/xuchengpeng/nvim/commit/75be440c794ae4c6d5e0e556a4a9029d5aafcee5))
* **heirline:** customize git diff icons ([9561a65](https://github.com/xuchengpeng/nvim/commit/9561a6579c1fec02eef4d849c4a0e170886173aa))
* **heirline:** customize inactive special statusline highlight ([e9d0da2](https://github.com/xuchengpeng/nvim/commit/e9d0da207a7ded5d9c2b8a1153f2f6779b9c21d4))
* **heirline:** customize mode and file highlight ([4de0915](https://github.com/xuchengpeng/nvim/commit/4de09155dd89cfe85ba727c5ce60137d42968ad7))
* **heirline:** set fg to gray for inactive statusline ([e9a2fad](https://github.com/xuchengpeng/nvim/commit/e9a2fadc6e537f2c27a530616b833da70a811977))
* **heirline:** set toggleterm statusline ([20891b4](https://github.com/xuchengpeng/nvim/commit/20891b4b6dd30f36a38b333957fb7ec26b4649c2))
* **heirline:** show macro-recoding and searchcount ([c54c7f3](https://github.com/xuchengpeng/nvim/commit/c54c7f3230a16e9c46935183da4a607771dc59cf))
* **statusline:** set global statusline ([6aabfee](https://github.com/xuchengpeng/nvim/commit/6aabfee21826e96ce0b22b86b1275ddb00f719ec))

## [1.7.8](https://github.com/xuchengpeng/nvim/compare/v1.7.7...v1.7.8) (2023-03-23)


### Bug Fixes

* **lsp:** refactor lsp setup ([21afa86](https://github.com/xuchengpeng/nvim/commit/21afa8681949dc6ebdab658961dae4f8ef605ab4))
* **ui:** replace bufferline,lualine with heirline ([5d696c5](https://github.com/xuchengpeng/nvim/commit/5d696c51f2ba0c6a827bcc762b37e3fcd74bf780))

## [1.7.7](https://github.com/xuchengpeng/nvim/compare/v1.7.6...v1.7.7) (2023-03-22)


### Bug Fixes

* **lsp:** set clangd offsetEncoding with utf-8 ([1fb2b37](https://github.com/xuchengpeng/nvim/commit/1fb2b376306b44292959b932683890562383ab79))
* unified code style ([a33260b](https://github.com/xuchengpeng/nvim/commit/a33260bcc482bbe49a97f387763b60b2ab4e65b7))

## [1.7.6](https://github.com/xuchengpeng/nvim/compare/v1.7.5...v1.7.6) (2023-03-20)


### Bug Fixes

* **alpha:** bind new file with n ([a72b2ed](https://github.com/xuchengpeng/nvim/commit/a72b2ed2bbccc3834697b4896a47e1856a9b7d76))
* **colorscheme:** add nord theme ([2e2c636](https://github.com/xuchengpeng/nvim/commit/2e2c636e75c25caca22ddc262630c05d787b5058))
* **illuminate:** no highlighting for help ([0e97da4](https://github.com/xuchengpeng/nvim/commit/0e97da42f02bf09643000fcaef97a0603adc8d1f))
* **lua_ls:** do not check third party ([3ea8b93](https://github.com/xuchengpeng/nvim/commit/3ea8b938de408926a9c18773057782039ee2719e))
* **telescope:** remove live-grep-args extension ([140010b](https://github.com/xuchengpeng/nvim/commit/140010b2dd61fedca9a3ecbea6e72ae1d3b4712a))

## [1.7.5](https://github.com/xuchengpeng/nvim/compare/v1.7.4...v1.7.5) (2023-03-18)


### Bug Fixes

* **cmp:** tab mapping with luasnip ([b26110b](https://github.com/xuchengpeng/nvim/commit/b26110b7ed1104bb182b8b708f58ff246893e960))
* don't show intro and ins-completion-menu messages ([1baa51e](https://github.com/xuchengpeng/nvim/commit/1baa51e54615d866518bdfabf3e7f14e24e84f1f))
* **indent:** indent vim with 2 spaces ([97fae2a](https://github.com/xuchengpeng/nvim/commit/97fae2ace105548e4573d36f45d9c91af04bcefa))
* **keymaps:** remove ToggleFormatOnSave ([056ba74](https://github.com/xuchengpeng/nvim/commit/056ba746c7c1d0d641d066ead3efe9a25c57f70d))
* **null-ls:** add eslint support ([dcf5c14](https://github.com/xuchengpeng/nvim/commit/dcf5c1455a3351730bd1bfdc4d23d08472a19436))
* **null-ls:** add gitsigns code actions ([ae91838](https://github.com/xuchengpeng/nvim/commit/ae91838a6330d1d4937f785e0d2ec67598fd86d5))
* **null-ls:** format html,json,jsonc,yaml,markdown with prettier ([f3908b6](https://github.com/xuchengpeng/nvim/commit/f3908b6a9ab127d123b9eb371a31a99bf6d82427))
* **null-ls:** run eslint.cmd on Windows ([37faee7](https://github.com/xuchengpeng/nvim/commit/37faee76ff87812f79900d1a7b29826f6762a360))
* **null-ls:** run prettier.cmd on Windows ([2f61019](https://github.com/xuchengpeng/nvim/commit/2f6101977ab61455a2c0f8fcf232e5a0befa3045))
* **toggleterm:** typo ([a430969](https://github.com/xuchengpeng/nvim/commit/a4309694ebe52adeb72e7551ed824b21bcb9e786))
* **toggleterm:** use powershell on Windows ([ed6785e](https://github.com/xuchengpeng/nvim/commit/ed6785e457b9788c17ca712895234549cf272795))

## [1.7.4](https://github.com/xuchengpeng/nvim/compare/v1.7.3...v1.7.4) (2023-03-17)


### Bug Fixes

* **colorscheme:** add catppuccin ([1431e7e](https://github.com/xuchengpeng/nvim/commit/1431e7e2fd755f460d6dd9de0ba78f6f31948500))
* **colorscheme:** trigger ColorScheme event when setting colorscheme ([d9f927e](https://github.com/xuchengpeng/nvim/commit/d9f927e52e770e537cd3c016c733442e8ceac8d5))
* **lsp:** add pyright,vimls,bashls ([2a8d307](https://github.com/xuchengpeng/nvim/commit/2a8d307e50f34a1314cde373ac1a6078080b5fc1))
* **toggleterm:** open horizontal terminal with &lt;leader&gt;tt ([5aa9378](https://github.com/xuchengpeng/nvim/commit/5aa9378cc242d5b4b44a37c623c192c726a3bc61))

## [1.7.3](https://github.com/xuchengpeng/nvim/compare/v1.7.2...v1.7.3) (2023-03-16)


### Bug Fixes

* **theme:** support set colorscheme interface ([390de5d](https://github.com/xuchengpeng/nvim/commit/390de5d2dac55f0b773ef2ff8d95f9940f34a004))

## [1.7.2](https://github.com/xuchengpeng/nvim/compare/v1.7.1...v1.7.2) (2023-03-16)


### Bug Fixes

* **alpha:** hide statusline ([161521d](https://github.com/xuchengpeng/nvim/commit/161521d2588e339c39e27228e8d061f4be701bac))
* **alpha:** update footer after UIEnter ([2124e99](https://github.com/xuchengpeng/nvim/commit/2124e99ceca11bfd6e19fe97debf86862f2e66d6))
* **autopairs:** add toggle interface ([5091765](https://github.com/xuchengpeng/nvim/commit/5091765863ef94b62d5a08c55d4fde03cabcec35))
* **clangd:** customize cmd params ([bec5208](https://github.com/xuchengpeng/nvim/commit/bec52083433192225e014bb31ac4451af8a59b0a))
* **indent:** add set indent interface ([b5b927d](https://github.com/xuchengpeng/nvim/commit/b5b927df516b4f5eb5431568f43a54fd348602e7))
* **lazy:** add plugins keymaps ([034fa8e](https://github.com/xuchengpeng/nvim/commit/034fa8e0955347d1b68de23aee4cd055b7c7dfbf))
* **lualine:** enable aerial on winbar ([f86e781](https://github.com/xuchengpeng/nvim/commit/f86e781d2370ae936179f6d1b1583fd8e35c0a57))
* **statusline:** support toggle statusline ([3ae6a44](https://github.com/xuchengpeng/nvim/commit/3ae6a44768b0cb8ea378da9076cf3aae79dcf127))
* support toggle number ([4fe60be](https://github.com/xuchengpeng/nvim/commit/4fe60be188c60118e9f64187a23bc8e5a1fd9a38))
* support toggle wrap ([d64e604](https://github.com/xuchengpeng/nvim/commit/d64e604b2a72b02870d14cc557c5a34b30660a5e))
* **treesitter:** remove context support ([64057d7](https://github.com/xuchengpeng/nvim/commit/64057d7f4e06b920a4a3bb636c5ecfa178b03f20))
* **ui:** add background toggle interface ([2509649](https://github.com/xuchengpeng/nvim/commit/2509649c7c7025d2bc6076998e147764d7190ee3))

## [1.7.1](https://github.com/xuchengpeng/nvim/compare/v1.7.0...v1.7.1) (2023-03-15)


### Bug Fixes

* **aerial:** display all symbols ([4f99a95](https://github.com/xuchengpeng/nvim/commit/4f99a95301f9abd28e4ea71b65655c894402233f))
* **telescope:** load extensions if available ([631721d](https://github.com/xuchengpeng/nvim/commit/631721d61688f39669f405dba217bca079369a1a))

## [1.7.0](https://github.com/xuchengpeng/nvim/compare/v1.6.11...v1.7.0) (2023-03-15)


### Features

* **lsp:** support formatting on save ([667b152](https://github.com/xuchengpeng/nvim/commit/667b1527be34f16373bb0fcaad3170137ac7a884))


### Bug Fixes

* go to last loc when opening a buffer ([8021194](https://github.com/xuchengpeng/nvim/commit/802119481652f85b02977248781d8f7ad0d729bb))

## [1.6.11](https://github.com/xuchengpeng/nvim/compare/v1.6.10...v1.6.11) (2023-03-14)


### Bug Fixes

* add function descriptions ([e83b660](https://github.com/xuchengpeng/nvim/commit/e83b660590fd845d1e4371c664cbfcd6ef59b775))
* **alpha:** open configuration with neo-tree ([8b8510c](https://github.com/xuchengpeng/nvim/commit/8b8510c250e3ace3914315992b7e27e738634018))
* **lsp:** active lsp sooner ([366dadf](https://github.com/xuchengpeng/nvim/commit/366dadf5dc3f759070f7d83edaf8fba03afd87a2))

## [1.6.10](https://github.com/xuchengpeng/nvim/compare/v1.6.9...v1.6.10) (2023-03-14)


### Bug Fixes

* better notify ([38e8917](https://github.com/xuchengpeng/nvim/commit/38e8917c4b964a89172ee0c3b5fd0edf0cf9e76c))
* **cmp:** disable scrollbar of completion window ([273af2d](https://github.com/xuchengpeng/nvim/commit/273af2d50c334707bd28f47ee666f8664eb3884b))
* **neotree:** toggle Neotree by default ([3bbb31c](https://github.com/xuchengpeng/nvim/commit/3bbb31c7fa58a526f2b505f52545c4e87fd6d0c7))
* replace nvim-tree with neo-tree ([3e3cf2d](https://github.com/xuchengpeng/nvim/commit/3e3cf2db2c58eb9d2953d70857c3f088de509cc7))
* **theme:** better notify ([8b6e6b2](https://github.com/xuchengpeng/nvim/commit/8b6e6b246ca27bbfacac0a0af1bf6ebe303eb706))

## [1.6.9](https://github.com/xuchengpeng/nvim/compare/v1.6.8...v1.6.9) (2023-03-14)


### Bug Fixes

* append &lt;,&gt;,[,],h,l to whichwrap ([c2b0057](https://github.com/xuchengpeng/nvim/commit/c2b005706b64ae64cc2581053caedb086d525c78))
* **utils:** join path segments that were passed as input ([9c3fbe0](https://github.com/xuchengpeng/nvim/commit/9c3fbe0a4972ae763b4a28a6179623aad66aef53))

## [1.6.8](https://github.com/xuchengpeng/nvim/compare/v1.6.7...v1.6.8) (2023-03-13)


### Bug Fixes

* active plugins on User FileOpened event ([809029f](https://github.com/xuchengpeng/nvim/commit/809029fddcf536e856c677bbc421571eee4120c1))

## [1.6.7](https://github.com/xuchengpeng/nvim/compare/v1.6.6...v1.6.7) (2023-03-13)


### Bug Fixes

* **cmp:** cmp-cmdline enabled on CmdlineEnter ([584a6f1](https://github.com/xuchengpeng/nvim/commit/584a6f1dd9fa4b7322ea5e24450c5e29bc123b5e))
* **nvim-tree:** open Explorer with NvimTreeFindFileToggle ([b312545](https://github.com/xuchengpeng/nvim/commit/b312545543b05c54440c91354444142952979fd6))
* **ui:** remove noice ([8d36a1c](https://github.com/xuchengpeng/nvim/commit/8d36a1cdbf4c3a5d4297e7fa14c8f70fcc3552df))

## [1.6.6](https://github.com/xuchengpeng/nvim/compare/v1.6.5...v1.6.6) (2023-03-11)


### Bug Fixes

* **alpla:** customize menus ([3fa8523](https://github.com/xuchengpeng/nvim/commit/3fa85239e76df505780a5714d98c5df855391868))
* **cmp:** add friendly-snippets ([6326464](https://github.com/xuchengpeng/nvim/commit/6326464db8c9b89361b86d3d0e8ee72f0fe7f297))
* **cmp:** add window border ([248d0ba](https://github.com/xuchengpeng/nvim/commit/248d0ba7fd805e8c8733b6f59d166b90cae3ac75))
* ensure plenary.nvim installed ([6c7edd9](https://github.com/xuchengpeng/nvim/commit/6c7edd978531389d4b4cd1eabf16d156aab76a4d))

## [1.6.5](https://github.com/xuchengpeng/nvim/compare/v1.6.4...v1.6.5) (2023-03-11)


### Bug Fixes

* **alpha:** add nvim version ([a9d11a9](https://github.com/xuchengpeng/nvim/commit/a9d11a91467a090f94c8ca1350a9f723dc649e15))

## [1.6.4](https://github.com/xuchengpeng/nvim/compare/v1.6.3...v1.6.4) (2023-03-11)


### Bug Fixes

* **alpha:** add plugins startup time ([371a2a8](https://github.com/xuchengpeng/nvim/commit/371a2a86f41674d91b6f127f654fa1229e9faee4))

## [1.6.3](https://github.com/xuchengpeng/nvim/compare/v1.6.2...v1.6.3) (2023-03-10)


### Bug Fixes

* **alpha:** customize menu icons ([eed1575](https://github.com/xuchengpeng/nvim/commit/eed1575701216034a458b7573203894cef7839b2))
* **cmp:** customize the appearance of the completion menu with icons ([21bac07](https://github.com/xuchengpeng/nvim/commit/21bac0782a0d0aaa375547c3dbbd2f59191ce4ef))
* **noice:** configure notify ([a08647c](https://github.com/xuchengpeng/nvim/commit/a08647c2a6e77f9681d9de9a199fe9af386f3441))
* **telescope:** add mappings ([c3e340e](https://github.com/xuchengpeng/nvim/commit/c3e340ef01004f483cb510e330be57e09abf1aaa))

## [1.6.2](https://github.com/xuchengpeng/nvim/compare/v1.6.1...v1.6.2) (2023-03-10)


### Bug Fixes

* **dap:** close dap-float with q ([02a4477](https://github.com/xuchengpeng/nvim/commit/02a44776e11b76ad37a007d4519024a501ed68d0))
* **keymaps:** add standard operations ([1889a4a](https://github.com/xuchengpeng/nvim/commit/1889a4a6ceb3bae00d0a73b2ecba6b96c46ed8bf))
* **telescope:** path display truncate ([96b08d9](https://github.com/xuchengpeng/nvim/commit/96b08d91bb1b6558a698463e897741ca4a98c486))

## [1.6.1](https://github.com/xuchengpeng/nvim/compare/v1.6.0...v1.6.1) (2023-03-09)


### Bug Fixes

* **illuminate:** no highlighting for aerial,lspinfo ([aecc031](https://github.com/xuchengpeng/nvim/commit/aecc03135f9b7e79bfddfc305fbef6fbd376932c))

## [1.6.0](https://github.com/xuchengpeng/nvim/compare/v1.5.2...v1.6.0) (2023-03-09)


### Features

* refactor plugins management ([8ecdd7f](https://github.com/xuchengpeng/nvim/commit/8ecdd7f3ae8140acc46df5546965652a6d530789))


### Bug Fixes

* **keymaps:** camelcase keymaps descriptions ([2269ba1](https://github.com/xuchengpeng/nvim/commit/2269ba13629346fd1f9008684204642810ee438e))
* **telescope:** load aerial extension if available ([fb8b4bb](https://github.com/xuchengpeng/nvim/commit/fb8b4bbbbc6820e0e29eaee0c8a97eecb5a55ed6))

## [1.5.2](https://github.com/xuchengpeng/nvim/compare/v1.5.1...v1.5.2) (2023-03-08)


### Bug Fixes

* **lualine:** hide statusline for alpha,lazy ([1b9b8cc](https://github.com/xuchengpeng/nvim/commit/1b9b8cc97fc8c3c8207781f8595b2e18c803bfdb))
* **terminal:** bind python with &lt;leader&gt;tp ([3a58490](https://github.com/xuchengpeng/nvim/commit/3a584905aaa5ede60c2eef752f2f941cef3082cb))

## [1.5.1](https://github.com/xuchengpeng/nvim/compare/v1.5.0...v1.5.1) (2023-03-08)


### Bug Fixes

* **null-ls:** format python with black ([5d95d06](https://github.com/xuchengpeng/nvim/commit/5d95d0642bd64764af70352f596f6afc36e0aad1))

## [1.5.0](https://github.com/xuchengpeng/nvim/compare/v1.4.1...v1.5.0) (2023-03-07)


### Features

* **ui:** use aerial as code outline window ([932aa12](https://github.com/xuchengpeng/nvim/commit/932aa121431ecbab9e5d83a1f0abcff64de4067b))


### Bug Fixes

* **keymaps:** add git next_hunk,prev_hunk keymaps ([bd26a1f](https://github.com/xuchengpeng/nvim/commit/bd26a1f03c896684a03e260b5b5c3629f07d047b))

## [1.4.1](https://github.com/xuchengpeng/nvim/compare/v1.4.0...v1.4.1) (2023-03-07)


### Bug Fixes

* **lsp:** proper keymaps ([9b1ddc0](https://github.com/xuchengpeng/nvim/commit/9b1ddc0c8a8e4db09c9a076243ddeafd0cb9d9f3))
* **lsp:** remove Lspsaga ([1a18113](https://github.com/xuchengpeng/nvim/commit/1a181135cda481e257bf320af8af61a4693648b8))

## [1.4.0](https://github.com/xuchengpeng/nvim/compare/v1.3.1...v1.4.0) (2023-03-07)


### Features

* **null-ls:** formatting with stylua,shfmt ([e780002](https://github.com/xuchengpeng/nvim/commit/e7800024368087a322a84c856d5284321655b1a8))


### Bug Fixes

* autoread after 200ms ([009e66d](https://github.com/xuchengpeng/nvim/commit/009e66df04bbf402e0e2a949af079f6fc2787748))
* **lsp:** add code_action,hover_doc keymaps ([722ab48](https://github.com/xuchengpeng/nvim/commit/722ab4886858038be384d869efdd0ea7119fceb9))

## [1.3.1](https://github.com/xuchengpeng/nvim/compare/v1.3.0...v1.3.1) (2023-03-06)


### Bug Fixes

* set number column width to 2 ([656d795](https://github.com/xuchengpeng/nvim/commit/656d795b775ce2cdca0a8c4859d98fd08cc1f5e5))

## [1.3.0](https://github.com/xuchengpeng/nvim/compare/v1.2.3...v1.3.0) (2023-03-06)


### Features

* **dressing:** improve the default vim.ui interfaces ([e192c13](https://github.com/xuchengpeng/nvim/commit/e192c133db0ee22664ff79abe3162c50f5c0c814))
* **glow:** markdown preview using glow ([6ade8c2](https://github.com/xuchengpeng/nvim/commit/6ade8c275d543e83f4755e6362c6b35ecd38e53f))
* **keymaps:** load default keymaps ([63e0bfe](https://github.com/xuchengpeng/nvim/commit/63e0bfee27f4cebc04915e3b2d3a1465537a7ded))


### Bug Fixes

* **alpha:** improve menu ([4eaa1ac](https://github.com/xuchengpeng/nvim/commit/4eaa1acc5ebd05ffd2dd3ebcbecb8e22de2c07e8))
* **illuminate:** no highlighting for lspsagaoutline ([be9d1be](https://github.com/xuchengpeng/nvim/commit/be9d1be0b41b17e158bfa49df439112d6d7f4796))

## [1.2.3](https://github.com/xuchengpeng/nvim/compare/v1.2.2...v1.2.3) (2023-03-06)


### Bug Fixes

* **illuminate:** enable with BufReadPost,BufNewFile event ([e4eb2ec](https://github.com/xuchengpeng/nvim/commit/e4eb2ec56dfa7fdd16ebffc8a73f0810085831d6))
* **lspsaga:** enable with BufRead,BufNewFile event ([0f7c047](https://github.com/xuchengpeng/nvim/commit/0f7c047fcdb9bb5058ef08514a9d1e07f90ceb81))
* **nvim-tree:** bind nvim-tree with &lt;leader&gt;ce ([ac99bed](https://github.com/xuchengpeng/nvim/commit/ac99bedf10aab7087fc3ed5aad1a6a8ece4c4223))
* remote lir support ([b4bccd0](https://github.com/xuchengpeng/nvim/commit/b4bccd08a23e6ba10d04426e2705ea0e3b2265d0))

## [1.2.2](https://github.com/xuchengpeng/nvim/compare/v1.2.1...v1.2.2) (2023-03-06)


### Bug Fixes

* **treesitter:** ensure luap installed ([2bd7ce8](https://github.com/xuchengpeng/nvim/commit/2bd7ce840f6fb24d8f7f6a2c9b02aeeeee0e1c16))

## [1.2.1](https://github.com/xuchengpeng/nvim/compare/v1.2.0...v1.2.1) (2023-03-04)


### Bug Fixes

* **treesj:** depend on nvim-treesitter ([93c62c0](https://github.com/xuchengpeng/nvim/commit/93c62c0114318a46003beae3839c50158f7c80cd))

## [1.2.0](https://github.com/xuchengpeng/nvim/compare/v1.1.0...v1.2.0) (2023-03-04)


### Features

* **editor:** better splitting/joining blocks ([f70e348](https://github.com/xuchengpeng/nvim/commit/f70e3487dd2e58d5508e30c78209b2a3195b2bff))


### Bug Fixes

* **terminal:** bind btm with &lt;leader&gt;tb ([53c2d97](https://github.com/xuchengpeng/nvim/commit/53c2d97e02f9bdfad0482babb891b847ce7ab185))
* **terminal:** bind gdu with &lt;leader&gt;td ([823680b](https://github.com/xuchengpeng/nvim/commit/823680b69e671d3ae3bbd849c43c9efa3ec0b58a))

## [1.1.0](https://github.com/xuchengpeng/nvim/compare/v1.0.4...v1.1.0) (2023-03-04)


### Features

* **ci:** auto release ([2d0b1fe](https://github.com/xuchengpeng/nvim/commit/2d0b1fe407805bec221ccff908ec300020d5c62b))

## [1.0.4](https://github.com/xuchengpeng/nvim/compare/v1.0.3...v1.0.4) (2023-03-02)

### Features

* **lsp:** replace vsnip with luasnip
* **treesitter:** ensure bash,regex installed
* **theme:** remove catppuccin
