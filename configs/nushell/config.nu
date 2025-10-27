$env.config.show_banner = false

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Initialize zoxide
zoxide init nushell | save -f ($nu.home-path | path join ".zoxide.nu")
if (($nu.home-path | path join ".zoxide.nu") | path exists) {
    source ($nu.home-path | path join ".zoxide.nu")
}