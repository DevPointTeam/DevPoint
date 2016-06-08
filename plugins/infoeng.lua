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
do
local Arian = 119626024 --put your id here(BOT OWNER ID)

local function setrank(msg, name, value) -- setrank function
  local hash = nil
  if msg.to.type == 'chat' then
    hash = 'rank:'..msg.to.id..':variables'
  end
  if hash then
    redis:hset(hash, name, value)
	return send_msg('chat#id'..msg.to.id, 'مقام کاربر ('..name..') به\n '..value..' تغییر داده شد. ', ok_cb,  true)
  end
end
local function res_user_callback(extra, success, result) -- /info <username> function
  if success == 1 then  
  if result.username then
   Username = '@'..result.username
   else
   Username = 'لايوجد'
  end
    local text = '› الاسم : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'› المعرف : '..Username..'\n'
               ..'› الايدي : '..result.id..'\n\n'
	local hash = 'whois:'..extra.chat2..':variables'
	local value = redis:hget(hash, result.id)
    if not value then
	 if result.id == tonumber(Arian) then
	   text = text..'› whois: (Sudo) \n\n'
	  elseif is_admin2(result.id) then
	   text = text..'› whois: (Admin) \n\n'
	  elseif is_owner2(result.id, extra.chat2) then
	   text = text..'› whois: (Owner) \n\n'
	  elseif is_momod2(result.id, extra.chat2) then
	    text = text..'›whois: (Moderator) \n\n'
      else
	    text = text..'›whois: (Member) \n\n'
	 end
   else
   text = text..'› whois : '..value..'\n\n'
  end
  local uhash = 'user:'..result.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'› msg : '..user_info_msgs..'\n\n'
  text = text..'ِ'
  send_msg(extra.receiver, text, ok_cb,  true)
  else
	send_msg(extra.receiver, extra.user..' نام کاربری مورد نظر یافت نشد.', ok_cb, false)
  end
end

local function action_by_id(extra, success, result)  -- /info <ID> function
 if success == 1 then
 if result.username then
   Username = '@'..result.username
   else
   Username = 'لايوجد'
 end
    local text = '› الاسم : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'› المعرف : '..Username..'\n'
               ..'› الايدي : '..result.id..'\n\n'
  local hash = 'whois:'..extra.chat2..':variables'
  local value = redis:hget(hash, result.id)
  if not value then
	 if result.id == tonumber(Arian) then
	   text = text..'› whois: (Sudo) \n\n'
	  elseif is_admin2(result.id) then
	   text = text..'› whois: (Admin) \n\n'
	  elseif is_owner2(result.id, extra.chat2) then
	   text = text..'› whois: (Owner) \n\n'
	  elseif is_momod2(result.id, extra.chat2) then
	   text = text..'› whois: (Moderator) \n\n'
	  else
	   text = text..'› whois: (Member) \n\n'
	  end
   else
    text = text..'› whois : '..value..'\n\n'
  end
  local uhash = 'user:'..result.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'› msg : '..user_info_msgs..'\n\n'
  text = text..'ِ'
  send_msg(extra.receiver, text, ok_cb,  true)
  else
  send_msg(extra.receiver, 'آیدی شخص مورد نظر در سیستم ثبت نشده است.\nاز دستور زیر استفاده کنید\n/info @username', ok_cb, false)
  end
end

local function action_by_reply(extra, success, result)-- (reply) /info  function
		if result.from.username then
		   Username = '@'..result.from.username
		   else
		   Username = 'لايوجد'
		 end
		 
    local text = '♍️- name : '..(result.from.first_name or '')..' '..(result.from.last_name or '')..'\n'
               ..'♑️- username : '..Username..'\n'
               ..'♑️- your ID : '..result.from.id..'\n\n'
	local hash = 'whois:'..result.to.id..':variables'
		local value = redis:hget(hash, result.from.id)
		 if not value then
		    if result.from.id == tonumber(Arian) then
		       text = text..'💟- whois: (Sudo) \n\n'
		     elseif is_admin2(result.from.id) then
		       text = text..'💟- whois: (Admin) \n\n'
		     elseif is_owner2(result.from.id, result.to.id) then
		       text = text..'💟- whois: (Owner) \n\n'
		     elseif is_momod2(result.from.id, result.to.id) then
		       text = text..'💟- whois: (Moderator) \n\n'
		 else
		       text = text..'💟- whois: (Member) \n\n'
			end
		  else
		   text = text..'› whois : '..value..'\n\n'
		 end
         local user_info = {}
  local uhash = 'user:'..result.from.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.from.id..':'..result.to.id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'ℹ️- msgs : '..user_info_msgs..'\n'
  text = text..'ِ'
    send_msg(extra.receiver, text, ok_cb, true)
