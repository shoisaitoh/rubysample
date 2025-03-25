require 'active_support/time'
p "hoge"
p tk = Time.now
p Time.now.zone

#hoge = "2023-02-03T15:00:00Z"
#tk = hoge.in_time_zone('Tokyo')
tk2 = Time.now.in_time_zone('Tokyo')
tkL = Time.now.in_time_zone('London')
p tk2
p tkL

if tk == tk2
  p "同じ時刻です"
else
  p "差分は#{tk2 - tk}です"
end