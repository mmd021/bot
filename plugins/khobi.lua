do

local function run(msg, matches)
if matches[1]=="خوبی" and is_sudo(msg) then 
return  "ت چطوری بابایی😍♡"
elseif matches[1]=="خوبی" and is_admin(msg) then 
return  "شما چطوری گل مامان😍♥"
elseif matches[1]=="خوبی" and is_mod(msg) then 
return  "اره ت چطوری😊"
else
return  "ب ت چه اخه😒"
end

end

return {
  patterns = {
    "^(خوبی)$",
    },
  run = run
}
end


--By @Tele_Sudo
-- @LuaError                                                                                                                                                                                                                                                                                                