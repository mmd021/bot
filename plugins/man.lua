do

local function run(msg, matches)
if matches[1]=="من کیم" and is_sudo(msg) then 
return  "بابام😍"
elseif matches[1]=="من کیم" and is_admin(msg) then 
return  "مامانم😍😚"
elseif matches[1]=="من کیم" and is_owner(msg) then 
return  "شما سازنده و صاحب گروه میباشید"
elseif matches[1]=="من کیم" and is_mod(msg) then 
return  "شما کمک مدیراین گروه میباشید"
else
return  "هیچی نیستی😂"
end

end

return {
  patterns = {
    "^(من کیم)$",
    },
  run = run
}
end


--By @Tele_Sudo
-- @LuaError                                                                                                                                                                                                                                                                                                