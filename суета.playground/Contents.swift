import GameplayKit

enum Sign: Int{
    case rock
    case paper
    case scissors
    
    func Describe() -> String{
        switch self{
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
}
let random = GKRandomDistribution (lowestValue: 0, highestValue: 2)

enum GameState: Int{
    case Start
    case Win
    case Loss
    case Draw
    
    func Describe() -> String{
        switch self {
        case .Start:
            return "The Game is Started"
        case .Win:
            return "you won"
        case .Loss:
            return "you lost"
        case .Draw:
            return "Draw"
        }
    }
    
}

func calculateState(playerTurn:Sign, computerTurn:Sign) -> String{
    switch playerTurn{
    case .rock:
        switch computerTurn{
        case .rock:
            return GameState(rawValue: 3)!.Describe()
        case .paper:
            return GameState(rawValue: 2)!.Describe()
        case .scissors:
            return GameState(rawValue: 1)!.Describe()
        }
    case .paper:
        switch computerTurn{
        case .rock:
            return GameState(rawValue: 1)!.Describe()
        case .paper:
            return GameState(rawValue: 3)!.Describe()
        case .scissors:
            return GameState(rawValue: 2)!.Describe()
        }
    case .scissors:
        switch computerTurn{
        case .rock:
            return GameState(rawValue: 2)!.Describe()
        case .paper:
            return GameState(rawValue: 1)!.Describe()
        case .scissors:
            return GameState(rawValue: 3)!.Describe()
        }
    }
}

for _ in 0...5{
    let a = 1
    let b = calculateState(playerTurn: Sign(rawValue: a)!, computerTurn: Sign(rawValue: random.nextInt())!)
    print(b)
}

for _ in 0...10{
    print("nigger")
}
