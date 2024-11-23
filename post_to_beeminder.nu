#!/usr/bin/env nu


let lines_of_code = (tokei --output json | from json | get Total.code)
open template.json |
    update timestamp { date now | format date "%s" } |
	update auth_token { $env.BEEMINDER_TOKEN } |
	update value $lines_of_code |
	http post https://www.beeminder.com/api/v1/users/elviejo79/goals/locs/datapoints.json ($in|url build-query)
