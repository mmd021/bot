local admin = {
'مامان جون😍♥️',
'مامان گلم😍',
},
'local' function run(msg, matches)
if is_admin(msg) then
return admin[math.random(#admin)]
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
