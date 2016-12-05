

keyPad = transpose(reshape(linspace(1,9,9),(3,3)))

inputFile = open("/Users/maxj/Code/Projects/advent-of-code/2016/day2.txt")

location = [2,2]

up =    [-1, 0]
down =  [1, 0]
left =  [0, -1]
right = [0, 1]

value = 0

for step in readlines(inputFile)
  for i in 1:length(step)
    if step[i] == 'U'
      tempLocation = location + up
    elseif step[i] == 'D'
      tempLocation = location + down
    elseif step[i] == 'L'
      tempLocation = location + left
    elseif step[i] == 'R'
      tempLocation = location + right
    end

    try
      value = keyPad[tempLocation[1], tempLocation[2]]
      location = tempLocation
    catch
      value = keyPad[location[1], location[2]]
    end

  end
  println("Value: ", value)
end
