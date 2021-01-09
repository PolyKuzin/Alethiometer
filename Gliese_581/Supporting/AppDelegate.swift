//
//  AppDelegate.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import YandexMobileMetrica

var zodiacSign      = ""

var currentMounth   = ("", 0)
var nextMounth      = ("", 0)
var afterNextMounth = ("", 0)
var monthsName      = [currentMounth.0, nextMounth.0, afterNextMounth.0]
var monthsDays      = [currentMounth.1, nextMounth.1, afterNextMounth.1]

var heartAngle  = CGFloat(0)
var careerAngle = CGFloat(0)
var familyAngle = CGFloat(0)
var healthAngle = CGFloat(0)

var days1: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days2: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days3: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days4: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days5: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days6: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days7: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))
var days8: ([Int], [Int], [Int]) = ((1...currentMounth.1).randomElements(8), (1...nextMounth.1).randomElements(8), (1...afterNextMounth.1).randomElements(8))

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: "710ec4a5-8503-4371-a935-2825ec321888")
        YMMYandexMetrica.activate(with: configuration!)
        
        print(
            """
            ###########
            ###########
            ###########
            \(UIDevice.modelName)
            ###########
            ###########
            ###########
            """)
        
        if UserDefaults.standard.bool(forKey: "Registered") {
            zodiacSign = getZodiacSign(UserDefaults.standard.value(forKey: "DateOfBirth") as! Date)
            print(
                """
                ###########
                ###########
                ###########
                \(zodiacSign)
                ###########
                ###########
                ###########
                """)
        }
        let monthInt = Calendar.current.component(.month, from: Date())
        for i in Months.allCases {
            if i.rawValue.0 == monthInt { currentMounth = (i.rawValue.1, i.rawValue.2) }
            if i.rawValue.0 == monthInt + 1 { nextMounth = (i.rawValue.1, i.rawValue.2) }
            if i.rawValue.0 == monthInt + 2 { afterNextMounth = (i.rawValue.1, i.rawValue.2) }
            if monthInt + 1 == 13 { nextMounth = (Months.January.rawValue.1, Months.January.rawValue.2) }
            if monthInt + 1 == 14 { nextMounth = (Months.February.rawValue.1, Months.February.rawValue.2) }
        }
        heartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
        careerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
        familyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
        healthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))

//        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func getZodiacSign(_ date : Date) -> String{
        let calendar = Calendar.current
        let d = calendar.component(.day, from: date)
        let m = calendar.component(.month, from: date)
        switch (d,m) {
        case (21...31,1),(1...19,2):
            return "Aquarius"
        case (20...29,2),(1...20,3):
            return "Pisces"
        case (21...31,3),(1...20,4):
            return "Aries"
        case (21...30,4),(1...21,5):
            return "Taurus"
        case (22...31,5),(1...21,6):
            return "Gemini"
        case (22...30,6),(1...22,7):
            return "Cancer"
        case (23...31,7),(1...22,8):
            return "Leo"
        case (23...31,8),(1...23,9):
            return "Virgo"
        case (24...30,9),(1...23,10):
            return "Libra"
        case (24...31,10),(1...22,11):
            return "Scorpio"
        case (23...30,11),(1...21,12):
            return "Sagittarius"
        default:
            return "Capricorn"
        }
    }
}

public enum Months : CaseIterable {
    
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December

    
    var rawValue: (Int, String, Int) {
        switch self {
        case .January:   return (1, "January",   31)
        case .February:  return (2, "February",  28)
        case .March:     return (3, "March",     31)
        case .April:     return (4, "April",     30)
        case .May:       return (5, "May",       31)
        case .June:      return (6, "June",      30)
        case .July:      return (7, "July",      31)
        case .August:    return (8, "August",    31)
        case .September: return (9, "September", 30)
        case .October:   return (10, "October",  31)
        case .November:  return (11, "November", 30)
        case .December:  return (12, "December", 31)
        }
    }
}

extension RangeExpression where Bound: FixedWidthInteger {
    func randomElements(_ n: Int) -> [Bound] {
        precondition(n > 0)
        switch self {
        case let range as Range<Bound>: return (0..<n).map { _ in .random(in: range) }
        case let range as ClosedRange<Bound>: return (0..<n).map { _ in .random(in: range) }
        default: return []
        }
    }
}
