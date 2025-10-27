$env.config.show_banner = false

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Initialize zoxide
let zoxide_file = ($nu.home-path | path join ".zoxide.nu")
zoxide init nushell | save -f $zoxide_file
source $zoxide_file