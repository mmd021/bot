do

local function run(msg, matches)
  if matches[1] == 'se' or 'سلام' then
    if is_sudo(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/sudo.webp', ok_cb, false)
      return "سلام بابا جونم😍♥️"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/admin.webp', ok_cb, false)
      return "سلام مامانی😍♥️"
    end
  end
end

return {
  patterns = {
    "^[!/#]([Ss]alam)$",
    "^([Ss]alam)$",
    "^سلام$"
    },
  run = run
}
end
