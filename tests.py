# def print_strings(data: str):
#     pairs = data.split(',')
    
#     for pair in pairs:
#         name, age = pair.split(':')
#         print(f"\"({name}, {age})\"")
        
# data = "Jan:20,Anna:30,Piotr:25"
# print_strings(data)

# def no_dup(data: str):
#     names = data.split(",")
#     unique_names = []

#     for name in names:
#         if name not in unique_names:
#             unique_names.append(name)

#     return unique_names

# data = "Ala,Kasia,Bartek,Ala,Piotr,Kasia"
# print(no_dup(data))


# data = "Jan:20,Ada:19,Piotr:25"
# def return_tuples(data: str):
#     pairs = data.split(",")
#     tuples_list = []

#     for pair in pairs:
#         name, age = pair.split(":")
#         tuples_list.append((name, int(age)))

#     return tuples_list

# print(return_tuples(data))


# def return_dict(data: str):
#     pairs = data.split(",")
#     output = dict()

#     for pair in pairs:
#         name, age = pair.split(":")
#         output.update({name : age})
#     return output

# print(return_dict("Jan:20,Ada:19,Piotr:25"))

# list_of_lists = [[1, 2], [3, 4, 5], [6]]

# def flatten(list_of_lists: list):
#     flatten_list = []
#     for i in list_of_lists:
#         for j in i:
#             flatten_list.append(j)
#     return flatten_list

# print(flatten(list_of_lists))


# A = [1,2,3,4]
# B = [2,4]

# def list_diff(A: list, B: list):
#     list_of_diff = []
#     for i in A:
#         if i not in B:
#             list_of_diff.append(i)
#     return list_of_diff

# print(list_diff(A,B))
    

# text = "Ala ma kota Ala ma psa"

# def word_coutner(text: str):
#     words = text.split(" ")
#     hist = {}

#     for word in words:
#         if word in hist:
#             hist[word] += 1
#         else:
#             hist[word] = 1
        
#     return hist
    
        

# print(word_coutner(text))

tab1 = [i for i in range(20)]
tab2 = [2*i for i in tab1]
print(tab1)
print(tab2)