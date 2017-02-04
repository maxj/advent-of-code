
inputFile = open("/Users/maxj/Code/Projects/advent-of-code/2016/day7-sample.txt")

entries = Array{Any}(100,6)

row = 0
for key in readlines(inputFile)
  row +=1
  k2 = (strip(key))
  for i = 1:length(k2)
    print(key[i])
    entries[row,i] = k2[i]
  end
end

for i = 1:row
  println(entries[i,:])
end


println("Done")
