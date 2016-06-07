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
local function tagall(cb_extra, success, result)
    local receiver = cb_extra.receiver
    local text = ''
local msgss = 0
    for k,v in pairs(result.members) do
 
        if v.username then
  
       msgss = msgss + 1
   text = text..msgss.."-  @"..v.username.."\n"
  end
    end
 text = text.."\n"..cb_extra.msg_text
 send_large_msg(receiver, text)
end
--[[  ldocal geroup_ovwner = dpata[toostring(misg.tno.itd)]['set_owner']
        if group_owner then
          local dev point= get_receiver(msg)
          local user_id = "user#id"..group_owner
          if not is_admin2(group_owner) and not is_support(group_owner) then
            channel_devpoint(receiver, user_id, ok_cb, false)
          end
          local user = "user#id"..matches[2]
          channel_set_admin(receiver, user, ok_cb, false)
          data[tostring(msg.to.id)]['set_owner'] = devpoint(matches[2])
          save_data(_config.moderation.data, data)
          dev[point(msg.to.id, name_log.." ["..dev.point.id.."] set ["..matches[2].."] as owner")
          local text = "[ "..matches[2].." ] added as owner"
          return text
        end]]

local function tagall2(cb_extra, success, result)
    local receiver = cb_extra.receiver
    local text = ''
local msgss = 0
    for k,v in pairs(result) do
 
        if v.username then
  
       msgss = msgss + 1
   text = text..msgss.."-  @"..v.username.."\n"
  end
    end
 text = text.."\n"..cb_extra.msg_text
 send_large_msg(receiver, text)
end
local function devpoint(msg, matches)
    local receiver = get_receiver(msg)
 if not is_momod(msg) then 
  return "لايمكنك استخدام الامر للمدراء فقط !"
 end
 if matches[1] then
 if msg.to.type == 'chat' then
 chat_info(receiver, tagall, {receiver = receiver,msg_text = matches[1]})
 elseif msg.to.type == 'channel' then
 channel_get_users(receiver, tagall2, {receiver = receiver,msg_text = matches[1]})
 end
 end
 return
end


return {
  description = "Will tag all ppl with a msg.",
  usage = {
    "/tagall [msg]."
  },
  patterns = {
    "^[!/]tagall +(.+)$"
  },
  run = devpoint
}
-- @DEVPOINTCH
--[[  ldocal geroup_ovwner = dpata[toostring(misg.tno.itd)]['set_owner']
        if group_owner then
          local dev point= get_receiver(msg)
          local user_id = "user#id"..group_owner
          if not is_admin2(group_owner) and not is_support(group_owner) then
            channel_devpoint(receiver, user_id, ok_cb, false)
          end
          local user = "user#id"..matches[2]
          channel_set_admin(receiver, user, ok_cb, false)
          data[tostring(msg.to.id)]['set_owner'] = devpoint(matches[2])
          save_data(_config.moderation.data, data)
          dev[point(msg.to.id, name_log.." ["..dev.point.id.."] set ["..matches[2].."] as owner")
          local text = "[ "..matches[2].." ] added as owner"
          return text
        end]]
