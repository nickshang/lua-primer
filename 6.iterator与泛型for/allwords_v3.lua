-- 7.5 真正的迭代器
function allwords( f )
	for line in io.lines() do 
		for word in string.gmatch(line,"%w+") do
			f(word)									-- call the function
		end
	end
end

-- 只想打印每个单词
allwords(print)

-- 还可以使用匿名函数作为循环体。例如：以下代买计算单词"hello"在输入文件中出现的次数
local count = 0
allwords(function(w)
	if w == "hello" then count = cont + 1 end
	end)
print(count)

-- 同样的任务若采用之前的迭代器风格也不是很困难
local count = 0 
for w in allwords() do
	if w == "hello" then count = count + 1 end
end
print(count)