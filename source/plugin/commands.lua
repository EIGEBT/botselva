function cmd(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "قيصر") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end

msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww and not Redis:get(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) then
text = neww or text
end
end
---
if text and Redis:get(Fast.."All:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id) == "true1" then
local NewCmd = Redis:get(Fast.."All:Command:Reids:Group:New"..msg_chat_id)
Redis:set(Fast.."All:Get:Reides:Commands:Group"..text,NewCmd)
Redis:sadd(Fast.."All:Command:List:Group",text)
Redis:del(Fast.."All:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم حفظ الامر باسم ← { "..text..' }',"md",true)
end
if text and Redis:get(Fast.."All:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(Fast.."All:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(Fast.."All:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id)
Redis:set(Fast.."All:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id,"true1") 
return send(msg_chat_id,msg_id,"• ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
local NewCmmd = Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
print (NewCmmd)
Redis:del(Fast.."All:Get:Reides:Commands:Group"..text)
Redis:del(Fast.."All:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(Fast.."All:Command:List:Group",text)
send(msg_chat_id,msg_id,"• تم ازالة هاذا ← { "..text.." }","md",true)
Redis:del(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id)
return false
end
---
if text == 'الاوامر' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = senderr..'/help1'}, {text = '{ 𝟐 }', data = senderr..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = senderr..'/help3'}, {text = '{ 𝟒 }', data = senderr..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = senderr..'/help5'}, {text = '{ 𝟔 }', data = senderr..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = senderr..'/helpsudo'},{text = '{ الالعاب }', data = senderr..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = senderr..'/helpts'},
},
{
{text = '{ القفل / الفتح }', data = senderr..'/NoNextSeting'}, {text = '{ التعطيل / التفعيل }', data = senderr..'/listallAddorrem'}, 
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id,msg_id, [[*
• اوامــر البــوت الرئيسيـة 
ـــــــــــــــــــــــــــــــــــ
• { م1 } ← اوامر الحمايه
• { م2 } ← اوامر الادمنيه
• { م3 } ← اوامر المدراء
• { م4 } ← اوامر المنشئين
• { م5 } ← اوامر المالكين
• { م6 } ← اوامر التسليه
• { م المطور } ← اوامر المطور
*]],"md",false, false, false, false, reply_markup)

elseif text == 'م المطور' then
if not msg.Dev then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(3)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
اوامر المطور الاساسي  
ـــــــــــــــــــــــــــــــــــ
• تفعيل  ←  تعطيل
• رفع  تنزيل ← مطور اساسي
• المطورين الاساسيين
• مسح المطورين الاساسيين
• رفع  تنزيل ← مطور ثانوي
• المطورين الثانويين  
• مسح المطورين الثانويين
• رفع  تنزيل ← مطور
• المطورين ← مسح المطورين
• تغيير المطور الاساسي
ـــــــــــــــــــــــــــــــــــ
• تفعيل الوضع المدفوع + الايدي 
• الغاء الوضع المدفوع + الايدي
• حظر جروب + { الايدي }
• غادر ← + { الايدي }
• اسم بوتك + غادر بالجروب
• تفعيل تعطيل الاشتراك الاجباري
• الاشتراك الاجباري
• تغيير الاشتراك الاجباري
• تفعيل تعطيل الاشتراك الاجباري للجروب
• الاشتراك الاجباري للجروب
• تعيين عدد الاعضاء + {العدد}
ـــــــــــــــــــــــــــــــــــ
• حظر عام ، الغاء العام
• قائمه العام ، مسح قائمه العام
• كتم عام ، الغاء كتم عام
• المكتومين عام
• مسح المكتومين عام
ـــــــــــــــــــــــــــــــــــ
• تغيير ، مسح ←{ اسم البوت }
• ضع صوره للترحيب 
• الاحصائيات
• ذيع + ايدي الجروب بالرد
• اذاعه ، اذاعه خاص
• اذاعه بالتوجيه ، اذاعه بالتثبيت
• اذاعه خاص بالتوجيه
ـــــــــــــــــــــــــــــــــــ
• تفعيل تعطيل جلب النسخه التلقائيه
• جلب نسخه احتياطيه
• رفع النسخه الاحتياطيه بالرد
• رفع نسخه تشاكي بالرد
• جلب نسخه الردود 
• رفع نسخه الردود بالرد
• معلومات التنصيب
ـــــــــــــــــــــــــــــــــــ
• تعيين ، مسح ← { الايدي عام }
• اضف ، مسح ← {رد عام}
• اضف ، مسح ← {رد عام متعدد}
• ضع ، مسح ← { الترحيب عام } 
• ضع ، مسح ← { كليشه المطور }
• الردود العامه ، مسح الردود العامه
• اضف مسح صوت عام
• الصوتيات العامه 
• مسح الصوتيات العامه
• منع عام ، الغاء منع عام
• قائمه المنع عام
• مسح قائمه المنع عام
ـــــــــــــــــــــــــــــــــــ
• اضف مسح ← سؤال
• الاسئله المضافه
• مسح الاسئله المضافه
• اضف مسح ← لغز 
• الالغاز ~ مسح الالغاز
• اضف مسح ← سؤال كت 
• اسئله كت
• اضف اسئله كت
• مسح اسئله كت
• اضف موسيقى 
• مسح موسيقى بالرد 
• قائمة الموسيقى 
• مسح قائمه الموسيقى
ـــــــــــــــــــــــــــــــــــ
• تفعيل ، تعطيل ← الاوامر التاليه↓
• البوت الخدمي ، المغادرة ، الاذاعه
• التواصل ، الاحصائيات
• ملف ← { اسم الملف }
ـــــــــــــــــــــــــــــــــــ
• مسح جميع الملفات 
• المتجر ، الملفات
• تحديث ، تحديث السورس 
ـــــــــــــــــــــــــــــــــــ
• اوامر المطور في البوت
ـــــــــــــــــــــــــــــــــــ
• رفع، تنزيل ← { مالك }
• المالكين ، مسح المالكين
• تنزيل جميع الرتب
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'اوامر التسليه' then
if not msg.Dev then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(3)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
︙اوامر التسليه كالاتي: 
ـــــــــــــــــــــــــــــــــــ
• الامر ، تفعيل ، تعطيل  ← { الامر }
• غنيلي ، ريمكس ، اغنيه ، شعر
• صوره ،  متحركه
• انمي ، ميمز
• مسلسل ، فلم
• حساب العمر( احسب + تاريخ الميلاد)
• معنى اسم + الاسم
ـــــــــــــــــــــــــــــــــــ
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م1' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر الحمايه كالاتي ...
ـــــــــــــــــــــــــــــــــــ
• قفل ، فتح ← الامر 
• تستطيع قفل حمايه كما يلي ...
• ← { بالتقييد ، بالطرد ، بالكتم }
ـــــــــــــــــــــــــــــــــــ
• الكل ~ الدخول
• الروابط ~ المعرف
• التاك ~ الشارحه
• التعديل ~ تعديل الميديا
• المتحركه ~ الملفات
• الصور ~ الفيديو 
ـــــــــــــــــــــــــــــــــــ
• الماركداون ~ البوتات
• التكرار ~ الكلايش
• السيلفي ~ الملصقات
• الانلاين ~  الدردشه
ـــــــــــــــــــــــــــــــــــ
• التوجيه ~ الاغاني
• الصوت ~ الجهات
• الاشعارات ~ التثبيت 
• الوسائط ~ التفليش
• وسائط المميزين
• الفشار ~ الفارسيه
• الإنكليزيه
• الكفر ~ الاباحي
ـــــــــــــــــــــــــــــــــــ
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر ادمنية الجروب ...
ـــــــــــــــــــــــــــــــــــ
• رفع، تنزيل ← مميز
• المميزين ← مسح المميزين 
• رفع الادمنيه
• تاك ، تاك للكل ، الجروب
• منع ، الغاء منع
ـــــــــــــــــــــــــــــــــــ
• الاوامر التالية ← {بالرد ، بالمعرف}
• حظر ، طرد ← الغاء حظر 
• كتم ← الغاء كتم
• تقييد ← الغاء تقييد
• كشف ، رفع ← القيود
ـــــــــــــــــــــــــــــــــــ
• عرض القوائم كما يلي ...
ـــــــــــــــــــــــــــــــــــ
• المنشئين الاساسيين ، المنشئين 
• المدراء ، الادمنيه ، المميزين
• المشرفين ، المكتومين
• قائمه المنع
ـــــــــــــــــــــــــــــــــــ
• تثبيت ، الغاء تثبيت
• الرابط ، الاعدادات ، الحمايه
• الترحيب ، القوانين
• ضع رتبه  ← { اسم الرتبه } 
• تحكم ← {بالرد ، بالمعرف}
ـــــــــــــــــــــــــــــــــــ
• تفعيل ، تعطيل ← الاوامر التاليه :
• الترحيب ، الرابط 
• ردود البوت ، الالعاب
• اطردني ، التسليه
ـــــــــــــــــــــــــــــــــــ
• مسح ← الاوامر التاليه
• القوائم ، قائمه المنع ، المميزين
• الرابط ، القوانين ، الصوره
• مسح ← { عدد }
• مسح ← { بالرد }
ـــــــــــــــــــــــــــــــــــ
• اوامر الاعضاء والادمنيه 
ـــــــــــــــــــــــــــــــــــ
• ايدي ، ايدي بالرد ، رسائلي
• تفاعلي ، لقبي ، بايو ، ترند
• جهاتي ، تعديلاتي ، نقاطي
• بيع نقاطي + العدد
• مسح نقاطي
• قول + الكلمه
• زواج ، ثنائي اليوم 
• الوقت ، الساعه ، التاريخ
• الصوتيات ، الصوتيات العامه
• زخرفه ، تحويل الصيغ ، غنيلي
• همسه ، اسم برجك ، صورتي
• صلاحياتي ، رتبتي
• صلاحياته ← {بالرد ، بالمعرف}
• الرتبه ← {بالرد ، بالمعرف}
• التفاعل ← {بالرد ، بالمعرف}
• كشف ← {بالرد ، بالمعرف}
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر المدراء في الجروب
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ← ادمن
• الادمنيه ← مسح الادمنيه
• تنزيل الكل ← {بالرد ، بالمعرف}
• ️︙كشف ، طرد ، قفل ← البوتات
• قفل البوتات ← بالطرد
• فحص ← البوت
• طرد ← المحذوفين 
• قفل فتح ← ارسال القناة
ـــــــــــــــــــــــــــــــــــ
• لتغيير رد الرتب في البوت
ـــــــــــــــــــــــــــــــــــ
• تغيير رد ← {اسم الرتبه والنص} 
• المطور ، المالك ، المنشئ الاساسي
• المنشئ ، المدير ، الادمن
• المميز ، العضو
• مسح رد ← { اسم الرتبه }
ـــــــــــــــــــــــــــــــــــ
• وضع الرتب ← { بالرد ، بالمعرف}
• ضع رتبه ← { اسم الرتبه }
• مسح رتبه ← { بالرد ، بالمعرف}
ـــــــــــــــــــــــــــــــــــ
• وضع ، ضع ← الاوامر التاليه
• اسم + اسم الجروب
• رابط ، صوره
• قوانين ، وصف ،الترحيب 
ـــــــــــــــــــــــــــــــــــ
• تفعيل ، تعطيل ← الاوامر التاليه :
• الايدي ، الايدي بالصوره 
• ايدي العضو ، البايو
• صورتي ، اسمي
• الردود ، الابراج
• غنيلي ، الصيغ ، قول
• تنبيه الاسماء ، الصوتيات 
• الصوتيات العامه
ـــــــــــــــــــــــــــــــــــ
• مسح ← + { الامر } 
• المحظورين ، المطرودين
• المكتومين ← المقيدين
ـــــــــــــــــــــــــــــــــــ
• ترتيب الاوامر ← استعاده الاوامر
• اضف ، مسح ← { رد }
• الردود ، مسح الردود
• اضف ، مسح ← { رد متعدد}
• الردود المتعدده
• مسح الردود المتعدده
• تاك عام ، all
• الميديا ← امسح
• اضف رسائل + العدد { بالرد}
• اضف نقاط + العدد { بالرد }
• اضف تعديلات + العدد {بالرد}
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر المنشئ الاساسي
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ←{ منشئ }
• المنشئين ، مسح المنشئين
• رفع ، تنزيل ←{ مشرف }
• ضع لقب + اللقب ← { بالرد }
• صلاحيات الجروب
• مسح نقاطه ، رسائله ← {بالرد} 
• تفعيل ، تعطيل ← منع التصفيه
ـــــــــــــــــــــــــــــــــــ
• اوامر المنشئ الجروب
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ← { مدير }
• المدراء ، مسح المدراء
• تغيير ، مسح ←{ الايدي }
• تعيين ، مسح ←{ الايدي }
• اضف ، مسح ← { امر }
• الاوامر المضافه ، مسح الاوامر المضافه
• ضع التكرار ← { عدد }
• تفعيل الاوامر ← { اوامر اساسيه }
ـــــــــــــــــــــــــــــــــــ
• تفعيل ، تعطيل ← الاوامر التاليه :
• الردود العامه ، الطرد ، الحظر
• الرفع ، التاك ، نزلني ، ضع رتبه 
• تاك عام ، المسح التلقائي
• ضع عدد المسح + { عدد }
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end

if ChannelJoin(msg) == false then  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر مالك الجروب 
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ←{ مالك }
• المالكين ، مسح المالكين
 •تنزيل جميع الرتب
ـــــــــــــــــــــــــــــــــــ
• اوامر المالكين 
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ← { منشئ اساسي }
• المنشئين الاساسيين،
• مسح المنشئين الاساسيين
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'العاب السورس ™️', data = msg.sender_id.user_id..'/normgm'}, {text = 'العاب متطورة 🎳', data = msg.sender_id.user_id..'/degm'}, 
},
{
{text = '💸-💲[- بنك الحظ -]💲-💸', data = msg.sender_id.user_id..'/mounybank'}, 
},
{
{text = '⧫ 𝐂𝐀𝐄𝐒𝐀𝐑 • 𝘚𝘖𝘜𝘙𝘊𝘌 ⧫', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
🔺️╎ اهلا بك في { قسم } العاب السورس •
🔻╎ اختار اللعبه الي انت عايزها • ~
🔺️╎ من خلال الأزرار بالأسفل 👇 • ~
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
elseif text == 'م6' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end

if ChannelJoin(msg) == false then  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر التسلية
ـــــــــــــــــــــــــــــــــــ
• رفع ، تنزيل ← الاوامر التاليه ↓
ـــــــــــــــــــــــــــــــــــ
• غبي 
• سمب
• حمار
• خول
• قرد 
• عره
• متوحد
• متوحده
• كلب 
ـــــــــــــــــــــــــــــــــــ
• اوامر التاك 
ـــــــــــــــــــــــــــــــــــ
• الاغبياء
• الحمير
• الخولات
• السمب
• المتوحدين
• الكلاب
• العرر
• القرود
ـــــــــــــــــــــــــــــــــــ
• اوامر الترفيه 
ـــــــــــــــــــــــــــــــــــ
• زخرفه + النص
• مثال زخرفه محمود
• احسب + عمرك
• مثال احسب 2001/8/5
• معني + الاسم 
• مثال معني محمود
ـــــــــــــــــــــــــــــــــــ
• نسبه الحب/ الكره
• نسبه الرجوله/ الانوثه 
• نسبه الذكـــــاء/ الغباء 
ـــــــــــــــــــــــــــــــــــ
• الاوامــر بالـــرد  ⇣ 
ـــــــــــــــــــــــــــــــــــ
• زواج ~ طلاق
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
end
if chat_type(msg.chat_id) == "UserBot" then
if not msg.Asasy then 
if text == 'رجوع' or text == "/key" then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'القسم الديني',type = 'text'},
},
{
{text = 'قسم اليوتيوب',type = 'text'},{text = 'قسم بحث الاغاني', type = 'text'},
},
{
{text = 'قسم الترجمه',type = 'text'},
},
{
{text = '🎭 قسم الرمزيات 🎭',type = 'text'},
},
{
{text = 'قسم العاب السورس',type = 'text'},{text = 'قسم التسليه',type = 'text'},
},
{
{text = 'قسم اوامر النسب',type = 'text'},
},
{
{text = 'قسم السورس',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي المطور ', 'md', false, false, false, false, reply_markup)
elseif text == '🎭 قسم الرمزيات 🎭' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '⌖ متحركه ⌖',type = 'text'},{text = '⌖ خلفيات ⌖', type = 'text'},
},
{
{text = '⌖ هيدرات ⌖',type = 'text'},{text = '⌖ جداريات ⌖', type = 'text'},
},
{
{text = '⌖ رمزيات شباب ⌖',type = 'text'},{text = '⌖ رمزيات بنات ⌖', type = 'text'},
},
{
{text = '⌖ رمزيات رسم ⌖',type = 'text'},{text = '⌖ رمزيات فكتوري ⌖', type = 'text'},
},
{
{text = '⌖ رمزيات اقتباس ⌖',type = 'text'},{text = '⌖ رمزيات سينمائيه ⌖', type = 'text'},
},
{
{text = '⌖ رمزيات عبارات ⌖',type = 'text'},{text = '⌖ رمزيات كرتون ⌖', type = 'text'},
},
{
{text = '⌖ استوري ⌖',type = 'text'},
},
{
{text = '⌖ رمزيات فنانين عرب ⌖',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي العضو في قسم مبرمج السورس', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم السورس' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'سورس',type = 'text'},{text = 'قناة السورس', type = 'text'},
},
{
{text = 'مبرمج السورس',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي العضو في قسم مبرمج السورس', 'md', false, false, false, false, reply_markup)
elseif text == 'القسم الديني' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '⌖ اذكار ⌖',type = 'text'},{text = '⌖ قرآن ⌖',type = 'text'}, 
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي العضو في القسم الديني', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم الترجمه' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'ترجمه',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اضغط علي زر الترجمه ثم اختار لغه الجمله الي تريد تترجمها عربي او انجليزي', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم اليوتيوب' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'يوتيوب',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي العضو في قسم التحميل من موقع اليوتيوب مباشر 🎥', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم العاب السورس' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'اختبار الذكاء',type = 'text'},{text = 'مريم', type = 'text'},
},
{
{text = 'الالعاب',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي العضو في قسم العاب السورس والمجموعات 🎮', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم بحث الاغاني' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'بحث حماقي',type = 'text'},{text = 'بحث محمد فؤاد', type = 'text'},
},
{
{text = 'بحث نادر نور',type = 'text'},{text = 'بحث محمد منير', type = 'text'},
},
{
{text = 'بحث اصاله',type = 'text'},{text = 'بحث اليسا', type = 'text'},
},
{
{text = 'بحث امال ماهر',type = 'text'},{text = 'بحث سميره سعيد', type = 'text'},
},
{
{text = 'بحث دياب',type = 'text'},{text = 'بحث لؤي', type = 'text'},
},
{
{text = 'بحث رامي صبري',type = 'text'},{text = 'بحث رامي جمال', type = 'text'},
},
{
{text = 'بحث تامر حسني',type = 'text'},{text = 'بحث تامر عاشور', type = 'text'},
},
{
{text = 'بحث هاني شاكر',type = 'text'},{text = 'بحث احمد مكي', type = 'text'},
},
{
{text = 'بحث ريمكس رومانسي',type = 'text'},{text = 'بحث ريمكس حزين', type = 'text'},
},
{
{text = 'رجوع',type = 'text'}, 
},
}
}
return send(msg_chat_id,msg_id,'᥀ اهلا بك عزيزي في قسم البحث يمكنك كتابه ( بحث ) واسم المطرب او الاغنيه الي تريدها ✅', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم التسليه' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'غنيلي (1)',type = 'text'},{text = 'غنيلي (2)', type = 'text'},
},
{
{text = '⌖ غنيلي فيديو ⌖',type = 'text'}, 
},
{
{text = '⌖ قولي نكته ⌖',type = 'text'},{text = '⌖ صراحه ⌖', type = 'text'},
},
{
{text = '⌖ كتبات ⌖',type = 'text'},{text = '⌖ لو خيروك ⌖', type = 'text'},
},
{
{text = '⌖ حروف ⌖',type = 'text'},{text = '⌖ انصحني ⌖', type = 'text'},
},
{
{text = '⌖ تويت ⌖',type = 'text'}, 
},
{
{text = 'رجوع',type = 'text'}, 
},
}
}
return send(msg_chat_id,msg_id,'᥀ مرحبا بك عزيزي العضو في قسم التسليه ✅', 'md', false, false, false, false, reply_markup)
elseif text == 'قسم اوامر النسب' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'نـسـبـة الـحـب',type = 'text'},{text = 'نـسبـة الـكـرهـ', type = 'text'},
},
{
{text = 'نـسـبـة الـغـبـاء',type = 'text'},{text = 'نـسـبـة الذكـاء', type = 'text'},
},
{
{text = 'نـسـبـة الـرجـولـه',type = 'text'},{text = 'نـسـبـة الانـوثـه', type = 'text'},
},
{
{text = 'رجوع',type = 'text'}, 
},
}
}
return send(msg_chat_id,msg_id,'᥀ مرحبا بك عزيزي العضو في قسم اوامر النسب ✅', 'md', false, false, false, false, reply_markup)
end

