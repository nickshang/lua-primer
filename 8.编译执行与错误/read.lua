-- 8.3 错误
-- lua通常嵌入在应用程序中，因此在发生错误时，他不能简单地崩溃或退出。相反，只要发生了一个错误，lua就应该结束当前程序快并返回应用程序
-- 通过调用error函数并传入一个错误的参数，通常这个函数就是比较恰当的错误的方式

print "enter a number"
n = io.read("*number")
if not n then error("invalid input") end

-- 由于像"if not <condititon then error end >"这样的组合是非常通用的代码，lua提供一个内建(built-in)函数assert来完成此类工作：
print("enter a number:")
n = assert(io.read("*number"),"invalid input")

w