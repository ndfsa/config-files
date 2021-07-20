rofi_prompt()
{
	$1 | rofi -dmenu -p $2
}

confirm()
{
    case $(rofi_prompt "echo $1\n$2" "Sure?") in
        $2) $3;;
    esac
}
