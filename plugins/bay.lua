do

local function run(msg, matches)
  if matches[1] == 'Bay' or 'فعلن' then
    if is_sudo(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/sudo.webp', ok_cb, false)
      return "خداحافظ بابا☺️👋"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/admin.webp', ok_cb, false)
      return "خداحافظت مامان جونم😍👋"
    end
  end
end

return {
  patterns = {
    "^[!/#]([Bb]ay)$",
    "^([Bb]ay)$",
    "^فعلن$"
    },
  run = run
}
end
