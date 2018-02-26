-- 7.1 迭代器与closure
function values(t) 
	local i = 0
	return function () i = i + 1; return t[i] end
end

-- 第一种方式：自己创建迭代器
t = {10,20,30}
iter = values(t)			-- 创建迭代器
while true do
	local element = iter()	-- 调用迭代器
	if element == nil then break end
	print(element)
end

-- 第二种方式：泛型for创建迭代器
for element in values(t) do
	print(element)
end