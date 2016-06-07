--[[
#
#ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
#:((
# For More Information ....! 
# Developer : Aziz < @TH3_GHOST > 
# our channel: @DevPointTeam
# Version: 1.1
#:))
#ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
#
]]


local function DevPoint(msg, matches, callback, extra)

local data = load_data(_config.moderation.data)

local group_welcome = data[tostring(msg.to.id)]['group_welcome']

if matches[1] == 'chat_add_user' or 'chat_add_user_link' then --For Normal Group
    if not msg.service then 
        return nil 
    else--@DevPointCH
if string.match(group_welcome, '{gpname}') then group_welcome = string.gsub(group_welcome, '{gpname}', ""..string.gsub(msg.to.print_name, "_", " ").."")
 end
if string.match(group_welcome, '{firstname}') then group_welcome = string.gsub(group_welcome, '{firstname}', ""..(msg.action.user.first_name or '').."")
 end
if string.match(group_welcome, '{lastname}') then group_welcome = string.gsub(group_welcome, '{lastname}', ""..(msg.action.user.last_name or '').."")
 end
if string.match(group_welcome, '{username}') then group_welcome = string.gsub(group_welcome, '{username}', "@"..(msg.action.user.username or '').."")
end
if string.match(group_welcome, '{addeduser}') then group_welcome = string.gsub(group_welcome, '{addeduser}', "@"..(msg.from.username or '').."")
end
if string.match(group_welcome, '{gpid}') then group_welcome = string.gsub(group_welcome, '{gpid}', ""..(msg.to.id or '').."")
end
if string.match(group_welcome, '{id}') then group_welcome = string.gsub(group_welcome, '{id}', ""..(msg.action.user.id or '').."")
end
if string.match(group_welcome, '{addedfirstname}') then group_welcome = string.gsub(group_welcome, '{addedfirstname}', ""..(msg.from.first_name or '').."")
end
return group_welcome
end
end
end
return {
  patterns = {
  "^!!tgservice (chat_add_user)$",
  "^!!tgservice (chat_add_user_link)$",
  },
  run = DevPoint,
  pre_process = pre_process
}
--post by channel @DevPointCH