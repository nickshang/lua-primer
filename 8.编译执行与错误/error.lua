--[[
	8.4 错误处理与异常
	lua中处理错误，必须使用函数pcall来报装需要执行的代码

	假设lua代码
	function foo ()
		<一些代码>
		if 未预期的条件 then error() end 
		<一些代码>
		print (a[i])		-- 潜在的错误: a可能不能一个table
		<一些代码>
	end

	然后使用pcall来调用foo:
		if pcall(foo) then
			-- 在执行一些foo时没有发生错误
			<常规代码>
		else 
			-- foo引发了一个错误采用适当的行动
			<错误处理代码>
		end
]]
local status, err = pcall(function() error({code = 121}) end) 
print(err.code)