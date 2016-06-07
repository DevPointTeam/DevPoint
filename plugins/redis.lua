do
function run(msg, matches)
  if matches[1] == "run" and is_sudo(msg) then
    return os.execute("./launch.sh"):read('*all')
  elseif matches[1] == "update" and is_sudo(msg) then
     return io.popen("git pull"):read('*all')
  elseif  matches[1] == "redis" and is_sudo(msg) then 
    return io.popen("redis-server"):read('*all')
  end
end
return {
  patterns = {
    "^[/!](run)",
    "^[/!](update)",
    "^[/!](redis)"
  },
  run = run
}
end
