#{

let validateLine(line, dampening : true) = {
    let prev = none
    let sign = 0
    let safe = true
    let signSet = false
    let errorIndex = 0
    for value in line{
        let delta = 0
        if not value.match(regex("^\d+$")) == none{
            let ivalue = int(value)
            if prev != none {
                delta = prev - ivalue
                if not signSet {
                    sign = delta.signum()
                    signSet = true
                }
                if delta * sign <= 0 or delta * sign > 3{
                    safe = false
                    if dampening {
                        line.remove(errorIndex)
                        safe = validateLine(line, dampening: false)
                    }
                }
            }
            errorIndex += 1
            prev = ivalue
        }
    }
    return safe
}

let input = read("input")
let table = input.split("\n")

let sum = 0
for line in table{
    if validateLine(line.split()){
        sum += 1
        //line + "\n"
    }
}

"Nombre de rapport valide :"
str(sum)


}