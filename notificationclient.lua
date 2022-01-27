function pn(arg0, arg1)
if peripheral.find("speaker") == nil then else peripheral.find("speaker").playNote("pling", 0.5, 24) end
print("A new Message: "..arg1)
end

if fs.exists("/getmessages") then
require("/getmessages")
else
require("/disk/getmessages")
end


print("")
while true do
notifics = textutils.unserialise(getnotifics())
table.foreach(notifics, pn)
sleep(3)
end