end

local function action_by_reply2(extra, success, result)
local value = extra.value
setrank(result, result.from.id, value)
end

local function run(msg, matches)
 if matches[1]:lower() == 'setrank' then
  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)
  if not is_sudo(msg) then
    return "Only Owners !"
  end
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
  local value = string.sub(matches[2], 1, 1000)
    msgr = get_message(msg.reply_id, action_by_reply2, {receiver=receiver, Reply=Reply, value=value})
  else
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local text = setrank(msg, name, value)

  return text
  end
  end
 if matches[1]:lower() == 'info' and not matches[2] then
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
    msgr = get_message(msg.reply_id, action_by_reply, {receiver=receiver, Reply=Reply})
  else
  if msg.from.username then
   Username = '@'..msg.from.username
   else
   Username = 'لايوجد'
end
   local text = '♍️- First Name : '..(msg.from.first_name or 'لا يوجد ')..'\n'
   local text = text..'♒️- Last Name : '..(msg.from.last_name or 'لا يوجد ')..'\n'	
   local text = text..'♑️- Username : '..Username..'\n'
   local text = text..'🆔- Your id : '..msg.from.id..'\n'
  local text = text..'📲- phone : '..(msg.from.phone or 'لا يوجد ')..'\n'
   local hash = 'rank:'..msg.to.id..':variables'
	if hash then
	  local value = redis:hget(hash, msg.from.id)
	  if not value then
		if msg.from.id == tonumber(Arian) then
		 text = text..'💟- Your : --انت مطور-- \n'
		elseif is_sudo(msg) then
		 text = text..'💟- Your : --انت مطور-- \n'
		elseif is_owner(msg) then
		 text = text..'💟- Your : --انت مشرف-- \n'
		elseif is_momod(msg) then
		 text = text..'💟- Your : --انت ادمن-- \n'
		else
		 text = text..'💟- Your : --انت عضو--\n'
		end
	  else
	   text = text..'💡 whois : '..value..'\n'
	  end
	end
    
	 local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
	 user_info_msgs = tonumber(redis:get(um_hash) or 0)
	 text = text..'ℹ️- Msgs :'..user_info_msgs..'\n\n'
	 if msg.to.type == 'chat' then
	 text = text..'› اسم المجموعه : '..msg.to.title..'\n'
     text = text..'› ايدي المجموعه : '..msg.to.id
     return reply_msg(msg.id, text, ok_cb, false)
    end

    return send_msg(receiver, text, ok_cb, true)
    end
  end
  if matches[1]:lower() == '' and matches[2] then
   local user = matches[2]
   local chat2 = msg.to.id
   local receiver = get_receiver(msg)
   if string.match(user, '^%d+$') then
	  user_info('user#id'..user, action_by_id, {receiver=receiver, user=user, text=text, chat2=chat2})
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, res_user_callback, {receiver=receiver, user=user, text=text, chat2=chat2})
   end
  end
end

return {
  description = 'Know your information or the info of a chat members.',
  usage = {
	'!info: Return your info and the chat info if you are in one.',
	'(Reply)!info: Return info of replied user if used by reply.',
	'!info <id>: Return the info\'s of the <id>.',
	'!info @<user_name>: Return the member @<user_name> information from the current chat.',
	'!setrank <userid> <rank>: change members rank.',
	'(Reply)!setrank <rank>: change members rank.',
  },
  patterns = {
	"^[/!](info)$",
	"^[/!](info) (.*)$",
	"^[/!]([Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (%d+) (.*)$",
	"^[/!]([Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (.*)$",
	"^[/!](info)$",
	"^[/!](info) (.*)$",
	"^[Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (%d+) (.*)$",
	"^([Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (.*)$",
  },
  run = run
}

end
-- post by : @devpointch
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



