local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local PURPLE=$'%{\e[0;35m%}'
local DEFAULT=$'%{\e[m%}'
PROMPT=$'\n'$PURPLE'${USER}@${HOSTNAME} %~ '$'\n'$DEFAULT'%(!.#.$) '
