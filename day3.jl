
inputFile = open("/Users/maxj/Code/Projects/advent-of-code/2016/day3.txt")

possible = 0
for triangle in readlines(inputFile)
  line = (split(strip(triangle)))
  dims = map(x->parse(Int,x),line)
  dims = sort(dims)
  if ((dims[1] + dims[2]) > dims[3])
    possible += 1
  end
end
println(possible)
