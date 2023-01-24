-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}


