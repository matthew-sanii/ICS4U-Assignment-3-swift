/*
* The hourglass program.
*
* @author Matthew Sanii
* @version 1.0
* @since 2021-12-11
*/

public class HourGlass {

  private let star: String = "*"

  private let space: String = " "

  private var amount = 0

  private var layer = 0

  private var times = 0

  func glassTop(max: Int, current: Int) -> String {
    var result = ""
    amount = 0
    layer = 0
    times = 0
    if current != 0 {
      result += "\n"
    }
    if (current + 1) == max {
      while times < current {
        result += space
        times += 1
      }
      result += star
    } else {
      let row = max - current
      while amount < current {
        result += space
        amount += 1
      }
      while layer < row {
        result += star
        result += space
        layer += 1
      }
      result += glassTop(max: max, current: current + 1)
    }
    return result
  }

  func glassBottom(min: Int, current: Int, value: Int) -> String {
    var results = ""
    amount = value
    layer = value
    times = value
    let curent = current - 1
    let row = value - curent
    if current != value {
      results += "\n"
    }
    if current == min {
      while times > curent {
        times -= 1
        results += space
      }
    } else {
      while amount > row {
        results += space
        amount -= 1
      }
      while layer > curent {
        results += star
        results += space
        layer -= 1
      }
      results += glassBottom(min: min, current: curent, value: value)
    }
    return results
  }
}

print("Input size of hourglass: ")
let info = readLine()!
do {
  let input = Int(info) ?? 0
  if input <= 0 {
    print("Input was not valid, must be a positive integer.")
  } else {
    let upper = HourGlass()
    let lower = HourGlass()
    print(upper.glassTop(max: input, current: 0))
    print(lower.glassBottom(min: 0, current: input, value: input))
  }
}
print("\nDone.")
