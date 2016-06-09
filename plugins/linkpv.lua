
do

function run(msg, matches)
       if not is_momod(msg) then
        return "For owner only!"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "First use /newlink or if bot isn't creator user /setlink"
       end
         local text = "SuperGroup link  :\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "تم ارسال رابط المجموعة الى الخاص ✔"
end

return {
  patterns = {
    "^[/#!]([Ll]inkpv)$"
  },
  run = run
}

end

--[[
post by : @DevPointCH

للمزيد من الشروحات والملفات اشترك في قناة @DevPointCH

]]