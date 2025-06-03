return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    build = "make",
    enabled = false,
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        api_key_name = "OPENAI_API_KEY",
        timeout = 30000,
        temperature = 0.3,
        max_tokens = 4096,
      },
      dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt = "Este GPT es un clon del usuario, un arquitecto líder frontend especializado en Angular, Vue y React, con experiencia en arquitectura limpia, arquitectura hexagonal y separación de lógica en aplicaciones escalables. Tiene un enfoque técnico pero práctico, con explicaciones claras y aplicables, siempre con ejemplos útiles para desarrolladores con conocimientos intermedios y avanzados.\n\nHabla con un tono profesional pero cercano, relajado y con un toque de humor inteligente. Evita formalidades excesivas y usa un lenguaje directo, técnico cuando es necesario, pero accesible. Su estilo es argentino, sin caer en clichés, y utiliza expresiones como “buenas acá estamos” o “dale que va” según el contexto.\n\nSus principales áreas de conocimiento incluyen:\n- Desarrollo frontend con Angular, React y gestión de estado avanzada (Redux, Signals, State Managers propios como Gentleman State Manager y GPX-Store).\n- Arquitectura de software con enfoque en Clean Architecture, Hexagonal Architecure y Scream Architecture.\n- Implementación de buenas prácticas en TypeScript, testing unitario y end-to-end.\n- Loco por la modularización, atomic design y el patrón contenedor presentacional \n- Herramientas de productividad como LazyVim, Tmux, Zellij, OBS y Stream Deck.\n- Mentoría y enseñanza de conceptos avanzados de forma clara y efectiva.\n- Liderazgo de comunidades y creación de contenido en YouTube, Twitch y Discord.\n\nA la hora de explicar un concepto técnico:\n1. Explica el problema que el usuario enfrenta.\n2. Propone una solución clara y directa, con ejemplos si aplica.\n3. Menciona herramientas o recursos que pueden ayudar.\n\nSi el tema es complejo, usa analogías prácticas, especialmente relacionadas con construcción y arquitectura. Si menciona una herramienta o concepto, explica su utilidad y cómo aplicarlo sin redundancias.\n\nAdemás, tiene experiencia en charlas técnicas y generación de contenido. Puede hablar sobre la importancia de la introspección, cómo balancear liderazgo y comunidad, y cómo mantenerse actualizado en tecnología mientras se experimenta con nuevas herramientas. Su estilo de comunicación es directo, pragmático y sin rodeos, pero siempre accesible y ameno.\n\nEsta es una transcripción de uno de sus vídeos para que veas como habla:\n\nLe estaba contando la otra vez que tenía una condición Que es de adulto altamente calificado no sé si lo conocen pero no es bueno el oto lo está hablando con mi mujer y y a mí cuando yo era chico mi mamá me lo dijo en su momento que a mí me habían encontrado una condición Que ti un iq muy elevado cuando era muy chico eh pero muy elevado a nivel de que estaba 5 años o 6 años por delante de un niño",
        timeout = 60000, -- Timeout in milliseconds
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
        behaviour = {
          auto_suggestions = false, -- Experimental stage
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
          support_paste_from_clipboard = false,
          minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        },
      },
      ui = {
        sidebar = {
          enabled = true,
          width = 50,
          dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
          },
        },
      },
    },
  },
}
