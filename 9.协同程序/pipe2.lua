-- 9.2 管道(pipe)与过滤器(filter)
-- 实现"filter",过滤器是一种位于生产者和消费者之间的处理功能，可用于对数据的一些交换
function receive (prod)
	local status,value = coroutine.resume(prod)
	return value
end

function send (x)
	coroutine.yield(x)
end

function producer ()
	return coroutine.create(function ()
		while true do
			local x = io.read()				-- 产生新值
			send(x)
		end
	end)
end

function filter (prod)
	return coroutine.create(function ()
		for line = 1 ,math.huge do
			local x = receive(prod)			-- 获取新值
			x = string.format("%5d %s",line,x)
			send(x)							-- 将新值发送给消费者
		end
	end)
end

function consumer (prod)
	while true do
		local x = receive(prod)
		io.write(x,"\n")
	end
end

-- 启动程序
p = producer()
f = filter(p)
consumer(f)

-- 简单写法
-- consumer(filter(producer()))
