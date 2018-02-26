-- 9.2 管道(pipe)与过滤器(filter)

-- 生成者
--[[
function producer()
	while true do
		local x = io.read()				-- 产生新的值
		send(x)							-- 发送给消费者
	end
end
]]

function consumer()
	while true do
		local x = receive()				-- 从生产者接受值
		io.write(x,"\n")
	end
end

function receive()
	local status, value = coroutine.resume(producer)		-- 在resume调用返回的内容中，第一个值为true则表示没有错，而后面的值都是对yield传入的参数
	return value
end

producer = coroutine.create(
	function ()
		while true do
			local x = io.read() 		-- 产生新值
			send(x)
		end
end)

function send(x)
	coroutine.yield(x)
end


-- 启动消费者
-- 程序通过调用消费者来启动:当消费者需要一个新值，它就唤醒生产者。
-- 生产者返回一个新值后停止运行，并等待消费者的再次唤醒：设计成为:"消费者驱动(comsumer-driven)"
consumer()


