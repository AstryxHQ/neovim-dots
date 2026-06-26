return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon: add file",
    },
    {
      "<leader>h",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon: Toggle menu",
    },
    {
      "<A-s>",
      function()
        require("harpoon.ui").nav_file(1)
      end,
    },
    {
      "<A-t>",
      function()
        require("harpoon.ui").nav_file(2)
      end,
    },
    {
      "<A-h>",
      function()
        require("harpoon.ui").nav_file(3)
      end,
    },
    {
      "<A-n>",
      function()
        require("harpoon.ui").nav_file(4)
      end,
    },
  },
}
