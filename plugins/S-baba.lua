local sudo = {
'سلام بابا جونم😍♥️',
'سلام پدر گل😍',
},
'local' function run(msg, matches)
if is_sudo(msg) then
return sudo[math.random(#sudo)]
end
end
return {
  patterns = {
    "^سلام",
  },
  run = run
}

--by @Mr_Anti_Admin
--Channel @BeyondTeam
