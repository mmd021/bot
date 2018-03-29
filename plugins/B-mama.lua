local admin = {
'خداحافظ مامانی 😘👋',
'بای مامان جونم😁👋',
},
'local' function run(msg, matches)
if is_admin(msg) then
return admin[math.random(#admin)]
end
end
return {
  patterns = {
    "^بای",
  },
  run = run
}

--by @Mr_Anti_Admin
--Channel @BeyondTeam
