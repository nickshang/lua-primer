-- 9.1 协同程序基础

-- 协同基础
-- --> thred:xxxxxx
co = coroutine.create(function() print("hi") end)
print(co)

-- 监控状态
-- -->suspended
print(coroutine.status(co))

-- 再次启动一个协同程序的执行
-- --> hi
coroutine.resume(co)

-- yield()使用
co = coroutine.create(function() 
		for i = 1,10 do
			print("co"..i)
			coroutine.yield()
		end
	end)

coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)

coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)

print(coroutine.resume(co))

if not coroutine.resume(co) then print("over") end

-- lua协同的程序还具有一项有用的机制，就是可以通过一对resume-yield来交换数据.
-- 在第一次调用resume时，并没有对应的yield在等待它，因此传递给resume的额外参数都将视为协同主函数的参数
co = coroutine.create(function(a,b,c)
		print("co",a,b,c)
	end)
coroutine.resume(co,1,2,3)

-- 在resume调用返回的内容中，第一个值为true则表示没有错，而后面的值都是对yield传入的参数
co  = coroutine.create(function(a,b)
		coroutine.yield(a + b,a -b)
	end)
print(coroutine.resume(co,20,10))

-- 与此对应的是,yield返回的额外字就是对应resume传入的参数
co = coroutine.create(function() 
		print("co",coroutine.yield())
	end)
coroutine.resume(co)
coroutine.resume(co,4,5);

-- 协同程序结束时，主函数返回的值作为对应resume的返回值
co = coroutine.create(function()
	return 6,7
	end)
print(coroutine.resume(co))




