#{

let input = read("input")
let table = input.split("\n")

let sum = 0
for line in table{
    let prev = none
    let sign = 0
    let safe = true
    let splitted = line.split()
    let signSet = false
    for value in splitted{
        let delta = 0
        
        if not value.match(regex("\d+")) == none{
            let ivalue = int(value)
            if prev != none {
                delta = prev - ivalue
                if not signSet {
                    sign = delta.signum()
                    signSet = true
                }
                if delta * sign <= 0 or delta > 3 or delta < -3{
                    safe = false
                }
            }
            prev = ivalue
        } else {
            [fail to convert]
        }

    }
    if safe {
        sum += 1
        //line + "\n"
    }
}

str(sum)

}