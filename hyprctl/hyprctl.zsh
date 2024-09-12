_hyprctl_cmd_0 () {
    hyprctl monitors | awk '/Monitor/{ print $2 }'
}

_hyprctl_cmd_2 () {
    hyprctl clients | awk '/class/{print $2}'
}

_hyprctl_cmd_1 () {
    hyprctl devices | sed -n '/Keyboard at/{n; s/^\s\+//; p}'
}

_hyprctl_cmd_3 () {
    hyprpm list | awk '/Plugin/{print $4}'
}

_hyprctl () {
    local -a literals=("config-only" "cyclenext" "cursorpos" "bordersize" "renameworkspace" "animationstyle" "focuswindow" "--help" "-f" "auto" "0" "swapnext" "forceallowsinput" "moveactive" "activebordercolor" "alphafullscreen" "wayland" "layers" "minsize" "monitors" "1" "kill" "settiled" "3" "focusmonitor" "swapwindow" "moveoutofgroup" "notify" "movecursor" "setcursor" "movecurrentworkspacetomonitor" "4" "seterror" "nomaxsize" "1" "forcenoanims" "setprop" "-i" "-q" "bulkrenameworkspaces" "togglefloating" "3" "workspacerules" "movetoworkspace" "globalshortcuts" "setignoregrouplock" "disable" "workspaces" "movegroupwindow" "closewindow" "0" "0" "binds" "movewindow" "splitratio" "alpha" "denywindowfromgroup" "workspace" "configerrors" "togglegroup" "getoption" "--instance" "forceopaque" "keepaspectratio" "-h" "killactive" "pass" "event" "decorations" "devices" "focuscurrentorlast" "submap" "global" "alphafullscreenoverride" "headless" "forcerendererreload" "movewindowpixel" "version" "dpms" "resizeactive" "moveintogroup" "2" "5" "alphaoverride" "setfloating" "rollinglog" "::=" "rounding" "layouts" "moveworkspacetomonitor" "exec" "alphainactiveoverride" "alterzorder" "-1" "fakefullscreen" "nofocus" "animations" "keyword" "forcenoborder" "forcenodim" "--quiet" "pin" "output" "forcenoblur" "togglespecialworkspace" "fullscreen" "toggleopaque" "focusworkspaceoncurrentmonitor" "next" "changegroupactive" "-j" "instances" "execr" "exit" "clients" "descriptions" "all" "--batch" "dismissnotify" "inactivebordercolor" "switchxkblayout" "movetoworkspacesilent" "fullscreenstate" "tagwindow" "movewindoworgroup" "-r" "movefocus" "focusurgentorlast" "remove" "activeworkspace" "dispatch" "create" "centerwindow" "2" "hyprpaper" "-1" "reload" "alphainactive" "systeminfo" "plugin" "dimaround" "activewindow" "bulkswitchworkspaces" "swapactiveworkspaces" "sendshortcut" "splash" "maxsize" "lockactivegroup" "windowdancecompat" "forceopaqueoverriden" "x11" "lockgroups" "movecursortocorner" "prev" "1" "resizewindowpixel" "forcenoshadow")

    local -A descriptions
    descriptions[2]="Focus the next window on a workspace"
    descriptions[3]="Get the current cursor pos in global layout coordinates"
    descriptions[5]="Rename a workspace"
    descriptions[7]="Focus the first window matching"
    descriptions[8]="Prints the help message"
    descriptions[12]="Swap the focused window with the next window"
    descriptions[14]="Move the active window"
    descriptions[18]="List the layers"
    descriptions[20]="List active outputs with their properties"
    descriptions[22]="Get into a kill mode, where you can kill an app by clicking on it"
    descriptions[23]="Set the current window's floating state to false"
    descriptions[24]="ERROR"
    descriptions[25]="Focus a monitor"
    descriptions[26]="Swap the active window with another window"
    descriptions[27]="Move the active window out of a group"
    descriptions[28]="Send a notification using the built-in Hyprland notification system"
    descriptions[29]="Move the cursor to a specified position"
    descriptions[30]="Set the cursor theme and reloads the cursor manager"
    descriptions[31]="Move the active workspace to a monitor"
    descriptions[32]="CONFUSED"
    descriptions[33]="Set the hyprctl error string"
    descriptions[35]="Maximize no fullscreen"
    descriptions[37]="Set a property of a window"
    descriptions[38]="Specify the Hyprland instance"
    descriptions[39]="Disable output"
    descriptions[40]="Rename workspaces in bulk"
    descriptions[41]="Toggle the current window's floating state"
    descriptions[42]="Maximize and fullscreen"
    descriptions[43]="Get the list of defined workspace rules"
    descriptions[44]="Move the focused window to a workspace"
    descriptions[45]="Lists all global shortcuts"
    descriptions[46]="Temporarily enable or disable binds:ignore_group_lock"
    descriptions[48]="List all workspaces with their properties"
    descriptions[49]="Swap the active window with the next or previous in a group"
    descriptions[50]="Close a specified window"
    descriptions[51]="None"
    descriptions[52]="WARNING"
    descriptions[53]="List all registered binds"
    descriptions[54]="Move the active window in a direction or to a monitor"
    descriptions[55]="Change the split ratio"
    descriptions[57]="Prohibit the active window from becoming or being inserted into group"
    descriptions[58]="Change the workspace"
    descriptions[59]="List all current config parsing errors"
    descriptions[60]="Toggle the current active window into a group"
    descriptions[61]="Get the config option status (values)"
    descriptions[62]="Specify the Hyprland instance"
    descriptions[65]="Prints the help message"
    descriptions[66]="Close the active window"
    descriptions[67]="Pass the key to a specified window"
    descriptions[68]="Emits a custom event to socket2"
    descriptions[69]="List all decorations and their info"
    descriptions[70]="List all connected keyboards and mice"
    descriptions[71]="Switch focus from current to previously focused window"
    descriptions[72]="Change the current mapping group"
    descriptions[73]="Execute a Global Shortcut using the GlobalShortcuts portal"
    descriptions[76]="Force the renderer to reload all resources and outputs"
    descriptions[77]="Move a selected window"
    descriptions[78]="Print the Hyprland version: flags, commit and branch of build"
    descriptions[79]="Set all monitors' DPMS status"
    descriptions[80]="Resize the active window"
    descriptions[81]="Move the active window into a group"
    descriptions[82]="Fullscreen"
    descriptions[83]="OK"
    descriptions[85]="Set the current window's floating state to true"
    descriptions[86]="Print tail of the log"
    descriptions[89]="List all layouts available (including plugin ones)"
    descriptions[90]="Move a workspace to a monitor"
    descriptions[91]="Execute a shell command"
    descriptions[93]="Modify the window stack order of the active or specified window"
    descriptions[94]="Current"
    descriptions[95]="Toggle the focused window's internal fullscreen state"
    descriptions[97]="Gets the current config info about animations and beziers"
    descriptions[98]="Issue a keyword to call a config keyword dynamically"
    descriptions[101]="Disable output"
    descriptions[102]="Pin a window"
    descriptions[103]="Allows adding/removing fake outputs to a specific backend"
    descriptions[105]="Toggle a special workspace on/off"
    descriptions[106]="Toggle the focused window's fullscreen state"
    descriptions[107]="Toggle the current window to always be opaque"
    descriptions[108]="Focus the requested workspace"
    descriptions[110]="Switch to the next window in a group"
    descriptions[111]="Output in JSON format"
    descriptions[112]="List all running Hyprland instances and their info"
    descriptions[113]="Execute a raw shell command"
    descriptions[114]="Exit the compositor with no questions asked"
    descriptions[115]="List all windows with their properties"
    descriptions[116]="Return a parsable JSON with all the config options, descriptions, value types and ranges"
    descriptions[118]="Execute a batch of commands separated by ;"
    descriptions[119]="Dismiss all or up to amount of notifications"
    descriptions[121]="Set the xkb layout index for a keyboard"
    descriptions[122]="Move window doesnt switch to the workspace"
    descriptions[123]="Sets the focused window’s fullscreen mode and the one sent to the client"
    descriptions[124]="Apply a tag to the window"
    descriptions[125]="Behave as moveintogroup"
    descriptions[126]="Refresh state after issuing the command"
    descriptions[127]="Move the focus in a direction"
    descriptions[128]="Focus the urgent window or the last window"
    descriptions[130]="Get the active workspace name and its properties"
    descriptions[131]="Issue a dispatch to call a keybind dispatcher with an arg"
    descriptions[133]="Center the active window"
    descriptions[134]="HINT"
    descriptions[135]="Interact with hyprpaper if present"
    descriptions[136]="No Icon"
    descriptions[137]="Force reload the config"
    descriptions[139]="Print system info"
    descriptions[140]="Interact with a plugin"
    descriptions[142]="Get the active window name and its properties"
    descriptions[143]="Switch workspaces in bulk"
    descriptions[144]="Swap the active workspaces between two monitors"
    descriptions[145]="On shortcut X sends shortcut Y to a specified window"
    descriptions[146]="Print the current random splash"
    descriptions[148]="Lock the focused group"
    descriptions[152]="Lock the groups"
    descriptions[153]="Move the cursor to the corner of the active window"
    descriptions[155]="INFO"
    descriptions[156]="Resize a selected window"

    local -A literal_transitions
    literal_transitions[1]="([116]=6 [119]=3 [86]=4 [37]=5 [39]=2 [3]=6 [89]=6 [121]=7 [43]=6 [45]=6 [126]=2 [48]=6 [8]=2 [53]=6 [97]=6 [98]=8 [131]=11 [130]=6 [61]=6 [101]=2 [59]=6 [103]=10 [135]=6 [65]=2 [137]=12 [139]=6 [18]=6 [69]=13 [70]=6 [20]=14 [140]=15 [22]=6 [142]=6 [146]=6 [28]=16 [78]=6 [111]=2 [112]=6 [30]=6 [33]=17 [115]=6 [118]=2)"
    literal_transitions[4]="([9]=6)"
    literal_transitions[5]="([84]=24 [16]=6 [36]=24 [63]=24 [64]=24 [104]=24 [120]=6 [138]=6 [88]=3 [19]=6 [141]=24 [4]=3 [6]=6 [74]=24 [147]=6 [149]=24 [92]=24 [150]=24 [96]=24 [34]=24 [56]=6 [15]=6 [99]=24 [13]=24 [100]=24 [157]=24)"
    literal_transitions[9]="([119]=3 [86]=4 [37]=5 [3]=6 [89]=6 [121]=7 [43]=6 [45]=6 [48]=6 [53]=6 [130]=6 [97]=6 [98]=8 [131]=11 [59]=6 [61]=6 [103]=10 [135]=6 [137]=12 [139]=6 [18]=6 [69]=13 [70]=6 [20]=14 [140]=15 [22]=6 [142]=6 [146]=6 [28]=16 [78]=6 [112]=6 [30]=6 [33]=17 [115]=6 [116]=6)"
    literal_transitions[10]="([132]=21 [129]=18)"
    literal_transitions[11]="([85]=6 [2]=6 [5]=6 [90]=6 [91]=6 [7]=6 [93]=6 [95]=6 [12]=6 [14]=6 [102]=6 [105]=6 [106]=6 [107]=6 [108]=6 [23]=6 [110]=6 [25]=6 [26]=6 [27]=6 [29]=6 [113]=6 [114]=6 [31]=6 [40]=6 [41]=6 [122]=6 [123]=23 [44]=6 [124]=6 [125]=6 [46]=6 [127]=6 [128]=6 [49]=6 [50]=6 [54]=6 [55]=6 [57]=6 [58]=6 [60]=6 [133]=6 [66]=6 [67]=6 [68]=6 [71]=6 [72]=6 [143]=6 [144]=6 [145]=6 [73]=6 [148]=6 [76]=6 [77]=6 [152]=6 [153]=6 [79]=6 [80]=6 [81]=6 [156]=6)"
    literal_transitions[12]="([1]=6)"
    literal_transitions[14]="([117]=6)"
    literal_transitions[16]="([24]=3 [134]=3 [32]=3 [155]=3 [136]=3 [52]=3 [83]=3)"
    literal_transitions[17]="([47]=6)"
    literal_transitions[19]="([87]=20)"
    literal_transitions[20]="([38]=2 [62]=2)"
    literal_transitions[21]="([10]=6 [75]=6 [17]=6 [151]=6)"
    literal_transitions[22]="([154]=6 [109]=6)"
    literal_transitions[23]="([35]=6 [42]=6 [82]=6 [51]=6 [94]=6)"
    literal_transitions[24]="([21]=6 [11]=6)"

    local -A match_anything_transitions
    match_anything_transitions=([1]=9 [18]=6 [6]=19 [7]=22 [4]=19 [9]=9 [14]=19 [12]=19 [13]=6 [22]=6 [17]=19 [15]=6 [3]=6 [8]=6)

    declare -A subword_transitions

    local state=1
    local word_index=2
    while [[ $word_index -lt $CURRENT ]]; do
        if [[ -v "literal_transitions[$state]" ]]; then
            local -A state_transitions
            eval "state_transitions=${literal_transitions[$state]}"

            local word=${words[$word_index]}
            local word_matched=0
            for ((literal_id = 1; literal_id <= $#literals; literal_id++)); do
                if [[ ${literals[$literal_id]} = "$word" ]]; then
                    if [[ -v "state_transitions[$literal_id]" ]]; then
                        state=${state_transitions[$literal_id]}
                        word_index=$((word_index + 1))
                        word_matched=1
                        break
                    fi
                fi
            done
            if [[ $word_matched -ne 0 ]]; then
                continue
            fi
        fi

        if [[ -v "match_anything_transitions[$state]" ]]; then
            state=${match_anything_transitions[$state]}
            word_index=$((word_index + 1))
            continue
        fi

        return 1
    done

    completions_no_description_trailing_space=()
    completions_no_description_no_trailing_space=()
    completions_trailing_space=()
    suffixes_trailing_space=()
    descriptions_trailing_space=()
    completions_no_trailing_space=()
    suffixes_no_trailing_space=()
    descriptions_no_trailing_space=()

    if [[ -v "literal_transitions[$state]" ]]; then
        local -A state_transitions
        eval "state_transitions=${literal_transitions[$state]}"

        for literal_id in ${(k)state_transitions}; do
            if [[ -v "descriptions[$literal_id]" ]]; then
                completions_trailing_space+=("${literals[$literal_id]}")
                suffixes_trailing_space+=("${literals[$literal_id]}")
                descriptions_trailing_space+=("${descriptions[$literal_id]}")
            else
                completions_no_description_trailing_space+=("${literals[$literal_id]}")
            fi
        done
    fi
    local -A commands=([18]=0 [15]=3 [13]=2 [7]=1)

    if [[ -v "commands[$state]" ]]; then
        local command_id=${commands[$state]}
        local output=$(_hyprctl_cmd_${command_id} "${words[$CURRENT]}")
        local -a command_completions=("${(@f)output}")
        for line in ${command_completions[@]}; do
            local parts=(${(@s:	:)line})
            if [[ -v "parts[2]" ]]; then
                completions_trailing_space+=("${parts[1]}")
                suffixes_trailing_space+=("${parts[1]}")
                descriptions_trailing_space+=("${parts[2]}")
            else
                completions_no_description_trailing_space+=("${parts[1]}")
            fi
        done
    fi

    local maxlen=0
    for suffix in ${suffixes_trailing_space[@]}; do
        if [[ ${#suffix} -gt $maxlen ]]; then
            maxlen=${#suffix}
        fi
    done
    for suffix in ${suffixes_no_trailing_space[@]}; do
        if [[ ${#suffix} -gt $maxlen ]]; then
            maxlen=${#suffix}
        fi
    done

    for ((i = 1; i <= $#suffixes_trailing_space; i++)); do
        if [[ -z ${descriptions_trailing_space[$i]} ]]; then
            descriptions_trailing_space[$i]="${(r($maxlen)( ))${suffixes_trailing_space[$i]}}"
        else
            descriptions_trailing_space[$i]="${(r($maxlen)( ))${suffixes_trailing_space[$i]}} -- ${descriptions_trailing_space[$i]}"
        fi
    done

    for ((i = 1; i <= $#suffixes_no_trailing_space; i++)); do
        if [[ -z ${descriptions_no_trailing_space[$i]} ]]; then
            descriptions_no_trailing_space[$i]="${(r($maxlen)( ))${suffixes_no_trailing_space[$i]}}"
        else
            descriptions_no_trailing_space[$i]="${(r($maxlen)( ))${suffixes_no_trailing_space[$i]}} -- ${descriptions_no_trailing_space[$i]}"
        fi
    done

    compadd -Q -a completions_no_description_trailing_space
    compadd -Q -S ' ' -a completions_no_description_no_trailing_space
    compadd -l -Q -a -d descriptions_trailing_space completions_trailing_space
    compadd -l -Q -S '' -a -d descriptions_no_trailing_space completions_no_trailing_space
    return 0
}

compdef _hyprctl hyprctl
