# Simple filter example outputs a matching string whenever !<cmd> is uttered in any tracked channel
filter_keyword()
{
   local -A keywords=(
      [$BOTNICK]="you said my name! - you can find my source @ https://github.com/XCaminhante/bashbot"
      [bot]="I am bot.  Hear me rawwrr."
   )

   [ -n "${keywords[$2]}" ] && echo "${keywords[$2]}"
}

filter '!([^ ]+)' filter_keyword
