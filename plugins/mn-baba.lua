local sudo = {
'بابایی😍♥️',
'پدر گل😍',
},
'local' function run(msg, matches)
if is_sudo(msg) then
return sudo[math.random(#sudo)]
end
end
return {
  patterns = {
    "^من کیم",
  },
  run = run
}

--by @Mr_Anti_Admin
--Channel @BeyondTeam
