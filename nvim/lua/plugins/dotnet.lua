-- C# / .NET
--
-- LazyVim trae el extra `lang.dotnet`, pero sigue usando OmniSharp, que Microsoft
-- descontinuó. Este archivo lo sustituye por el servidor Roslyn: el mismo que usa
-- la extensión oficial de C# en VS Code, y el único que entiende de verdad las
-- versiones modernas del lenguaje (.NET 10, colecciones, primary constructors...).
--
-- El binario se instala aparte, fuera de Mason:
--   dotnet tool install -g roslyn-language-server --prerelease \
--     --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json

-- Neovim hereda el PATH de quien lo lanza. Si abres nvim desde un lanzador de
-- escritorio en vez de una terminal, ~/.dotnet/tools puede no estar. Lo forzamos.
local dotnet_tools = vim.fn.expand("~/.dotnet/tools")
if not string.find(vim.env.PATH, dotnet_tools, 1, true) then
  vim.env.PATH = vim.env.PATH .. ":" .. dotnet_tools
end

return {
  -- Apagamos OmniSharp: lo activaba el extra lang.dotnet.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
      },
    },
  },

  -- El servidor Roslyn de verdad.
  {
    "seblyng/roslyn.nvim",
    -- Sin lazy-loading a propósito. `plugin/roslyn.lua` llama a vim.lsp.enable("roslyn"),
    -- que registra un autocmd de FileType. Si cargásemos con ft="cs", el plugin se
    -- cargaría POR ese evento y registraría el autocmd demasiado tarde para el primer
    -- buffer. Arrancar en frío no cuesta nada: el servidor sólo se lanza al abrir un .cs.
    lazy = false,
    opts = {
      -- Busca .sln/.slnx también en subdirectorios. Útil con layout src/Proyecto.
      broad_search = true,
      -- Una vez elegida la solución, no volver a preguntar en esa sesión.
      lock_target = true,
    },
    init = function()
      vim.lsp.config("roslyn", {
        settings = {
          -- Pistas en línea: te muestra los tipos que C# infiere pero no escribes.
          -- Para aprender el lenguaje esto vale oro: ves qué es realmente cada `var`.
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          },
          -- "N referencias" encima de cada método: te dice quién usa qué.
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
          -- Autocompletado que importa el namespace solo al aceptar la sugerencia.
          ["csharp|completion"] = {
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          -- Analiza toda la solución, no sólo los archivos abiertos.
          -- Más lento al arrancar, pero ves errores en archivos que no has abierto.
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
          },
        },
      })
    end,
  },
}
