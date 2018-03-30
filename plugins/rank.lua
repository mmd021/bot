--Begin rank plugin by @Nikutintm 
local function getrank(msg)
	local rank = ""
	local hash = "laghab:"..tostring(msg.from.id)
	local laghab = redis:get(hash)
	local mash = "gp_lang:"..msg.to.id
	local lang = redis:get(mash)
	if laghab then
			rank = laghab
	elseif is_sudo1(msg.from.id) then
		if not lang then
			rank = "Sudo"
		elseif lang then
			rank = "سودو"
		end
	elseif is_admin1(msg.from.id) then
		if not lang then
			rank = "Admin"
		elseif lang then
			rank = "ادمین ربات"
		end
	elseif is_owner1(msg.to.id,msg.from.id) then
		if not lang then
			rank = "Owner"
		elseif lang then
			rank = "مالک"
		end
	elseif is_mod1(msg.to.id,msg.from.id) then
		if not lang then
			rank = "Moderator"
		elseif lang then
			rank = "مدیر"
		end
	else
		if not lang then
			rank = "Member"
		elseif lang then
			rank = "کاربر عادی"
		end
	end
	return rank
end
local function bot(msg)
	local hash = "laghab:"..tostring(msg.from.id)
	local laghab = redis:get(hash)
	local mash = "gp_lang:"..msg.to.id
	local lang = redis:get(mash)
	return laghab
end
-------------------------------------
local function rank_reply(arg, data)
	local hash = "gp_lang:"..data.chat_id_
	local lang = redis:get(hash)
	local cmd = arg.cmd
	if data.sender_user_id_ then
		if not tonumber(data.sender_user_id_) then return false end
		if cmd == "setrank" then
			redis:set("laghab:"..data.sender_user_id_,arg.rank)
			if not lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.sender_user_id_.."'s rank has been setted to *"..arg.rank.."*", 0, "md")
			elseif lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.sender_user_id_.." تنظیم شد به `"..arg.rank.."`", 0, "md")
			end
		end
		if cmd == "delrank" then
			redis:del("laghab:"..data.sender_user_id_)
			if not lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.sender_user_id_.."'s rank has been deleted", 0, "md")
			elseif lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.sender_user_id_.." حذف شد", 0, "md")
			end
		end
	else
		if lang then
			return tdcli.sendMessage(data.chat_id_, "", 0, "_کاربر یافت نشد_", 0, "md")
		else
			return tdcli.sendMessage(data.chat_id_, "", 0, "*User Not Found*", 0, "md")
		end
	end
end
-------------------------------------
local function rank_username(arg, data)
	local hash = "gp_lang:"..arg.chat_id
	local lang = redis:get(hash)
	local cmd = arg.cmd
	if not arg.username then return false end
	if data.id_ then
		if cmd == "setrank" then
			redis:set("laghab:"..data.id_,arg.rank)
			if not lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.id_.."'s rank has been setted to *"..arg.rank.."*", 0, "md")
			elseif lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.id_.." تنظیم شد به `"..arg.rank.."`", 0, "md")
			end
		end
		if cmd == "delrank" then
			redis:del("laghab:"..data.sender_user_id_)
			if not lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.id_.."'s rank has been deleted", 0, "md")
			elseif lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.id_.." حذف شد", 0, "md")
			end
		end
	else
		if lang then
			return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر یافت نشد_", 0, "md")
		else
			return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
		end
	end
end
-------------------------------------
local function rank_id(arg, data)
	local hash = "gp_lang:"..arg.chat_id
	local lang = redis:get(hash)
	local cmd = arg.cmd
	if not tonumber(arg.user_id) then return false end
	if data.id_ then
		if data.first_name_ then
			if cmd == "setrank" then
				redis:set("laghab:"..data.id_,arg.rank)
				if not lang then
					return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.id_.."'s rank has been setted to *"..arg.rank.."*", 0, "md")
				elseif lang then
					return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.id_.." تنظیم شد به `"..arg.rank.."`", 0, "md")
				end
			end
			if cmd == "delrank" then
				redis:del("laghab:"..data.sender_user_id_)
				if not lang then
					return tdcli.sendMessage(arg.chat_id, "", 0, "User "..data.id_.."'s rank has been deleted", 0, "md")
				elseif lang then
					return tdcli.sendMessage(arg.chat_id, "", 0, "مقام کاربر "..data.id_.." حذف شد", 0, "md")
				end
			end
		else
			if not lang then
				return tdcli.sendMessage(arg.chat_id, "", 0, "_User not founded_", 0, "md")
			else
				return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر یافت نشد_", 0, "md")
			end
		end
	else
		if lang then
			return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر یافت نشد_", 0, "md")
		else
			return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
		end
	end
