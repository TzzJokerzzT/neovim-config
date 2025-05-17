local prompts = {
  Explain = "Please explain how the following code works.", -- Prompt to explain code
  Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
  Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
  Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
  FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
  FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
  BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
  Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
  JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
  DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
  CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
  Summarize = "Please summarize the following text.", -- Prompt to summarize text
  Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
  Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
  Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    enabled = false,
    opts = {
      -- See Configuration section for options
      prompts = prompts,
      model = "DeepSeek-R1", -- Model to use, see Models section for available models
      answer_header = "󰓥 TzzJokerzzT 󱁝",
      window = {
        layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.7, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.7, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "rounded", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = "DeepSeek Chat", -- title of chat window
        footer = "Keep Programming you can do it", -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
      show_help = true, -- Shows help message as virtual lines when waiting for user input
      highlight_selection = true, -- Highlight selection
      highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
      references_display = "virtual", -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
      auto_follow_cursor = true, -- Auto-follow cursor in chat
      auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
      insert_at_end = false, -- Move cursor to end of buffer when inserting text
      clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
      chat_autocomplete = true,
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
