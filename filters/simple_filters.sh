function filter_keyword {
   local -A keywords=(
      [$nick]="Estou online"
      [bot]="Sou um bot"
   )

   [ -n "${keywords[$2]}" ] && echo "${keywords[$2]}"
}

filter '!([^ ]+)' filter_keyword