end
----------------------------------------

local function run(msg, matches)
	local hash = "gp_lang:"..msg.to.id
	local lang = redis:get(hash)
	if matches[1]:lower() == "setrank" and is_admin(msg) then
		if msg.reply_id then
			tdcli_function ({
			ID = "GetMessage",
			chat_id_ = msg.to.id,
			message_id_ = msg.reply_id
			}, rank_reply, {chat_id=msg.to.id,cmd="setrank",rank=string.sub(msg.text,10)})
		elseif matches[3] and string.match(matches[3], '^%d+$') then
			tdcli_function ({
			ID = "GetUser",
			user_id_ = matches[3],
			}, rank_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setrank",rank=matches[2]})
		elseif matches[3] and not string.match(matches[3], '^%d+$') then
			tdcli_function ({
			ID = "SearchPublicChat",
			username_ = matches[3]
			}, rank_username, {chat_id=msg.to.id,username=matches[3],cmd="setrank",rank=matches[2]})
		end
	end
-------------------------------------
	if matches[1] == "تنظیم مقام" and is_admin(msg) then
		if msg.reply_id then
			tdcli_function ({
			ID = "GetMessage",
			chat_id_ = msg.to.id,
			message_id_ = msg.reply_id
			}, rank_reply, {chat_id=msg.to.id,cmd="setrank",rank=string.sub(msg.text,21)})
		elseif matches[3] and string.match(matches[3], '^%d+$') then
			tdcli_function ({
			ID = "GetUser",
			user_id_ = matches[3],
			}, rank_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setrank",rank=matches[2]})
		elseif matches[3] and not string.match(matches[3], '^%d+$') then
			tdcli_function ({
			ID = "SearchPublicChat",
			username_ = matches[3]
			}, rank_username, {chat_id=msg.to.id,username=matches[3],cmd="setrank",rank=matches[2]})
		end
	end
------------------------------------------------------
	if (matches[1] == "حذف مقام" or matches[1]:lower() == "remrank")  and is_admin(msg) then
		if msg.reply_id then
			tdcli_function ({
			ID = "GetMessage",
			chat_id_ = msg.to.id,
			message_id_ = msg.reply_id
			}, rank_reply, {chat_id=msg.to.id,cmd="delrank"})
		elseif matches[2] and string.match(matches[2], '^%d+$') then
			tdcli_function ({
			ID = "GetUser",
			user_id_ = matches[2],
			}, rank_id, {chat_id=msg.to.id,user_id=matches[2],cmd="delrank"})
		elseif matches[2] and not string.match(matches[2], '^%d+$') then
			tdcli_function ({
			ID = "SearchPublicChat",
			username_ = matches[2]
			}, rank_username, {chat_id=msg.to.id,username=matches[2],cmd="delrank"})
		end
	end

   
	if matches[1]:lower() == "rank" or matches[1] == "مقام" then
		local rankk = getrank(msg)
		if not lang then
			return "Your Rank : "..rankk..""
		else
			return "مقام شما : "..rankk..""
		end
	end
	if matches[1] == "سلام" then
	local hash = "laghab:"..msg.to.id
	local laghab = redis:get(hash)
	local botrank = bot(msg)
	if not laghab then
	local barank = {
   "سلام "..botrank.."",
   "علیک "..botrank.."",
   "چطوری "..botrank.."",
   "به به جناب "..botrank.."",
     }
	return barank[math.random(#barank)]
	else
	local berank = {
   "جون دلم 😀🌹",
   "هااااا چته 😐",
   "بگو:| کارت بگو:|",
   "نزن لامصب هی ربات ربات 😐🖕🏻",
   "چی میخوای ؟"
     }
	return berank[math.random(#berank)]
	end
	end
end

return {
	patterns ={
		"^[/#!]([Ss]etrank) (.*) (.*)$",
		"^[/#!]([Ss]etrank) (.*)$",
		"^[/#!]([Rr]emrank)$",
		"^[/#!]([Rr]emrank) (.*)$",
		"^[/#!]([Rr]ank)$",
		"^([Ss]etrank) (.*) (.*)$",
		"^([Ss]etrank) (.*)$",
		"^([Rr]emrank)$",
		"^([Rr]emrank) (.*)$",
		"^([Rr]ank)$",
		"^(تنظیم مقام) (.*) (.*)$",
		"^(تنظیم مقام) (.*)$",
		"^(حذف مقام)$",
		"^(حذف مقام) (.*)$",
		"^(مقام)$",
		"^(سلام)$"
	},
	run=run
}
--End rank plugin by @nikutintm
