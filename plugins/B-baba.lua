local sudo = {
'خداحافظ بابایی 😘👋',
'بای بای بابا جونم😁👋',
},
'local' function run(msg, matches)
if is_sudo(msg) then
return sudo[math.random(#sudo)]
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
