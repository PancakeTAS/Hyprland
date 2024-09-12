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
    if [[ $(type -t _get_comp_words_by_ref) != function ]]; then
        echo _get_comp_words_by_ref: function not defined.  Make sure the bash-completions system package is installed
        return 1
    fi

    local words cword
    _get_comp_words_by_ref -n "$COMP_WORDBREAKS" words cword

    local -a literals=("config-only" "cyclenext" "cursorpos" "bordersize" "renameworkspace" "animationstyle" "focuswindow" "--help" "-f" "auto" "0" "swapnext" "forceallowsinput" "moveactive" "activebordercolor" "alphafullscreen" "wayland" "layers" "minsize" "monitors" "1" "kill" "settiled" "3" "focusmonitor" "swapwindow" "moveoutofgroup" "notify" "movecursor" "setcursor" "movecurrentworkspacetomonitor" "4" "seterror" "nomaxsize" "1" "forcenoanims" "setprop" "-i" "-q" "bulkrenameworkspaces" "togglefloating" "3" "workspacerules" "movetoworkspace" "globalshortcuts" "setignoregrouplock" "disable" "workspaces" "movegroupwindow" "closewindow" "0" "0" "binds" "movewindow" "splitratio" "alpha" "denywindowfromgroup" "workspace" "configerrors" "togglegroup" "getoption" "--instance" "forceopaque" "keepaspectratio" "-h" "killactive" "pass" "event" "decorations" "devices" "focuscurrentorlast" "submap" "global" "alphafullscreenoverride" "headless" "forcerendererreload" "movewindowpixel" "version" "dpms" "resizeactive" "moveintogroup" "2" "5" "alphaoverride" "setfloating" "rollinglog" "::=" "rounding" "layouts" "moveworkspacetomonitor" "exec" "alphainactiveoverride" "alterzorder" "-1" "fakefullscreen" "nofocus" "animations" "keyword" "forcenoborder" "forcenodim" "--quiet" "pin" "output" "forcenoblur" "togglespecialworkspace" "fullscreen" "toggleopaque" "focusworkspaceoncurrentmonitor" "next" "changegroupactive" "-j" "instances" "execr" "exit" "clients" "descriptions" "all" "--batch" "dismissnotify" "inactivebordercolor" "switchxkblayout" "movetoworkspacesilent" "fullscreenstate" "tagwindow" "movewindoworgroup" "-r" "movefocus" "focusurgentorlast" "remove" "activeworkspace" "dispatch" "create" "centerwindow" "2" "hyprpaper" "-1" "reload" "alphainactive" "systeminfo" "plugin" "dimaround" "activewindow" "bulkswitchworkspaces" "swapactiveworkspaces" "sendshortcut" "splash" "maxsize" "lockactivegroup" "windowdancecompat" "forceopaqueoverriden" "x11" "lockgroups" "movecursortocorner" "prev" "1" "resizewindowpixel" "forcenoshadow")

    declare -A literal_transitions
    literal_transitions[0]="([115]=5 [118]=2 [85]=3 [36]=4 [38]=1 [2]=5 [88]=5 [120]=6 [42]=5 [44]=5 [125]=1 [47]=5 [7]=1 [52]=5 [96]=5 [97]=7 [130]=10 [129]=5 [60]=5 [100]=1 [58]=5 [102]=9 [134]=5 [64]=1 [136]=11 [138]=5 [17]=5 [68]=12 [69]=5 [19]=13 [139]=14 [21]=5 [141]=5 [145]=5 [27]=15 [77]=5 [110]=1 [111]=5 [29]=5 [32]=16 [114]=5 [117]=1)"
    literal_transitions[3]="([8]=5)"
    literal_transitions[4]="([83]=23 [15]=5 [35]=23 [62]=23 [63]=23 [103]=23 [119]=5 [137]=5 [87]=2 [18]=5 [140]=23 [3]=2 [5]=5 [73]=23 [146]=5 [148]=23 [91]=23 [149]=23 [95]=23 [33]=23 [55]=5 [14]=5 [98]=23 [12]=23 [99]=23 [156]=23)"
    literal_transitions[8]="([118]=2 [85]=3 [36]=4 [2]=5 [88]=5 [120]=6 [42]=5 [44]=5 [47]=5 [52]=5 [129]=5 [96]=5 [97]=7 [130]=10 [58]=5 [60]=5 [102]=9 [134]=5 [136]=11 [138]=5 [17]=5 [68]=12 [69]=5 [19]=13 [139]=14 [21]=5 [141]=5 [145]=5 [27]=15 [77]=5 [111]=5 [29]=5 [32]=16 [114]=5 [115]=5)"
    literal_transitions[9]="([131]=20 [128]=17)"
    literal_transitions[10]="([84]=5 [1]=5 [4]=5 [89]=5 [90]=5 [6]=5 [92]=5 [94]=5 [11]=5 [13]=5 [101]=5 [104]=5 [105]=5 [106]=5 [107]=5 [22]=5 [109]=5 [24]=5 [25]=5 [26]=5 [28]=5 [112]=5 [113]=5 [30]=5 [39]=5 [40]=5 [121]=5 [122]=22 [43]=5 [123]=5 [124]=5 [45]=5 [126]=5 [127]=5 [48]=5 [49]=5 [53]=5 [54]=5 [56]=5 [57]=5 [59]=5 [132]=5 [65]=5 [66]=5 [67]=5 [70]=5 [71]=5 [142]=5 [143]=5 [144]=5 [72]=5 [147]=5 [75]=5 [76]=5 [151]=5 [152]=5 [78]=5 [79]=5 [80]=5 [155]=5)"
    literal_transitions[11]="([0]=5)"
    literal_transitions[13]="([116]=5)"
    literal_transitions[15]="([23]=2 [133]=2 [31]=2 [154]=2 [135]=2 [51]=2 [82]=2)"
    literal_transitions[16]="([46]=5)"
    literal_transitions[18]="([86]=19)"
    literal_transitions[19]="([37]=1 [61]=1)"
    literal_transitions[20]="([9]=5 [74]=5 [16]=5 [150]=5)"
    literal_transitions[21]="([153]=5 [108]=5)"
    literal_transitions[22]="([34]=5 [41]=5 [81]=5 [50]=5 [93]=5)"
    literal_transitions[23]="([20]=5 [10]=5)"

    declare -A match_anything_transitions
    match_anything_transitions=([0]=8 [17]=5 [5]=18 [6]=21 [3]=18 [8]=8 [13]=18 [11]=18 [12]=5 [21]=5 [16]=18 [14]=5 [2]=5 [7]=5)
    declare -A subword_transitions

    local state=0
    local word_index=1
    while [[ $word_index -lt $cword ]]; do
        local word=${words[$word_index]}

        if [[ -v "literal_transitions[$state]" ]]; then
            declare -A state_transitions
            eval "state_transitions=${literal_transitions[$state]}"

            local word_matched=0
            for literal_id in $(seq 0 $((${#literals[@]} - 1))); do
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


    local prefix="${words[$cword]}"

    local shortest_suffix="$word"
    for ((i=0; i < ${#COMP_WORDBREAKS}; i++)); do
        local char="${COMP_WORDBREAKS:$i:1}"
        local candidate="${word##*$char}"
        if [[ ${#candidate} -lt ${#shortest_suffix} ]]; then
            shortest_suffix=$candidate
        fi
    done
    local superfluous_prefix=""
    if [[ "$shortest_suffix" != "$word" ]]; then
        local superfluous_prefix=${word%$shortest_suffix}
    fi

    if [[ -v "literal_transitions[$state]" ]]; then
        local state_transitions_initializer=${literal_transitions[$state]}
        declare -A state_transitions
        eval "state_transitions=$state_transitions_initializer"

        for literal_id in "${!state_transitions[@]}"; do
            local literal="${literals[$literal_id]}"
            if [[ $literal = "${prefix}"* ]]; then
                local completion=${literal#"$superfluous_prefix"}
                COMPREPLY+=("$completion ")
            fi
        done
    fi
    declare -A commands
    commands=([17]=0 [14]=3 [12]=2 [6]=1)
    if [[ -v "commands[$state]" ]]; then
        local command_id=${commands[$state]}
        local completions=()
        mapfile -t completions < <(_hyprctl_cmd_${command_id} "$prefix" | cut -f1)
        for item in "${completions[@]}"; do
            if [[ $item = "${prefix}"* ]]; then
                COMPREPLY+=("$item")
            fi
        done
    fi


    return 0
}

complete -o nospace -F _hyprctl hyprctl
