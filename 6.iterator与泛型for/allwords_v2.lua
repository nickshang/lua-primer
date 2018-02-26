-- 7.4 具有复杂状态的迭代器
-- 泛型for缺只提供的一个恒定的状态和一个控制变量用于状态的保存
-- 方法1： 使用closure
-- 方法2:  将迭代器所需要的所有状态打包为一个table
-- 重写allwords迭代器，这个迭代器可以遍历当前输入文件中的所有单词。这次将它的状态保存在一个table中，具有两个字段:line和pos
-- 建议：
-- 	1.尽可能地尝试编写无状态的迭代器，那些迭代器将所有的状态保存在for变量中，不需要在开始一个循环时创建任何新的对象
-- 	2.如果迭代器无法套用这个模型，那么就应该尝试使用closure
-- closure与具有复杂状态的实现迭代器对比：
-- 	1.创建一个closure就比创建一个table更廉价
--  2.访问“非局部的变量”比访问table字段更快
local iterator		-- 在后面定义

function allwords ()
	local state = {line = io.read(),pos = 1}
	return iterator,state
end

function iterator (state)
	while state.line do 			-- 若为有效的行内容就进入循环
		-- 搜索下一个单词
		local s, e = string.find(state.line, "%w+",state,pos)
		if s then 					-- 找到一个单词？
			-- 更新下一个位置(到这个单词之后)
			state.pos = e + 1
			return string.sub(state.line, s, e)
		else 
			state.line = io.read()	-- 尝试下一行...
			state.pos = 1			-- 从第一个位置开始
		end
	end
	return nil
end
