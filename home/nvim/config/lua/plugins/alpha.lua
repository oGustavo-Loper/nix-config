return {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")
      dashboard.section.header.val = {
        [[]],
        [[88888888ba,                                         88                                                            ]],
        [[88      `"8b                                        88                                                            ]],
        [[88        `8b                                       88                                                            ]],
        [[88         88   ,adPPYba,  8b       d8   ,adPPYba,  88           ,adPPYba,   8b,dPPYba,    ,adPPYba,  8b,dPPYba,  ]],
        [[88         88  a8P_____88  `8b     d8'  a8P_____88  88          a8"     "8a  88P'    "8a  a8P_____88  88P'   "Y8  ]],
        [[88         8P  8PP"""""""   `8b   d8'   8PP"""""""  88          8b       d8  88       d8  8PP"""""""  88          ]],
        [[88      .a8P   "8b,   ,aa    `8b,d8'    "8b,   ,aa  88          "8a,   ,a8"  88b,   ,a8"  "8b,   ,aa  88          ]],
        [[88888888Y"'     `"Ybbd8"'      "8"       `"Ybbd8"'  88888888888  `"YbbdP"'   88`YbbdP"'    `"Ybbd8"'  88          ]],
        [[                                                                             88                                   ]],
        [[                                                                             88                                   ]],
        [[Copiar código: (y)                                                                                                ]],
        [[Recortar código: (c)                                                                                              ]],
        [[Desfazer: (C+u)                                                                                                   ]],
        [[Refazer: (C+r)                                                                                                    ]],
      }
      dashboard.section.header.opts = {
        position = "center",
        hl = "Type",
      }
  
      dashboard.section.terminal = {
        type = "terminal",
        command = nil,
        width = 69,
        height = 8,
        opts = {
          redraw = true,
          window_config = {},
        },
      }
  
      dashboard.section.buttons = {
        opts = {
          position = "center",
        },
      }
      dashboard.section.footer = {
        type = "text",
        opts = {
          position = "center",
          hl = "Number",
        },
      }
  
      alpha.setup(dashboard.opts)
    end,
  }
  
