return require("packer").startup({
  function(use)
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    }
  }
})

