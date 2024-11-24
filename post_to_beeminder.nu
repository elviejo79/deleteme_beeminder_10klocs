#!/usr/bin/env nu


let lines_of_code = (tokei --output json | from json | get Total.code)
let commit_url = "https://github.com/" + $env.GITHUB_REPOSITORY + "/commit/" + $env.GITHUB_SHA
let commit_message = $env.COMMIT_MESSAGE
let comment = $'($env.COMMIT_MESSAGE) | ($commit_url)'
open template.json |
    update timestamp { date now | format date "%s" } |
	update auth_token { $env.BEEMINDER_TOKEN } |
	update value $lines_of_code |
	update comment $comment |
	http post https://www.beeminder.com/api/v1/users/elviejo79/goals/locs/datapoints.json ($in|url build-query)
