--Begin Chat-Actions.lua

local function run(msg, matches)
local type = "typing:"..msg.chat_id_
local cancel = "cancels:"..msg.chat_id_
local video = "rvideo:"..msg.chat_id_
local voice = "rvoice:"..msg.chat_id_
local play = "playing:"..msg.chat_id_
local uvideo = "uvideo:"..msg.chat_id_
local uvoice = "uvoice:"..msg.chat_id_
local uphoto = "uphoto:"..msg.chat_id_
local udocument = "udocument:"..msg.chat_id_

----------Typing Action----------

if matches[1] == "typing" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(type, true) 
return "*Typing* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(type) 
return "*Typing* _Action Has Been Disabled_"
end 
end 
if redis:get(type) then
tdcli.sendChatAction(msg.chat_id_, "Typing")
end

----------Cancel Action----------

if matches[1] == "cancels" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(cancel, true) 
return "*Cancel* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(cancel) 
return "*Cancel* _Action Has Been Disabled_"
end 
end 
if redis:get(cancel) then
tdcli.sendChatAction(msg.chat_id_, "Cancel")
end

----------Video Action----------

if matches[1] == "rvideo" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(video, true) 
return "*Record-Video* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(video) 
return "*Record-Video* _Action Has Been Disabled_"
end 
end 
if redis:get(video) then
tdcli.sendChatAction(msg.chat_id_, "RecordVideo")
end

----------Voice Action----------

if matches[1] == "rvoice" and is_sudo(msg) then
--Enable 
if matches[2] == "on" then 
redis:set(voice, true) 
return "*Record-Voice* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(voice) 
return "*Record-Voice* _Action Has Been Disabled_"
end 
end 
if redis:get(type) then
tdcli.sendChatAction(msg.chat_id_, "RecordVoice")
end

----------Playing Action----------

if matches[1] == "playing" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(play, true) 
return "*Playing* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(play) 
return "*Playing* _Action Has Been Disabled_"
end 
end 
if redis:get(play) then
tdcli.sendChatAction(msg.chat_id_, "StartPlayGame")
end

----------UploadVideo Action----------

if matches[1] == "uvideo" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(uvideo, true) 
return "*Upload-Video* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(uvideo) 
return "*Upload-Video* _Action Has Been Disabled_"
end 
end 
if redis:get(uvideo) then
tdcli.sendChatAction(msg.chat_id_, "UploadVideo", 1)
end

----------UploadVoice Action----------

if matches[1] == "uvoice" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(uvoice, true) 
return "*Upload-Voice* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(uvoice) 
return "*Upload-Voice* _Action Has Been Disabled_"
end 
end 
if redis:get(uvoice) then
tdcli.sendChatAction(msg.chat_id_, "UploadVoice", 1)
end

----------UploadVoice Action----------

if matches[1] == "uphoto" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(uphoto, true) 
return "*Upload-Photo* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(uphoto) 
return "*Upload-Photo* _Action Has Been Disabled_"
end 
end 
if redis:get(uphoto) then
tdcli.sendChatAction(msg.chat_id_, "UploadPhoto", 1)
end

----------UploadVoice Action----------

if matches[1] == "udocument" and is_sudo(msg) then
--Enable
if matches[2] == "on" then 
redis:set(udocument, true) 
return "*Upload-Document* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" then 
redis:del(udocument) 
return "*Upload-Document* _Action Has Been Disabled_"
end 
end 
if redis:get(udocument) then
tdcli.sendChatAction(msg.chat_id_, "UploadDocument", 1)
end
end
return { 
patterns = {
"^[!/#](typing) (.*)$",
"^[!/#](cancels) (.*)$",
"^[!/#](rvideo) (.*)$",
"^[!/#](rvoice) (.*)$",
"^[!/#](playing) (.*)$",
"^[!/#](uvideo) (.*)$",
"^[!/#](uvoice) (.*)$",
"^[!/#](uphoto) (.*)$",
"^[!/#](udocument) (.*)$",
"(.*)",
},
run = run
}

--End Chat-Actions.lua 
--By @Makan ;D