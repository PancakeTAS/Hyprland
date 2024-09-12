function _hyprctl_1
    set 1 $argv[1]
    hyprctl monitors | awk '/Monitor/{ print $2 }'
end

function _hyprctl_3
    set 1 $argv[1]
    hyprctl clients | awk '/class/{print $2}'
end

function _hyprctl_2
    set 1 $argv[1]
    hyprctl devices | sed -n '/Keyboard at/{n; s/^\s\+//; p}'
end

function _hyprctl_4
    set 1 $argv[1]
    hyprpm list | awk '/Plugin/{print $4}'
end

function _hyprctl
    set COMP_LINE (commandline --cut-at-cursor)

    set COMP_WORDS
    echo $COMP_LINE | read --tokenize --array COMP_WORDS
    if string match --quiet --regex '.*\s$' $COMP_LINE
        set COMP_CWORD (math (count $COMP_WORDS) + 1)
    else
        set COMP_CWORD (count $COMP_WORDS)
    end

    set --local literals "config-only" "cyclenext" "cursorpos" "bordersize" "renameworkspace" "animationstyle" "focuswindow" "--help" "-f" "auto" "0" "swapnext" "forceallowsinput" "moveactive" "activebordercolor" "alphafullscreen" "wayland" "layers" "minsize" "monitors" "1" "kill" "settiled" "3" "focusmonitor" "swapwindow" "moveoutofgroup" "notify" "movecursor" "setcursor" "movecurrentworkspacetomonitor" "4" "seterror" "nomaxsize" "1" "forcenoanims" "setprop" "-i" "-q" "bulkrenameworkspaces" "togglefloating" "3" "workspacerules" "movetoworkspace" "globalshortcuts" "setignoregrouplock" "disable" "workspaces" "movegroupwindow" "closewindow" "0" "0" "binds" "movewindow" "splitratio" "alpha" "denywindowfromgroup" "workspace" "configerrors" "togglegroup" "getoption" "--instance" "forceopaque" "keepaspectratio" "-h" "killactive" "pass" "event" "decorations" "devices" "focuscurrentorlast" "submap" "global" "alphafullscreenoverride" "headless" "forcerendererreload" "movewindowpixel" "version" "dpms" "resizeactive" "moveintogroup" "2" "5" "alphaoverride" "setfloating" "rollinglog" "::=" "rounding" "layouts" "moveworkspacetomonitor" "exec" "alphainactiveoverride" "alterzorder" "-1" "fakefullscreen" "nofocus" "animations" "keyword" "forcenoborder" "forcenodim" "--quiet" "pin" "output" "forcenoblur" "togglespecialworkspace" "fullscreen" "toggleopaque" "focusworkspaceoncurrentmonitor" "next" "changegroupactive" "-j" "instances" "execr" "exit" "clients" "descriptions" "all" "--batch" "dismissnotify" "inactivebordercolor" "switchxkblayout" "movetoworkspacesilent" "fullscreenstate" "tagwindow" "movewindoworgroup" "-r" "movefocus" "focusurgentorlast" "remove" "activeworkspace" "dispatch" "create" "centerwindow" "2" "hyprpaper" "-1" "reload" "alphainactive" "systeminfo" "plugin" "dimaround" "activewindow" "bulkswitchworkspaces" "swapactiveworkspaces" "sendshortcut" "splash" "maxsize" "lockactivegroup" "windowdancecompat" "forceopaqueoverriden" "x11" "lockgroups" "movecursortocorner" "prev" "1" "resizewindowpixel" "forcenoshadow"

    set --local descriptions
    set descriptions[2] "Focus the next window on a workspace"
    set descriptions[3] "Get the current cursor pos in global layout coordinates"
    set descriptions[5] "Rename a workspace"
    set descriptions[7] "Focus the first window matching"
    set descriptions[8] "Prints the help message"
    set descriptions[12] "Swap the focused window with the next window"
    set descriptions[14] "Move the active window"
    set descriptions[18] "List the layers"
    set descriptions[20] "List active outputs with their properties"
    set descriptions[22] "Get into a kill mode, where you can kill an app by clicking on it"
    set descriptions[23] "Set the current window's floating state to false"
    set descriptions[24] "ERROR"
    set descriptions[25] "Focus a monitor"
    set descriptions[26] "Swap the active window with another window"
    set descriptions[27] "Move the active window out of a group"
    set descriptions[28] "Send a notification using the built-in Hyprland notification system"
    set descriptions[29] "Move the cursor to a specified position"
    set descriptions[30] "Set the cursor theme and reloads the cursor manager"
    set descriptions[31] "Move the active workspace to a monitor"
    set descriptions[32] "CONFUSED"
    set descriptions[33] "Set the hyprctl error string"
    set descriptions[35] "Maximize no fullscreen"
    set descriptions[37] "Set a property of a window"
    set descriptions[38] "Specify the Hyprland instance"
    set descriptions[39] "Disable output"
    set descriptions[40] "Rename workspaces in bulk"
    set descriptions[41] "Toggle the current window's floating state"
    set descriptions[42] "Maximize and fullscreen"
    set descriptions[43] "Get the list of defined workspace rules"
    set descriptions[44] "Move the focused window to a workspace"
    set descriptions[45] "Lists all global shortcuts"
    set descriptions[46] "Temporarily enable or disable binds:ignore_group_lock"
    set descriptions[48] "List all workspaces with their properties"
    set descriptions[49] "Swap the active window with the next or previous in a group"
    set descriptions[50] "Close a specified window"
    set descriptions[51] "None"
    set descriptions[52] "WARNING"
    set descriptions[53] "List all registered binds"
    set descriptions[54] "Move the active window in a direction or to a monitor"
    set descriptions[55] "Change the split ratio"
    set descriptions[57] "Prohibit the active window from becoming or being inserted into group"
    set descriptions[58] "Change the workspace"
    set descriptions[59] "List all current config parsing errors"
    set descriptions[60] "Toggle the current active window into a group"
    set descriptions[61] "Get the config option status (values)"
    set descriptions[62] "Specify the Hyprland instance"
    set descriptions[65] "Prints the help message"
    set descriptions[66] "Close the active window"
    set descriptions[67] "Pass the key to a specified window"
    set descriptions[68] "Emits a custom event to socket2"
    set descriptions[69] "List all decorations and their info"
    set descriptions[70] "List all connected keyboards and mice"
    set descriptions[71] "Switch focus from current to previously focused window"
    set descriptions[72] "Change the current mapping group"
    set descriptions[73] "Execute a Global Shortcut using the GlobalShortcuts portal"
    set descriptions[76] "Force the renderer to reload all resources and outputs"
    set descriptions[77] "Move a selected window"
    set descriptions[78] "Print the Hyprland version: flags, commit and branch of build"
    set descriptions[79] "Set all monitors' DPMS status"
    set descriptions[80] "Resize the active window"
    set descriptions[81] "Move the active window into a group"
    set descriptions[82] "Fullscreen"
    set descriptions[83] "OK"
    set descriptions[85] "Set the current window's floating state to true"
    set descriptions[86] "Print tail of the log"
    set descriptions[89] "List all layouts available (including plugin ones)"
    set descriptions[90] "Move a workspace to a monitor"
    set descriptions[91] "Execute a shell command"
    set descriptions[93] "Modify the window stack order of the active or specified window"
    set descriptions[94] "Current"
    set descriptions[95] "Toggle the focused window's internal fullscreen state"
    set descriptions[97] "Gets the current config info about animations and beziers"
    set descriptions[98] "Issue a keyword to call a config keyword dynamically"
    set descriptions[101] "Disable output"
    set descriptions[102] "Pin a window"
    set descriptions[103] "Allows adding/removing fake outputs to a specific backend"
    set descriptions[105] "Toggle a special workspace on/off"
    set descriptions[106] "Toggle the focused window's fullscreen state"
    set descriptions[107] "Toggle the current window to always be opaque"
    set descriptions[108] "Focus the requested workspace"
    set descriptions[110] "Switch to the next window in a group"
    set descriptions[111] "Output in JSON format"
    set descriptions[112] "List all running Hyprland instances and their info"
    set descriptions[113] "Execute a raw shell command"
    set descriptions[114] "Exit the compositor with no questions asked"
    set descriptions[115] "List all windows with their properties"
    set descriptions[116] "Return a parsable JSON with all the config options, descriptions, value types and ranges"
    set descriptions[118] "Execute a batch of commands separated by ;"
    set descriptions[119] "Dismiss all or up to amount of notifications"
    set descriptions[121] "Set the xkb layout index for a keyboard"
    set descriptions[122] "Move window doesnt switch to the workspace"
    set descriptions[123] "Sets the focused window’s fullscreen mode and the one sent to the client"
    set descriptions[124] "Apply a tag to the window"
    set descriptions[125] "Behave as moveintogroup"
    set descriptions[126] "Refresh state after issuing the command"
    set descriptions[127] "Move the focus in a direction"
    set descriptions[128] "Focus the urgent window or the last window"
    set descriptions[130] "Get the active workspace name and its properties"
    set descriptions[131] "Issue a dispatch to call a keybind dispatcher with an arg"
    set descriptions[133] "Center the active window"
    set descriptions[134] "HINT"
    set descriptions[135] "Interact with hyprpaper if present"
    set descriptions[136] "No Icon"
    set descriptions[137] "Force reload the config"
    set descriptions[139] "Print system info"
    set descriptions[140] "Interact with a plugin"
    set descriptions[142] "Get the active window name and its properties"
    set descriptions[143] "Switch workspaces in bulk"
    set descriptions[144] "Swap the active workspaces between two monitors"
    set descriptions[145] "On shortcut X sends shortcut Y to a specified window"
    set descriptions[146] "Print the current random splash"
    set descriptions[148] "Lock the focused group"
    set descriptions[152] "Lock the groups"
    set descriptions[153] "Move the cursor to the corner of the active window"
    set descriptions[155] "INFO"
    set descriptions[156] "Resize a selected window"

    set --local literal_transitions
    set literal_transitions[1] "set inputs 116 119 86 37 39 3 89 121 43 45 126 48 8 53 97 98 131 130 61 101 59 103 135 65 137 139 18 69 70 20 140 22 142 146 28 78 111 112 30 33 115 118; set tos 6 3 4 5 2 6 6 7 6 6 2 6 2 6 6 8 11 6 6 2 6 10 6 2 12 6 6 13 6 14 15 6 6 6 16 6 2 6 6 17 6 2"
    set literal_transitions[4] "set inputs 9; set tos 6"
    set literal_transitions[5] "set inputs 84 16 36 63 64 104 120 138 88 19 141 4 6 74 147 149 92 150 96 34 56 15 99 13 100 157; set tos 24 6 24 24 24 24 6 6 3 6 24 3 6 24 6 24 24 24 24 24 6 6 24 24 24 24"
    set literal_transitions[9] "set inputs 119 86 37 3 89 121 43 45 48 53 130 97 98 131 59 61 103 135 137 139 18 69 70 20 140 22 142 146 28 78 112 30 33 115 116; set tos 3 4 5 6 6 7 6 6 6 6 6 6 8 11 6 6 10 6 12 6 6 13 6 14 15 6 6 6 16 6 6 6 17 6 6"
    set literal_transitions[10] "set inputs 132 129; set tos 21 18"
    set literal_transitions[11] "set inputs 85 2 5 90 91 7 93 95 12 14 102 105 106 107 108 23 110 25 26 27 29 113 114 31 40 41 122 123 44 124 125 46 127 128 49 50 54 55 57 58 60 133 66 67 68 71 72 143 144 145 73 148 76 77 152 153 79 80 81 156; set tos 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 23 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6"
    set literal_transitions[12] "set inputs 1; set tos 6"
    set literal_transitions[14] "set inputs 117; set tos 6"
    set literal_transitions[16] "set inputs 24 134 32 155 136 52 83; set tos 3 3 3 3 3 3 3"
    set literal_transitions[17] "set inputs 47; set tos 6"
    set literal_transitions[19] "set inputs 87; set tos 20"
    set literal_transitions[20] "set inputs 38 62; set tos 2 2"
    set literal_transitions[21] "set inputs 10 75 17 151; set tos 6 6 6 6"
    set literal_transitions[22] "set inputs 154 109; set tos 6 6"
    set literal_transitions[23] "set inputs 35 42 82 51 94; set tos 6 6 6 6 6"
    set literal_transitions[24] "set inputs 21 11; set tos 6 6"

    set --local match_anything_transitions_from 1 18 6 7 4 9 14 12 13 22 17 15 3 8
    set --local match_anything_transitions_to 9 6 19 22 19 9 19 19 6 6 19 6 6 6

    set --local state 1
    set --local word_index 2
    while test $word_index -lt $COMP_CWORD
        set --local -- word $COMP_WORDS[$word_index]

        if set --query literal_transitions[$state] && test -n $literal_transitions[$state]
            set --local --erase inputs
            set --local --erase tos
            eval $literal_transitions[$state]

            if contains -- $word $literals
                set --local literal_matched 0
                for literal_id in (seq 1 (count $literals))
                    if test $literals[$literal_id] = $word
                        set --local index (contains --index -- $literal_id $inputs)
                        set state $tos[$index]
                        set word_index (math $word_index + 1)
                        set literal_matched 1
                        break
                    end
                end
                if test $literal_matched -ne 0
                    continue
                end
            end
        end

        if set --query match_anything_transitions_from[$state] && test -n $match_anything_transitions_from[$state]
            set --local index (contains --index -- $state $match_anything_transitions_from)
            set state $match_anything_transitions_to[$index]
            set word_index (math $word_index + 1)
            continue
        end

        return 1
    end

    if set --query literal_transitions[$state] && test -n $literal_transitions[$state]
        set --local --erase inputs
        set --local --erase tos
        eval $literal_transitions[$state]
        for literal_id in $inputs
            if test -n $descriptions[$literal_id]
                printf '%s\t%s\n' $literals[$literal_id] $descriptions[$literal_id]
            else
                printf '%s\n' $literals[$literal_id]
            end
        end
    end

    set command_states 18 15 13 7
    set command_ids 1 4 3 2
    if contains $state $command_states
        set --local index (contains --index $state $command_states)
        set --local function_id $command_ids[$index]
        set --local function_name _hyprctl_$function_id
        set --local --erase inputs
        set --local --erase tos
        $function_name "$COMP_WORDS[$COMP_CWORD]"
    end

    return 0
end

complete --command hyprctl --no-files --arguments "(_hyprctl)"
