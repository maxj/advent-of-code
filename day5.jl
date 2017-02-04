
using Nettle

key = "abc"
key = "uqwqemis"
index = 0
attempts = 1
answer = Array{Any}(1,8)
println("Starting...")
while (attempts < 9)
  attempt = string(key, index)
  hashKey = hexdigest("MD5", attempt)
  if hashKey[1:5] == "00000"
    println("hashKey: ", hashKey, " " ,hashKey[6], " index: ", index)
    answer[attempts] = hashKey[6]
    attempts += 1
  end
  index += 1
end

println(answer)
