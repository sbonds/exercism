# 1) Single pass, splitting digits on word boundaries into array elements
#    and newlines into new sub-arrays
# 2) Two pass, splitting newlines into an array of strings and then splitting
#    each string into digits-on-word-boundaries


class Matrix(object):
    def __init__(self, matrix_string):
        self.list_of_lists = []
        for line in matrix_string.splitlines():
            array_line = []
            words = line.split()
            for word in words:
                array_line.append(int(word))
            self.list_of_lists.append(array_line)

    def row(self, index):
        return(self.list_of_lists[index-1])

    def column(self, index):
        column = []
        for line in self.list_of_lists:
            column.append(line[index-1])
        return column
