while True:
    pyramid_height = int(input('Height: '))

    if pyramid_height > 0 and pyramid_height < 9:
        break

answer_range = range(pyramid_height)
mario_array = [[] for y in answer_range]
result = []

for i in answer_range:
    pyramid_node = mario_array[i]

    for j in answer_range:
        if j >= i:
            pyramid_node.append('#')
        else:
            pyramid_node.append(' ')

    result.append(
        pyramid_node + ['  '] + (pyramid_node[:(i - 1):-1] if i > 0 else pyramid_node[::-1]))

result.reverse()

for i in range(len(result)):
    for j in range(len(result[i])):
        print(result[i][j], end="")
    print()
