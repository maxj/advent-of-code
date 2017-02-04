
function findCheckSum(key)
    k = 1
    top = 5
    roomId = replace(key[1:rsearch(key, "-")[1]],"-","")
    uniques = sort(unique(roomId))
    result = Array{Any}(length(uniques), 2)
    for character in uniques
        count = length(matchall(Regex("$character"),roomId))
        result[k,1] = character
        result[k,2] = -count
        k+=1
    end
    sorted = sortrows(result, by=x->(x[2],x[1]), rev=true)
    checksum = join(sorted[end:-1:size(sorted)[1]-top+1,1], "")
    return checksum
end

function getProvidedChecksum(key)
  return key[search(key, "[")[1]+1:end-1]
end

function getRoomNumber(key)
  return parse(Int,key[rsearch(key, "-")[1]+1:search(key, "[")[1]-1])
end

#akey = "aaaaa-bbb-z-y-x-123[abxyz]"
#akey = "a-b-c-d-e-f-g-h-987[abcde]"
#akey = "not-a-real-room-404[oarel]"
#akey = "totally-real-room-200[decoy]"

inputFile = open("/Users/maxj/Code/Projects/advent-of-code/2016/day4.txt")
sum = 0
for key in readlines(inputFile)
  key = strip(key)
  if (findCheckSum(key) == getProvidedChecksum(key))
    sum += getRoomNumber(key)
  end
end

println("Final sum: ", sum)
