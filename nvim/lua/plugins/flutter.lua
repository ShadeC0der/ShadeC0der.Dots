-- Flutter / Dart
--
-- El extra `lang.dart` de LazyVim aporta treesitter, `dart format` (conform) y
-- neotest, pero sólo arranca el LSP a pelo. Este archivo añade flutter-tools.nvim,
-- que es lo que te da la experiencia "de IDE": hot reload, elegir dispositivo,
-- logs de la app, etiquetas de cierre de widgets y abrir DevTools.
--
-- El SDK vive en ~/.local/share/flutter (clon de git, rama stable) y `flutter` y
-- `dart` están enlazados en ~/.local/bin. Actualizar: `flutter upgrade`.

return {
  -- flutter-tools arranca su PROPIO dartls. Si dejamos el del extra, tendríamos
  -- dos servidores en cada .dart (diagnósticos y completados duplicados).
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = { enabled = false },
      },
    },
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>F", "", desc = "+flutter", ft = "dart" },
      { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Run", ft = "dart" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Quit", ft = "dart" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Hot Restart", ft = "dart" },
      { "<leader>Fl", "<cmd>FlutterReload<cr>", desc = "Hot Reload", ft = "dart" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Devices", ft = "dart" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Emulators", ft = "dart" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Widget Outline", ft = "dart" },
      { "<leader>Fg", "<cmd>FlutterLogToggle<cr>", desc = "Toggle Log", ft = "dart" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Clear Log", ft = "dart" },
      { "<leader>Ft", "<cmd>FlutterDevTools<cr>", desc = "Open DevTools", ft = "dart" },
      { "<leader>Fp", "<cmd>FlutterPubGet<cr>", desc = "Pub Get", ft = "dart" },
    },
    opts = {
      -- Al guardar un .dart con la app corriendo, hot reload automático.
      hot_reload_on_save = true,
      -- Líneas que unen cada widget con sus hijos. En árboles de UI muy anidados
      -- (Scaffold > Column > Padding > Row...) ayudan a no perderse.
      widget_guides = { enabled = true },
      -- Texto virtual `// Column` tras el `)` de cierre de cada widget.
      closing_tags = { enabled = true, prefix = "// " },
      -- Los logs de `flutter run` en un split; no te roba el foco.
      dev_log = { enabled = true, open_cmd = "botright 15split", focus_on_open = false },
      -- Usa nvim-dap (ya lo tienes configurado) para depurar con breakpoints.
      debugger = { enabled = true },
      lsp = {
        color = { enabled = true }, -- muestra el color de `Colors.red`, `Color(0xFF...)`
        settings = {
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          updateImportsOnRename = true,
        },
      },
    },
  },
}
