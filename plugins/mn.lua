local member = {
'هیچی نیستی😅😆',
'یه گاوی هستی دیگ من چ میدونم😄',
},
'local' function run(msg, matches)
if is_memeber(msg) then
return member[math.random(#member)]
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
