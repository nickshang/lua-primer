-- 7.3 无状态的迭代器
a = {"one","two","three"}

for i, v in ipairs(a) do
	print(i,v)
end

local function iter(a,i)
	i = i + 1
	local v = a[i]
	if v then 
		return i,v
	end
end

-- lua调用for循环中的ipairs(a)时，他会获得3个值:迭代器函数iter，恒定状态a和控制变量的初值0
-- 然后lua调用iter(a,0)，得到1,a[1]。在第二次迭代中，继续调用iter(a,1),得到2,a[2],依次类推，直至得到第一个nil元素为止。

function ipairs(a)
	return iter,a,0
end

for i, v in ipairs(a) do
	print(i,v)
end

-- 不喜欢pairs调用而直接next
for k,v in next, t do
	print('')
end

-- 遍历链表
local function getnext(list,node)
	if not node then
		return list
	else 
		return node.next
	end 
end

function traverse(list)
	

