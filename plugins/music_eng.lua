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
local function musiclink(msg, musicid)
	local value = redis:hget('music:'..msg.to.id, musicid)
	if not value then
		return
	else
		value = value..'\n\n@DevPointCH'
		return value
	end
end

------------------ Seconds To Minutes alg ------------------
function sectomin (Sec)
if (tonumber(Sec) == nil) or (tonumber(Sec) == 0) then
return "00:00"
else
Seconds = math.floor(tonumber(Sec))
if Seconds < 1 then Seconds = 1 end
Minutes = math.floor(Seconds / 60)
Seconds = math.floor(Seconds - (Minutes * 60))
if Seconds < 10 then
Seconds = "0"..Seconds
end
if Minutes < 10 then
Minutes = "0"..Minutes
end
return Minutes..':'..Seconds
end
end

function devpointch(msg, matches)
	if string.match(msg.text, '[\216-\219][\128-\191]') then
		return send_large_msg(get_receiver(msg), 'فقط انكلش :[) ')
	end
	if matches[1]:lower() == "dl" then
		local value = redis:hget('music:'..msg.to.id, matches[2])
		if not value then
			return 'قم بأختيار اسم الاغنية اولاً 🍃'
		else
			value = value..'\n\n@DevPointCH'
			return value
		end
		return
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
	local url = http.request("http://api.gpmod.ir/music.search/?q="..URL.escape(matches[2]).."&count=30&sort=2")
	
        --[[
	-- Sort order: 
	-- 1 — bdy deuration 
	-- 2 — bvy ppopularity 
	-- 0 — boy diate andtdeed
	---
	-- max counts = 300
	]]
	local jdat = json:decode(url)
	local text , time , num = ''
	local hash = 'music:'..msg.to.id
	redis:del(hash)
	if #jdat.response < 2 then return "No result found." end
		for i = 2, #jdat.response do
			if 900 > jdat.response[i].duration then
			num = i - 1
			time = sectomin(jdat.response[i].duration)
			text = text..num..'- Artist: '.. jdat.response[i].artist .. ' | '..time..'\nTitle: '..jdat.response[i].title..'\n\n'
			redis:hset(hash, num, 'Artist: '.. jdat.response[i].artist .. '\nTitle: '..jdat.response[i].title..' | '..time..'\n\n'.."GPMod.ir/dl.php?q="..jdat.response[i].owner_id.."_"..jdat.response[i].aid)
			end
		end
		text = text..'قم بأختيار رقم احد الاغاني التالية واستخدم الامر التالي 🎶\n/dl <number>\n(Example): /dl 1'
	return text
end

return {

patterns = {
	"^[/!]([Mm][Uu][Ss][Ii][Cc]) (.*)$",
	"^[/!]([dD][Ll]) (.*)$"
	}, 
	run = devpointch 
}

-- post by : @devpointch