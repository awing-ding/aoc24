#{
let input = csv(delimiter: ";", "input.csv")
let list1 = ()
let list2 = ()

for row in input {
    let (x,y) = row
    list1.push(int(x))
    list2.push(int(y))
}

let sorted1 = list1.sorted()
let sorted2 = list2.sorted()

let difference = 0

for (x,y) in sorted1.zip(sorted2){
    difference += (x - y).signum() * (x - y)
}

let similarity = 0
for value in list1 {
    let index = 0
    let appear = 0
    while value in list2.slice(index,list2.len()){
        if value == list2.at(index){
            appear += 1
        }
        index+=1
    }
    similarity += value * appear
}

[Valeur de différence :]
str(difference)
"\n"
[Valeur de similarité :]
str(similarity)
}
