
workspace()

inputFile = open("/Users/maxj/Code/Projects/advent-of-code/2016/directions.csv")
in = readstring(inputFile)
close(inputFile)
directions = split(strip(in), ", ")
#directions = ["R5", "L5", "R5", "R3"]
#directions = ["R2", "R2", "R2"]
#directions = ["R2", "L3"]
#directions = transpose(Array(input))
type Location
  x::Int
  y::Int
  cardinalDirection::Char
end

loc = Location(0,0,'N')
for d in directions
  direction = d[1]
  distance = parse(Int,d[2:end])

  if (loc.cardinalDirection == 'N')
    if (direction == 'R')
      loc.x += distance
      loc.cardinalDirection = 'E'
    else
      loc.x -= distance
      loc.cardinalDirection = 'W'
    end
    continue
  end

  if (loc.cardinalDirection == 'E')
    if (direction == 'R')
      loc.y -= distance
      loc.cardinalDirection = 'S'
    else
      loc.y += distance
      loc.cardinalDirection = 'N'
    end
    continue
  end

  if (loc.cardinalDirection == 'S')
    if (direction == 'R')
      loc.x -= distance
      loc.cardinalDirection = 'W'
    else
      loc.x += distance
      loc.cardinalDirection = 'E'
    end
    continue
  end

  if (loc.cardinalDirection == 'W')
    if (direction == 'R')
      loc.y += distance
      loc.cardinalDirection = 'N'
    else
      loc.y -= distance
      loc.cardinalDirection = 'S'
    end
    continue
  end
end
println("Distance: ", abs(loc.x) + abs(loc.y), " (", loc.x, ", ", loc.y, ")")
