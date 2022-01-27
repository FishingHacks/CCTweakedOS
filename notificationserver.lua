m = peripheral.find("modem")
m.open(2)

notifications = {}

function string.starts(str, srtr)
return string.sub(str, 1, string.len(srtr))==srtr
end

while true do
event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
if channel == 2 then
if string.starts(message, "ntf") then
id = string.sub(message, 4,8)
message = string.sub(message, 9)
if notifications[id] == nil then notifications[id] = {} end
table.insert(notifications[id], message)
elseif string.starts(message, "ftc") then
id = string.sub(message, 4,8)
if notifications[id] == nil then notifications[id] = {} end
m.transmit(2, 2, "sfc"..id..textutils.serialise(notifications[id]))
print("sfc"..id..textutils.serialise(notifications[id]))
notifications[id] = {}
end
end
end