elseif msg.Asasy then 
if text == '✠ - BACK - ✠' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تغيير شكل الكيبورد',type = 'text'},
},
{
{text = '⌔  قسم المطور الاساسي ⌔ ',type = 'text'},
},
{
{text = '⌔  قسم الاحصائيات ⌔ ',type = 'text'},{text = '⌔  قسم البوت ⌔ ', type = 'text'},
},
{
{text = '⌔  قسم ردود البوت ⌔ ',type = 'text'},{text = '🔺️ قسم رتب البوت 🔻', type = 'text'},
},
{
{text = '⌔  التفعيل والتعطيل ⌔ ',type = 'text'},{text = '⌔  قسم الاذاعه ⌔ ', type = 'text'},
},
{
{text = '⌔  قسم الحظر والكتم ⌔ ',type = 'text'},
},
{
{text = '⌔  قسم الملفات ⌔ ',type = 'text'},{text = '⌔  الاشتراك الاجباري ⌔ ',type = 'text'},
},
{
{text = '✠ قسم السورس ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - اضغط على ( *القسم* ) الذي تريد استخدامه • ', 'md', false, false, false, false, reply_markup)
elseif text == '✠ - رجوع - ✠' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قـسـم المـطـوࢪ الاسـاسـي',type = 'text'},
},
{
{text = '- ( قـسـم الاحـصـائـيـات ) -',type = 'text'},{text = '- ( قسم البوت ) -', type = 'text'},
},
{
{text = '- ( قـسـم ࢪدود البـوت ) -',type = 'text'},{text = '- ( قـسـم ࢪتب البوت ) -', type = 'text'},
},
{
{text = '- ( التـفـعـيـل و التـعـطـيـل ) -',type = 'text'},{text = '- ( قـسـم الاذاعـهہ ) -', type ='text'}
},
{
{text = '- ( قـسـم الحـظـࢪ والكـتـم ) -',type = 'text'},{text = '- ( الاشتࢪاك الاجباري ) -', type ='text'}
},
{
{text = '📂 قسم الملفات 📂',type = 'text'},
},
{
{text = 'رجوع الي الكيب الاساسي',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - اضغط على ( *القسم* ) الذي تريد استخدامه • ', 'md', false, false, false, false, reply_markup)
elseif text == 'رجوع الي الكيب الاساسي' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تغيير شكل الكيبورد',type = 'text'},
},
{
{text = '⌔  قسم المطور الاساسي ⌔ ',type = 'text'},
},
{
{text = '⌔  قسم الاحصائيات ⌔ ',type = 'text'},{text = '⌔  قسم البوت ⌔ ', type = 'text'},
},
{
{text = '⌔  قسم ردود البوت ⌔ ',type = 'text'},{text = '⌔  قسم رتب البوت ⌔ ', type = 'text'},
},
{
{text = '⌔  التفعيل والتعطيل ⌔ ',type = 'text'},{text = '⌔  قسم الاذاعه ⌔ ', type = 'text'},
},
{
{text = '⌔  قسم الحظر والكتم ⌔ ',type = 'text'},
},
{
{text = '⌔  قسم الملفات ⌔ ',type = 'text'},{text = '⌔  الاشتراك الاجباري ⌔ ',type = 'text'},
},
{
{text = '✠ قسم السورس ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - اضغط على ( *القسم* ) الذي تريد استخدامه • ', 'md', false, false, false, false, reply_markup)
elseif text == 'تغيير شكل الكيبورد' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قـسـم المـطـوࢪ الاسـاسـي',type = 'text'},
},
{
{text = '- ( قـسـم الاحـصـائـيـات ) -',type = 'text'},{text = '- ( قسم البوت ) -', type = 'text'},
},
{
{text = '- ( قـسـم ࢪدود البـوت ) -',type = 'text'},{text = '- ( قـسـم ࢪتب البوت ) -', type = 'text'},
},
{
{text = '- ( التـفـعـيـل و التـعـطـيـل ) -',type = 'text'},{text = '- ( قـسـم الاذاعـهہ ) -', type ='text'}
},
{
{text = '- ( قـسـم الحـظـࢪ والكـتـم ) -',type = 'text'},{text = '- ( الاشتࢪاك الاجباري ) -', type ='text'}
},
{
{text = '📂 قسم الملفات 📂',type = 'text'},
},
{
{text = 'رجوع الي الكيب الاساسي',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - اضغط على ( *القسم* ) الذي تريد استخدامه • ', 'md', false, false, false, false, reply_markup)
elseif text == 'قـسـم المـطـوࢪ الاسـاسـي' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '• تغيير المطور الاساسي',type = 'text'},
},
{
{text = "ضع صوره للترحيب •",type = 'text'},{text = 'معلومات التنصيب •',type = 'text'},
},
{
{text = 'الغاء الامر •',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *المطور الاساسي* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قسم البوت ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل البوت بصوره ❍',type = 'text'},{text = 'تعطيل البوت بصوره ❍', type = 'text'},
},
{
{text = 'تغيير كليشه المطور •',type = 'text'},{text = 'مسح كليشه المطور •', type = 'text'},
},
{
{text = 'تغيير كليشه ستارت •',type = 'text'},{text = 'مسح كليشه ستارت •', type = 'text'},
},
{
{text = 'تغيير اسم البوت •',type = 'text'},{text = 'مسح اسم البوت •', type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *البوت* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قـسـم الاحـصـائـيـات ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الاحصائيات •',type = 'text'},
},
{
{text = 'مجموعات',type = 'text'},{text = 'المشتركين', type = 'text'},
},
{
{text = 'تنظيف المجموعات •',type = 'text'},{text = 'تنظيف المشتركين •', type = 'text'},
},
{
{text = 'جلب الردود العامه',type = 'text'},{text = 'جلب نسخه الردود', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه •',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *احصائيات وتعداد* ) البوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قـسـم ࢪتب البوت ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'المطورين الاساسيين',type = 'text'},
},
{
{text = 'المطورين الثانويين',type = 'text'},{text = 'المطورين', type = 'text'},
},
{
{text = 'المدراء',type = 'text'},{text = 'المالكين', type = 'text'},
},
{
{text = 'المنشئين',type = 'text'},{text = 'المنشئين الاساسيين', type = 'text'},
},
{
{text = 'المميزين',type = 'text'},{text = 'الادمنيه', type = 'text'},
},
{
{text = 'قسم حذف ( الرتب ) اون لاين',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الرتب وحذفها* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قـسـم ࢪدود البـوت ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'اضف رد عام •',type = 'text'},{text = 'مسح رد عام •', type = 'text'},
},
{
{text = 'الردود العامه •',type = 'text'},{text = 'مسح الردود العامه •', type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الردود الخاصه* ) بالبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قـسـم الاذاعـهہ ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'اذاعه للمجموعات •',type = 'text'},{text = 'اذاعه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتوجيه •',type = 'text'},{text = 'اذاعه بالتوجيه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتثبيت •',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الاذاعه للبوت* ) اختر الأن • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( التـفـعـيـل و التـعـطـيـل ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل التواصل •',type = 'text'},{text = 'تعطيل التواصل •', type = 'text'},
},
{
{text = 'تفعيل البوت الخدمي •',type = 'text'},{text = 'تعطيل البوت الخدمي •', type = 'text'},
},
{
{text = 'تفعيل جلب النسخه التلقائيه',type = 'text'},{text = 'تعطيل جلب النسخه التلقائيه', type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *التفعيل والتعطيل* ) اختر الأن • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( قـسـم الحـظـࢪ والكـتـم ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'المكـتومين عام',type = 'text'},{text = 'المحظورين عام', type = 'text'},
},
{
{text = 'المكتومين',type = 'text'},{text = 'المحظورين', type = 'text'},
},
{
{text = 'قسم حذف ( كتم + حظر ) اون لاين',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *المحظورين والمكتومين* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '- ( الاشتࢪاك الاجباري ) -' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الاشتراك الاجباري •',type = 'text'},{text = 'تغيير الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري •',type = 'text'},{text = 'تعطيل الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل وضع اشتراك الاعضاء',type = 'text'},{text = 'تعطيل وضع اشتراك الاعضاء',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - رجوع - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الاشتراك الاجباري* ) للبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم الاحصائيات ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الاحصائيات •',type = 'text'},
},
{
{text = 'مجموعات',type = 'text'},{text = 'المشتركين', type = 'text'},
},
{
{text = 'تنظيف المجموعات •',type = 'text'},{text = 'تنظيف المشتركين •', type = 'text'},
},
{
{text = 'جلب الردود العامه',type = 'text'},{text = 'جلب نسخه الردود', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه •',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *احصائيات وتعداد* ) البوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم البوت ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل البوت بصوره ❍',type = 'text'},{text = 'تعطيل البوت بصوره ❍', type = 'text'},
},
{
{text = 'تغيير كليشه المطور •',type = 'text'},{text = 'مسح كليشه المطور •', type = 'text'},
},
{
{text = 'تغيير كليشه ستارت •',type = 'text'},{text = 'مسح كليشه ستارت •', type = 'text'},
},
{
{text = 'تغيير اسم البوت •',type = 'text'},{text = 'مسح اسم البوت •', type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *البوت* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم رتب البوت ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'المطورين الاساسيين',type = 'text'},
},
{
{text = 'المطورين الثانويين',type = 'text'},{text = 'المطورين', type = 'text'},
},
{
{text = 'المدراء',type = 'text'},{text = 'المالكين', type = 'text'},
},
{
{text = 'المنشئين',type = 'text'},{text = 'المنشئين الاساسيين', type = 'text'},
},
{
{text = 'المميزين',type = 'text'},{text = 'الادمنيه', type = 'text'},
},
{
{text = 'قسم حذف ( الرتب ) اون لاين',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الرتب وحذفها* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم ردود البوت ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'اضف رد عام •',type = 'text'},{text = 'مسح رد عام •', type = 'text'},
},
{
{text = 'الردود العامه •',type = 'text'},{text = 'مسح الردود العامه •', type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الردود الخاصه* ) بالبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم الاذاعه ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'اذاعه للمجموعات •',type = 'text'},{text = 'اذاعه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتوجيه •',type = 'text'},{text = 'اذاعه بالتوجيه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتثبيت •',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الاذاعه للبوت* ) اختر الأن • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  التفعيل والتعطيل ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل التواصل •',type = 'text'},{text = 'تعطيل التواصل •', type = 'text'},
},
{
{text = 'تفعيل البوت الخدمي •',type = 'text'},{text = 'تعطيل البوت الخدمي •', type = 'text'},
},
{
{text = 'تفعيل جلب النسخه التلقائيه',type = 'text'},{text = 'تعطيل جلب النسخه التلقائيه', type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *التفعيل والتعطيل* ) اختر الأن • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  الاشتراك الاجباري ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الاشتراك الاجباري •',type = 'text'},{text = 'تغيير الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري •',type = 'text'},{text = 'تعطيل الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل وضع اشتراك الاعضاء',type = 'text'},{text = 'تعطيل وضع اشتراك الاعضاء',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الاشتراك الاجباري* ) للبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم الملفات ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الملفات',type = 'text'},
},
{
{text = 'تحديث الملفات •',type = 'text'},{text = 'تحديث السورس •', type = 'text'},
},
{
{text = 'تعطيل ملف all.lua',type = 'text'},{text = 'تفعيل ملف all.lua', type = 'text'},
},
{
{text = 'تعطيل ملف bank.lua',type = 'text'},{text = 'تفعيل ملف bank.lua', type = 'text'},
},
{
{text = 'تعطيل ملف games.lua',type = 'text'},{text = 'تفعيل ملف games.lua', type = 'text'},
},
{
{text = 'تعطيل ملف gif.lua',type = 'text'},{text = 'تفعيل ملف gif.lua', type = 'text'},
},
{
{text = 'تعطيل ملف rdod.lua',type = 'text'},{text = 'تفعيل ملف rdod.lua', type = 'text'},
},
{
{text = ' تعطيل ملف Reply.lua',type = 'text'},{text = 'تفعيل ملف Reply.lua', type = 'text'},
},
{
{text = 'تعطيل ملف zhrfa.lua',type = 'text'},{text = 'تفعيل ملف zhrfa.lua', type = 'text'},
},
{
{text = 'تعطيل ملف zwag.lua',type = 'text'},{text = 'تفعيل ملف zwag.lua', type = 'text'},
},
{
{text = ' تعطيل ملف smsm.lua',type = 'text'},{text = 'تفعيل ملف smsm.lua', type = 'text'},
},
{
{text = 'تعطيل ملف convert.lua',type = 'text'},{text = 'تفعيل ملف convert.lua', type = 'text'},
},
{
{text = 'تعطيل ملف auto_lock.lua',type = 'text'},{text = 'تفعيل ملف auto_lock.lua', type = 'text'},
},
{
{text = 'تعطيل ملف youtube.lua',type = 'text'},{text = 'تفعيل ملف youtube.lua', type = 'text'},
},
{
{text = 'تعطيل ملف commands.lua',type = 'text'},{text = 'تفعيل ملف commands.lua', type = 'text'},
},
{
{text = 'تعطيل ملف change_name.lua',type = 'text'},{text = 'تفعيل ملف change_name.lua', type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الملفات* ) 📂 • \n *احذر وتأكد من ان جميع الملفات مفعله* ', 'md', false, false, false, false, reply_markup)
elseif text == '✠ قسم السورس ✠' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تعيين قناه السورس •',type = 'text'},{text = 'تعيين مطور السورس •', type = 'text'},
},
{
{text = 'تعيين رمز السورس •',type = 'text'},{text = 'حذف رمز السورس •',type = 'text'},
},
{
{text = 'سورس',type = 'text'},
},
{
{text = 'قناه السورس',type = 'text'},{text = 'مبرمج السورس', type = 'text'},
},
{
{text = 'الغاء الامر •',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *الخاص بالسورس* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم الحظر والكتم ⌔ ' then

local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'المكـتومين عام',type = 'text'},{text = 'المحظورين عام', type = 'text'},
},
{
{text = 'المكتومين',type = 'text'},{text = 'المحظورين', type = 'text'},
},
{
{text = 'قسم حذف ( كتم + حظر ) اون لاين',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *المحظورين والمكتومين* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '⌔  قسم المطور الاساسي ⌔ ' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '• تغيير المطور الاساسي',type = 'text'},
},
{
{text = "ضع صوره للترحيب •",type = 'text'},{text = 'معلومات التنصيب •',type = 'text'},
},
{
{text = 'الغاء الامر •',type = 'text'},
},
{
{text = '✠ - BACK - ✠',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي • \n◍ ⁞ - إليك قسم ( *المطور الاساسي* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
end
end

if not msg.Asasy then 
if text == '⌖ انصحني ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"لا تحقرون صغيره إن الجبال من الحصي",
"لا تستحي من إعطاء فإن الحرمان أقل منه ", 
"لا تظلم حتى لا تتظلم ",
"لا تقف قصاد الريح ولا تمشي معها ",
"لا تكسب موده التحكم الا بالتعقل",
"لا تمد عينك في يد غيرك ",
"لا تملح الا لمن يستحقاها ويحافظ عليها",
"لا حياه للإنسان بلا نبات",
"لا حياه في الرزق.. ولا شفاعه في الموت",
"كما تدين تدان",
"لا دين لمن لا عهد له ",
"لا سلطان على الدوق فيما يحب أو بكره",
"لا مروه لمن لادين له ",
"لا يدخل الجنه من لايأمن من جازه بوائقه",
"يسروا ولا تعسروا... ويشورا ولا تنفروا",
"يدهم الصدر ما يبني العقل الواسع ",
"أثقل ما يوضع في الميزان يوم القيامة حسن الخلق ",
"أجهل الناس من ترك يقين ما عنده لظن ما عند الناس ",
"أحياناً.. ويصبح الوهم حقيقه ",
"مينفعش تعاتب حد مبيعملش حساب لزعلك عشان متزعلش مرتين . ",
"السفر ومشاهده اماكن مختلفه وجديده ",
"عدم تضيع الفرص واسثمارها لحظه مجبئها ",
" اعطاء الاخرين اكثر من ما يتوقعون",
"معامله الناس بلطف ولكن عدم السماح لاحد بستغالال ذالك ",
"تكوين صدقات جديده مع الحفظ بلاصدقاء القودامي ",
"تعلم اصول المهنه بدلا من تضيع الوقت ف تعلم حيل المهنه ",
"مدح ع الاقل ثلاث اشخاص يوميا ",
"النظر ف عيون الشخاص عند مخاطبتهم ",
"التحلي بلسماح مع الاخرين او النفس ",
"الاكثار من قول كلمه شكرا ",
" مصافحه الاخرين بثبات وقوة ",
"الابتعاد عن المناطق السيئه السمعه لتجنب الاحداث السئه ",
" ادخار 10٪ع الاقل من الدخل",
" تجنب المخاوف من خلال التعلم من تجارب مختلفه",
" الحفاظ ع السمعه لانها اغلي ما يملك الانسان",
" تحويل الاعداء الي اصدقاء من خلال القيام بعمل جيد",
"لا تصدق كل ما تسمعع. ولا تنفق كل ما تمتلك . ولا تنم قدر ما ترغب ",
" اعتني بسمعتك جيدا فستثبت للك الايام انها اغلي ما تملك",
"حين تقول والدتك ستندم ع فعل ذالك ستندم عليه غالبا.. ",
" لا تخش العقبات الكبيره فخلفها تقع الفرص العظيمه",
"قد لا يتطلب الامر اكثر من شخص واحد لقلب حياتك رأس ع عقب ",
"اختر رفيقه حياتك بحرص فهو قرار سيشكل 90٪من سعادتك او بؤسك ",
" اقلب اداءك الاصدقاء بفعل شي جميل ومفجائ لهم",
"حين تدق الفرصه ع باباك ادعوها للبيت ",
"تعلم القواعد جيدا ثن اكسر بعدها ",
"احكم ع نجاحك من خلال قدرتك ع العطاء وليس الاخذ ",
" لا تتجاهل الشيطان مهما بدل ثيابه",
"ركز ع جعل الاشياء افضل وليس اكبر او اعظم ",
"كن سعيد  بما تمتلك واعمل لامتلاك ما تريد ",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ اذكار ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {"اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞", 
"االلَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞 ",
"من الأدعية النبوية المأثورة:اللهمَّ زَيِّنا بزينة الإيمان",
"اااللهم يا من رويت الأرض مطرا أمطر قلوبنا فرحا 🍂 ",
"اا‏اللَّهُـمَّ لَڪَ الحَمْـدُ مِنْ قَـا؏ِ الفُـؤَادِ إلىٰ ؏َـرشِڪَ المُقـدَّس حَمْـدَاً يُوَافِي نِـ؏ـمَڪ 💙🌸",
"﴿وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلًا﴾🌿✨",
"﴿وَمَن يَتَّقِ اللهَ يُكَفِّرْ عَنْهُ سَيِّئَاتِهِ وَيُعْظِمْ لَهُ أَجْرًا﴾",
"«سُبْحَانَ اللهِ ، وَالحَمْدُ للهِ ، وَلَا إلَهَ إلَّا اللهُ ، وَاللهُ أكْبَرُ ، وَلَا حَوْلَ وَلَا قُوَّةَ إلَّا بِاللهِ»🍃",
"وذُنُوبًا شوَّهتْ طُهْرَ قُلوبِنا؛ اغفِرها يا ربّ واعفُ عنَّا ❤️",
"«اللَّهُمَّ اتِ نُفُوسَنَا تَقْوَاهَا ، وَزَكِّهَا أنْتَ خَيْرُ مَنْ زَكَّاهَا ، أنْتَ وَلِيُّهَا وَمَوْلَاهَا»🌹",
"۝‏﷽إن اللَّه وملائكته يُصلُّون على النبي ياأيُّها الذين امنوا صلُّوا عليه وسلِّموا تسليما۝",
"فُسِبًحً بًحًمًدٍ ربًکْ وٌکْنِ مًنِ الَسِاجّدٍيَنِ 🌿✨",
"اأقُمً الَصّلَاةّ لَدٍلَوٌکْ الَشُمًسِ إلَيَ غُسِقُ الَلَيَلَ🥀🌺",
"نِسِتٌغُفُرکْ ربًيَ حًيَتٌ تٌلَهّيَنِا الَدٍنِيَا عٌنِ ذِکْرکْ🥺😢",
"وٌمًنِ أعٌرض عٌنِ ذِکْريَ فُإنِ لَهّ مًعٌيَشُةّ ضنِکْا 😢",
"وٌقُرأنِ الَفُجّر إنِ قُرانِ الَفُجّر کْانِ مًشُهّوٌدٍا🎀🌲",
"اأّذّأّ أّلَدِنِيِّأّ نَِّستّګوِ أّصٌلَګوِ زِّوِروِ أّلَمَقِأّبِر💔",
"حًتٌيَ لَوٌ لَمًتٌتٌقُنِ الَخِفُظُ فُمًصّاحًبًتٌ لَلَقُرانِ تٌجّعٌلَکْ مًنِ اهّلَ الَلَهّ وٌخِاصّتٌهّ❤🌱",
"وٌإذِا رضيَتٌ وٌصّبًرتٌ فُهّوٌ إرتٌقُاء وٌنِعٌمًةّ✨??",
"«ربً اجّعٌلَنِيَ مًقُيَمً الَصّلَاةّ وٌمًنِ ذِريَتٌيَ ربًنِا وٌتٌقُبًلَ دٍعٌاء 🤲",
"ااعٌلَمً انِ رحًلَةّ صّبًرکْ لَهّا نِهّايَهّ عٌظُيَمًهّ مًحًمًلَهّ بًجّوٌائزٍ ربًانِيَهّ مًدٍهّشُهّ🌚☺️",
"اإيَاکْ وٌدٍعٌوٌةّ الَمًظُلَوٌمً فُ إنِهّا تٌصّعٌدٍ الَيَ الَلَهّ کْأنِهّا شُرارهّ مًنِ نِار 🔥🥺",
"االَلَهّمً انِقُذِ صّدٍوٌرنِا مًنِ هّيَمًنِهّ الَقُلَقُ وٌصّبً عٌلَيَهّا فُيَضا مًنِ الَطِمًأنِيَنِهّ✨🌺",
"يَابًنِيَ إنِ صّلَاح الَحًيَاةّ فُ أتٌجّاهّ الَقُبًلَهّ 🥀🌿",
"الَلَهّمً ردٍنِا إلَيَکْ ردٍا جّمًيَلَا💔🥺",
} 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '🔻• أذكار أخري •🔺️', data = msg.sender_id.user_id..'/Haiw5'}, },}}
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ تويت ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {"اخر افلام شاهدتها", 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
" ممكن نبقي صحااب ع الفيس؟", 
" هل لسه بتحب الاكس؟", 
"عندك كام اكس في حياتك؟ ", 
"ينفع تبعتلي رقمك؟ ", 
" ما تيجي اعزمني ع حاجه بحبها؟", 
"ينفع احضنك؟ ", 
"قولي ع اكبر غلطه ندمان عليهاا؟ ", 
"عندك كام سنه؟ ", 
" عامل بلوك لكام واحد عندك؟", 
" قولي سر محدش يعرفه؟", 
" عندك كام اكس في حياتك؟", 
"بتعرف تقلش وتهزر؟ ", 
" لونك المفضل هو؟", 
" مين أقرب حد ليك الفتره دي ؟", 
" قولي ع اكبر غلطه ندمان عليهاا؟", 
" مين مغنيك المفضل؟", 
" حابب تبقي اي في المستقبل؟", 
"راضي عن حياتك بنسبه كام؟ ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد؟ ", 
"اي رأيك في صوره البروفايل بتاعتي؟ ", 
" هل باين عليا اني شخص لطيف؟", 
" توافق ترجع للاكس؟", 
"ممكن تضحي بحياتك لمين؟ ", 
"سافرت بلاد برا مصر واي هي؟ ", 
" اي رأيك في صوره البروفايل بتاعتي؟", 
" هل بتعتبر نفسك حلو وبتحب شكلك؟", 
" نفسك تزور انهي بلد في العالم؟", 
" شخصيه ع السوشيال شايف انها مميزه؟", 
"عندك فوبيا من اي؟ ", 
" ممكن تورينا لينك الصراحه؟", 
"عمرك عيطت ع حاجه؟ ", 
" شايف اي أسوأ صفه فيك؟", 
"هل شلت مواد قبل كد وعدت السنه؟ ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت؟ ", 
"معاك كام فلوس دلوقتي؟ ", 
" بتفضل صحابك البنات ولا الولاد؟", 
" مسامح الل ظلمك؟", 
" ممثلك الافضل؟", 
" ممكن تقول رساله لحد مش هيشوفها؟", 
"انت اهلاوي ولا زملكاوي؟ ", 
" اي حيوانك المفضل؟", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي؟ ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس هلال ؟ ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه هلال جدع؟ ", 
 "ليه هلال جدع؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" هل يعجبك سورس هلال ؟؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"اي رايك في سورس هلال ؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
  "تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت هلال؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب هلال؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل هلال لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '🔻• أضغط لسؤال أخر •🔺️', data = msg.sender_id.user_id..'/Haiw7'}, },}}
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ حروف ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {" جماد بحرف ⇦ ر  ", 
" مدينة بحرف ⇦ ع  ",
" حيوان ونبات بحرف ⇦ خ  ", 
" اسم بحرف ⇦ ح  ", 
" اسم ونبات بحرف ⇦ م  ", 
" دولة عربية بحرف ⇦ ق  ", 
" جماد بحرف ⇦ ي  ", 
" نبات بحرف ⇦ ج  ", 
" اسم بنت بحرف ⇦ ع  ", 
" اسم ولد بحرف ⇦ ع  ", 
" اسم بنت وولد بحرف ⇦ ث  ", 
" جماد بحرف ⇦ ج  ",
" حيوان بحرف ⇦ ص  ",
" دولة بحرف ⇦ س  ",
" نبات بحرف ⇦ ج  ",
" مدينة بحرف ⇦ ب  ",
" نبات بحرف ⇦ ر  ",
" اسم بحرف ⇦ ك  ",
" حيوان بحرف ⇦ ظ  ",
" جماد بحرف ⇦ ذ  ",
" مدينة بحرف ⇦ و  ",
" اسم بحرف ⇦ م  ",
" اسم بنت بحرف ⇦ خ  ",
" اسم و نبات بحرف ⇦ ر  ",
" نبات بحرف ⇦ و  ",
" حيوان بحرف ⇦ س  ",
" مدينة بحرف ⇦ ك  ",
" اسم بنت بحرف ⇦ ص  ",
" اسم ولد بحرف ⇦ ق  ",
" نبات بحرف ⇦ ز  ",
"  جماد بحرف ⇦ ز  ",
"  مدينة بحرف ⇦ ط  ",
"  جماد بحرف ⇦ ن  ",
"  مدينة بحرف ⇦ ف  ",
"  حيوان بحرف ⇦ ض  ",
"  اسم بحرف ⇦ ك  ",
"  نبات و حيوان و مدينة بحرف ⇦ س  ", 
"  اسم بنت بحرف ⇦ ج  ", 
"  مدينة بحرف ⇦ ت  ", 
"  جماد بحرف ⇦ ه  ", 
"  اسم بنت بحرف ⇦ ر  ", 
" اسم ولد بحرف ⇦ خ  ", 
" جماد بحرف ⇦ ع  ",
" حيوان بحرف ⇦ ح  ",
" نبات بحرف ⇦ ف  ",
" اسم بنت بحرف ⇦ غ  ",
" اسم ولد بحرف ⇦ و  ",
" نبات بحرف ⇦ ل  ",
"مدينة بحرف ⇦ ع  ",
"دولة واسم بحرف ⇦ ب  ",
} 
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ لو خيروك ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الايس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص اخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك اب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
}
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ كتبات ⌖' then

if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ℘︙ 💜",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ؟.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .??",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى. ℘︙ ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء، وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ، أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل تواسيهُم واحد ورا التاني لكن أنتَ هتتنسي ومحدِش هَيواسيك.",
"‏ جَبَرَ الله قلوبِكُم ، وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق، ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ، أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ، فما بالك وأنا في كامل توهجي ؟",
"‏ لا تعودني على دفء شمسك، إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمس سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ، انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !?? ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ، بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي، كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ❤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ❤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.❤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال، ‏ألا تتعبين؟",
"البدايات للكل ، والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ",
} 
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ صراحه ⌖' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {
"هل تعرضت لغدر في حياتك؟",
"هل تعرف عيوبك؟",
"هل أنت مُسامح أم لا تستطيع أن تُسامح؟",
"إذا قمت بالسفر إلى نُزهة خارج بلدك فمن هو الشخص الذي تُحب أن يُرافقك؟هل تتدخل إذا وجدت شخص يتعرض لحادثة سير أم تتركه وترحل؟",
"ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟",
"إذا أعجبت بشخصٍ ما، كيف تُظهر له هذا الإعجاب أو ما هي الطريقة التي ستتبعها لتظهر إعجابك به؟",
"هل ترى نفسك مُتناقضً؟",
"ما هو الموقف الذي تعرضت فيه إلى الاحراج المُبرح؟",
"ما هو الموقف الذي جعلك تبكي أمام مجموعة من الناس رغمًا عنك؟",
"إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقته؟",
}
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
elseif text == '⌖ قولي نكته ⌖' then
if not msg.Asasy then
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local texting = {" مرة واحد مصري دخل سوبر ماركت في الكويت عشان يشتري ولاعة راح عشان يحاسب بيقوله الولاعة ديه بكام قاله دينار قاله منا عارف ان هي نار بس بكام 😂",
"بنت حبت تشتغل مع رئيس عصابة شغلها في غسيل الأموال 😂",
"واحد بيشتكي لصاحبه بيقوله أنا مافيش حد بيحبني ولا يفتكرني أبدًا، ومش عارف أعمل إيه قاله سهلة استلف من الناس فلوس هيسألوا عليك كل يوم 😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟ ﻗﺎﻟﻬﺎ اﻫﻮه ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه 😂",
"واحده ست سايقه على الجي بي اي قالها انحرفي قليلًا قلعت الطرحة 😂",
"مرة واحد غبي معاه عربية قديمة جدًا وبيحاول يبيعها وماحدش راضي يشتريها.. راح لصاحبه حكاله المشكلة صاحبه قاله عندي لك فكرة جهنمية هاتخليها تتباع الصبح أنت تجيب علامة مرسيدس وتحطها عليها. بعد أسبوعين صاحبه شافه صدفة قاله بعت العربية ولا لاء؟ قاله انت  مجنون حد يبيع مرسيدس ??",
"مره واحد بلديتنا كان بيدق مسمار فى الحائط فالمسمار وقع منه فقال له :تعالى ف مجاش, فقال له: تعالي ف مجاش. فراح بلديتنا رامي على المسمار شوية مسمامير وقال: هاتوه 😂",
"واحدة عملت حساب وهمي ودخلت تكلم جوزها منه ومبسوطة أوي وبتضحك سألوها بتضحكي على إيه قالت لهم أول مرة يقول لي كلام حلو من ساعة ما اتجوزنا 😂",
"بنت حبت تشتغل مع رئيس عصابة شغلها في غسيل الأموال 😂",
"مره واحد اشترى فراخ علشان يربيها فى قفص صدره 😂",
"مرة واحد من الفيوم مات اهله صوصوا عليه 😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ ﻗﺎﻟﻬﺎ اﻫﻮه ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه 😂",
"مره واحد شاط كرة فى المقص اتخرمت. 😂",
"مرة واحد رايح لواحد صاحبهفا البواب وقفه بيقول له انت طالع لمين قاله طالع أسمر شوية لبابايا قاله يا أستاذ طالع لمين في العماره 😂",
} 
return send(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
end

end
return {Fast = cmd}