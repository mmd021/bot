do

local function run(msg, matches)
if matches[1]=="چطوری" and is_sudo(msg) then 
return  "فداتم بابایی😍"
end

end

return {
  patterns = {
    "^(چطوری)$",
    },
  run = run
}
end
