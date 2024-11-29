if vim.g.neovide then
  ---- ディスプレイの設定
  -- フォントの設定
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h10"
  vim.o.guifont = "UDEV Gothic 35NFLG:h11:Consolas"
  -- リフレッシュレート
  vim.g.neovide_refresh_rate = 60
  -- フォーカスされていないときのリフレッシュ レート
  vim.g.neovide_refresh_rate_idle = 5

  -- 行間
  vim.opt.linespace = 0
  -- スケール：拡大率
  vim.g.neovide_scale_factor = 1.0
  -- パディング
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  ---- スクロールアニメーションの設定
  -- スクロールアニメーション
  vim.g.neovide_scroll_animation_length = 0.3
  -- スクロールアニメーションの行数
  vim.g.neovide_scroll_animation_far_lines = 5

  ---- カーソルアニメーションの設定
  -- アニメーションの長さ
  vim.g.neovide_cursor_animation_length = 0.05
  -- アニメーションの軌跡の長さ
  vim.g.neovide_cursor_trail_size = 0.8
  -- アンチエイリアス
  vim.g.neovide_cursor_antialiasing = true
  -- 挿入モードをアニメーション
  vim.g.neovide_cursor_animate_in_insert_mode = true
  -- コマンドラインへの切り替えをアニメーション
  vim.g.neovide_cursor_animate_command_line = true
  -- フォーカスされていないアウトラインの幅
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  -- カーソルの点滅をアニメーション化
  vim.g.neovide_cursor_smooth_blink = true

  -- 粒子
  -- 粒子の種類
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- パーティクルの透明度
  vim.g.neovide_cursor_vfx_opacity = 200.0
  -- パーティクルが存続する時間
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  -- パーティクルの数
  vim.g.neovide_cursor_vfx_particle_density = 9.0
  -- パーティクルの速度
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  -- パーティクルの質量移動
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  -- パーティクルの回転速度
  vim.g.neovide_cursor_vfx_particle_curl = 1.0

  --- Neovideを透明にする設定
  -- 不透明度の設定
  vim.g.neovide_transparency = 0.9
  -- 境界線を表示(不透明なウィンドウの周囲にのみ灰色の境界線を表示)
  vim.g.neovide_show_border = true

  -- フローティングやポップアップを完全に透明にする
  -- vim.opt.winblend = 100
  -- vim.opt.pumblend = 100
  -- フローティングやポップアップを完全に透明にしない
  -- vim.opt.winblend = 0
  -- vim.opt.pumblend = 0
  -- フローティングやポップアップの透明度
  vim.opt.winblend = 20
  vim.opt.pumblend = 20

  -- ウィンドウサイズを記憶
  vim.g.neovide_remember_window_size = true

  ---- IMEの設定
  local function set_ime(args)
    if args.event:match("Enter$") then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  })

  -- プロファイラを有効にする
  vim.g.neovide_profiler = true
end
