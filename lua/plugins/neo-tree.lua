return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
      },
      window = {
        mappings = {
          ["Y"] = function(state)
            -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
            -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
              filepath,
              modify(filepath, ":."),
              modify(filepath, ":~"),
              filename,
              modify(filename, ":r"),
              modify(filename, ":e"),
            }

            local messages = {
              "Choose to copy to clipboard:",
              "1. Absolute path: " .. results[1],
              "2. Path relative to CWD: " .. results[2],
              "3. Path relative to HOME: " .. results[3],
              "4. Filename: " .. results[4],
              "5. Filename without extension: " .. results[5],
              "6. Extension of the filename: " .. results[6],
            }
            vim.api.nvim_echo({ { table.concat(messages, "\n"), "Normal" } }, true, {})
            local i = vim.fn.getchar()

            if i >= 49 and i <= 54 then
              local result = results[i - 48]
              print(result)
              vim.fn.setreg("*", result)
            else
              print("Invalid choice: " .. string.char(i))
            end
          end,
        },
      },
    },
  },
}
