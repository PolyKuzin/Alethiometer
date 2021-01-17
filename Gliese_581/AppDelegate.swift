//
//  AppDelegate.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import UserNotifications
import YandexMobileMetrica

var downloaded = false
var zodiacSign      = "" {
    didSet {
        if !downloaded {
            downLoadText()
        }
    }
}
var todayText       = ""
var tomorrowText    = ""
var weekText        = ""
var monthText       = ""

var currentMounth   = ("", 0)
var nextMounth      = ("", 0)
var afterNextMounth = ("", 0)
var monthsName      = [currentMounth.0, nextMounth.0, afterNextMounth.0]
var monthsDays      = [currentMounth.1, nextMounth.1, afterNextMounth.1]

var todayHeartAngle  = CGFloat(0)
var todayCareerAngle = CGFloat(0)
var todayFamilyAngle = CGFloat(0)
var todayHealthAngle = CGFloat(0)

var tomorrowHeartAngle  = CGFloat(0)
var tomorrowCareerAngle = CGFloat(0)
var tomorrowFamilyAngle = CGFloat(0)
var tomorrowHealthAngle = CGFloat(0)

var weekHeartAngle  = CGFloat(0)
var weekCareerAngle = CGFloat(0)
var weekFamilyAngle = CGFloat(0)
var weekHealthAngle = CGFloat(0)

var monthHeartAngle  = CGFloat(0)
var monthCareerAngle = CGFloat(0)
var monthFamilyAngle = CGFloat(0)
var monthHealthAngle = CGFloat(0)

var i = Int.random(in: 1...28)
var days1: ([Int], [Int], [Int]) = ([], [], [])
var days2: ([Int], [Int], [Int]) = ([], [], [])
var days3: ([Int], [Int], [Int]) = ([], [], [])
var days4: ([Int], [Int], [Int]) = ([], [], [])
var days5: ([Int], [Int], [Int]) = ([], [], [])
var days6: ([Int], [Int], [Int]) = ([], [], [])
var days7: ([Int], [Int], [Int]) = ([], [], [])
var days8: ([Int], [Int], [Int]) = ([], [], [])

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notifications = Notifications()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let monthInt = Calendar.current.component(.month, from: Date())
        for i in Months.allCases {
            if i.rawValue.0 == monthInt { currentMounth = (i.rawValue.1, i.rawValue.2) }
            if i.rawValue.0 == monthInt + 1 { nextMounth = (i.rawValue.1, i.rawValue.2) }
            if i.rawValue.0 == monthInt + 2 { afterNextMounth = (i.rawValue.1, i.rawValue.2) }
            if monthInt + 1 == 13 { nextMounth = (Months.January.rawValue.1, Months.January.rawValue.2) }
            if monthInt + 1 == 14 { nextMounth = (Months.February.rawValue.1, Months.February.rawValue.2) }
        }
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let currDate = formatter.string(from: date)
        if UserDefaults.standard.string(forKey: "Date") != currDate {
            
            tomorrowHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            tomorrowCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            tomorrowFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            tomorrowHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            
            if UserDefaults.standard.string(forKey: "Date") == nil {
                todayHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                todayCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                todayFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                todayHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                
                UserDefaults.standard.setValue(todayHeartAngle,  forKey: "todayHeartAngle")
                UserDefaults.standard.setValue(todayCareerAngle, forKey: "todayCareerAngle")
                UserDefaults.standard.setValue(todayFamilyAngle, forKey: "todayFamilyAngle")
                UserDefaults.standard.setValue(todayHealthAngle, forKey: "todayHealthAngle")
            } else {
                UserDefaults.standard.setValue(UserDefaults.standard.value(forKey: "tomorrowHeartAngle"),  forKey: "todayHeartAngle")
                UserDefaults.standard.setValue(UserDefaults.standard.value(forKey: "tomorrowCareerAngle"), forKey: "todayCareerAngle")
                UserDefaults.standard.setValue(UserDefaults.standard.value(forKey: "tomorrowFamilyAngle"), forKey: "todayFamilyAngle")
                UserDefaults.standard.setValue(UserDefaults.standard.value(forKey: "tomorrowHealthAngle"), forKey: "todayHealthAngle")
            }
            
            UserDefaults.standard.setValue(tomorrowHeartAngle,  forKey: "tomorrowHeartAngle")
            UserDefaults.standard.setValue(tomorrowCareerAngle, forKey: "tomorrowCareerAngle")
            UserDefaults.standard.setValue(tomorrowFamilyAngle, forKey: "tomorrowFamilyAngle")
            UserDefaults.standard.setValue(tomorrowHealthAngle, forKey: "tomorrowHealthAngle")

            UserDefaults.standard.setValue(currDate, forKey: "Date")
        }
        let calendar = NSCalendar.current
        let currWeek = calendar.component(.weekOfYear, from: Date())
        if UserDefaults.standard.value(forKey: "currWeek") != nil {
            if UserDefaults.standard.value(forKey: "currWeek") as! Int != currWeek {
                weekHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                weekCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                weekFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                weekHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                
                UserDefaults.standard.setValue(weekHeartAngle,  forKey: "weekHeartAngle")
                UserDefaults.standard.setValue(weekCareerAngle, forKey: "weekCareerAngle")
                UserDefaults.standard.setValue(weekFamilyAngle, forKey: "weekFamilyAngle")
                UserDefaults.standard.setValue(weekHealthAngle, forKey: "weekHealthAngle")
                
                UserDefaults.standard.setValue(currWeek, forKey: "currWeek")
            }
        } else {
            weekHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            weekCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            weekFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            weekHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            
            UserDefaults.standard.setValue(weekHeartAngle,  forKey: "weekHeartAngle")
            UserDefaults.standard.setValue(weekCareerAngle, forKey: "weekCareerAngle")
            UserDefaults.standard.setValue(weekFamilyAngle, forKey: "weekFamilyAngle")
            UserDefaults.standard.setValue(weekHealthAngle, forKey: "weekHealthAngle")
            
            UserDefaults.standard.setValue(currWeek, forKey: "currWeek")
        }

        let currMonth = calendar.component(.month, from: Date())
        if UserDefaults.standard.value(forKey: "currMonth") != nil {
            if UserDefaults.standard.value(forKey: "currMonth") as! Int != currMonth {
                monthHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                monthCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                monthFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                monthHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
                
                UserDefaults.standard.setValue(monthHeartAngle,  forKey: "monthHeartAngle")
                UserDefaults.standard.setValue(monthCareerAngle, forKey: "monthCareerAngle")
                UserDefaults.standard.setValue(monthFamilyAngle, forKey: "monthFamilyAngle")
                UserDefaults.standard.setValue(monthHealthAngle, forKey: "monthHealthAngle")
                
                days1.0 = days1.1
                days2.0 = days2.1
                days3.0 = days3.1
                days4.0 = days4.1
                days5.0 = days5.1
                days6.0 = days6.1
                days7.0 = days7.1
                days8.0 = days8.1
                
                days1.1 = days1.2
                days2.1 = days2.2
                days3.1 = days3.2
                days4.1 = days4.2
                days5.1 = days5.2
                days6.1 = days6.2
                days7.1 = days7.2
                days8.1 = days8.2
                
                days1.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days2.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days3.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days4.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days5.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days6.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days7.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                days8.2 = (1...afterNextMounth.1).randomElements(Int.random(in: 3...16))
                
                UserDefaults.standard.setValue(days1, forKey: "days1")
                UserDefaults.standard.setValue(days2, forKey: "days2")
                UserDefaults.standard.setValue(days3, forKey: "days3")
                UserDefaults.standard.setValue(days4, forKey: "days4")
                UserDefaults.standard.setValue(days5, forKey: "days5")
                UserDefaults.standard.setValue(days6, forKey: "days6")
                UserDefaults.standard.setValue(days7, forKey: "days7")
                UserDefaults.standard.setValue(days8, forKey: "days8")
                
                UserDefaults.standard.setValue(currMonth, forKey: "currMonth")
            }
        } else {
            monthHeartAngle  = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            monthCareerAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            monthFamilyAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            monthHealthAngle = CGFloat.random(in: (-.pi / 2)..<(3 * .pi / 2))
            
            UserDefaults.standard.setValue(monthHeartAngle,  forKey: "monthHeartAngle")
            UserDefaults.standard.setValue(monthCareerAngle, forKey: "monthCareerAngle")
            UserDefaults.standard.setValue(monthFamilyAngle, forKey: "monthFamilyAngle")
            UserDefaults.standard.setValue(monthHealthAngle, forKey: "monthHealthAngle")
            
            days1 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days2 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days3 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days4 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days5 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days6 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days7 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            days8 = ((1...currentMounth.1).randomElements(Int.random(in: 3...16)), (1...nextMounth.1).randomElements(Int.random(in: 3...16)), (1...afterNextMounth.1).randomElements(Int.random(in: 3...16)))
            
            UserDefaults.standard.setValue(days1.0, forKey: "days1.0")
            UserDefaults.standard.setValue(days1.1, forKey: "days1.1")
            UserDefaults.standard.setValue(days1.2, forKey: "days1.2")

            UserDefaults.standard.setValue(days2.0, forKey: "days2.0")
            UserDefaults.standard.setValue(days2.1, forKey: "days2.1")
            UserDefaults.standard.setValue(days2.2, forKey: "days2.2")

            UserDefaults.standard.setValue(days3.0, forKey: "days3.0")
            UserDefaults.standard.setValue(days3.1, forKey: "days3.1")
            UserDefaults.standard.setValue(days3.2, forKey: "days3.2")
            
            UserDefaults.standard.setValue(days4.0, forKey: "days4.0")
            UserDefaults.standard.setValue(days4.1, forKey: "days4.1")
            UserDefaults.standard.setValue(days4.2, forKey: "days4.2")
            
            UserDefaults.standard.setValue(days5.0, forKey: "days5.0")
            UserDefaults.standard.setValue(days5.1, forKey: "days5.1")
            UserDefaults.standard.setValue(days5.2, forKey: "days5.2")
            
            UserDefaults.standard.setValue(days6.0, forKey: "days6.0")
            UserDefaults.standard.setValue(days6.1, forKey: "days6.1")
            UserDefaults.standard.setValue(days6.2, forKey: "days6.2")
            
            UserDefaults.standard.setValue(days7.0, forKey: "days7.0")
            UserDefaults.standard.setValue(days7.1, forKey: "days7.1")
            UserDefaults.standard.setValue(days7.2, forKey: "days7.2")
            
            UserDefaults.standard.setValue(days8.0, forKey: "days8.0")
            UserDefaults.standard.setValue(days8.1, forKey: "days8.1")
            UserDefaults.standard.setValue(days8.2, forKey: "days8.2")
            
            UserDefaults.standard.setValue(currMonth, forKey: "currMonth")
        }
        
        notifications.notificationCenter.delegate = notifications
        UIApplication.shared.applicationIconBadgeNumber = 0
        IAPManager.shared.setupPurchases { (success) in
            if success {
                print(
                    """
                    ###########
                    ###########
                    ###########
                    CAN MAKE PURCHAISES
                    """)
                IAPManager.shared.getProducts()
            }
        }
        
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: "710ec4a5-8503-4371-a935-2825ec321888")
        YMMYandexMetrica.activate(with: configuration!)
        print(
            """
            ###########
            ###########
            ###########
            \(UIDevice.modelName)
            """)
        if UserDefaults.standard.bool(forKey: "Registered") {
            zodiacSign = getZodiacSign(UserDefaults.standard.value(forKey: "DateOfBirth") as! Date)
            print(
                """
                ###########
                ###########
                ###########
                \(zodiacSign)
                """)
        }
        
        let reciptValidator = ReceiptValidator()
        let result = reciptValidator.validateReceipt()
        switch result {
        case let .success(reciept):
            guard let purchase = reciept.inAppPurchaseReceipts?.filter({$0.productIdentifier == IAPProducts.autoRenew.rawValue}).first else { return true }
            if purchase.subscriptionExpirationDate?.compare(Date()) == .some(.orderedDescending) {
                AnalyticsService.reportEvent(with: "Purchase", parameters: ["data" : purchase.purchaseDate ?? "0000000"])
                UserDefaults.standard.setValue(true, forKey: "setProVersion")
            } else {
                UserDefaults.standard.setValue(true, forKey: "setProVersion")
            }
        case let .error(error):
            print(error.localizedDescription)
        }
        UserDefaults.standard.setValue(0, forKey: "currentState")
        UserDefaults.standard.setValue(true, forKey: "setProVersion")
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))
        print(UserDefaults.standard.bool(forKey: "setProVersion"))

        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { (data) -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func convert(html toString: String) -> NSMutableAttributedString {
        let htmlText = toString.htmlToAttributedString
        let mutableStr = NSMutableAttributedString(attributedString: htmlText!)
        mutableStr.setFontFace(font: UIFont.displayMedium20, color: .text)
        return mutableStr
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

public func downLoadText() {
    let todayURLString = "https://www.astrology.com/horoscope/daily/\(zodiacSign.lowercased()).html"
    guard let todayURL = URL(string: todayURLString) else {
        print("Error: \(todayURLString) doesn't seem to be a valid URL")
        return
    }
    do {
        let HTMLString = try String(contentsOf: todayURL, encoding: .ascii)
        if let tT = HTMLString.slice(from: "<span class=\"date\">", to: "</p>") {
            if let range = tT.range(of: "</span> ") {
                let text = tT[range.upperBound...]
                todayText = String(text)
            }
            print("#######################")
            print("HTML : \(todayText)")
            print("#######################")
        }
    } catch let error {
        print("Error: \(error)")
    }
    if UserDefaults.standard.bool(forKey: "setProVersion") {
        let tomorrowURLString = "https://www.astrology.com/horoscope/daily/tomorrow/\(zodiacSign.lowercased()).html"
        guard let tommorowURL = URL(string: tomorrowURLString) else {
            print("Error: \(tomorrowURLString) doesn't seem to be a valid URL")
            return
        }
        do {
            let HTMLString = try String(contentsOf: tommorowURL, encoding: .ascii)
            if let tT = HTMLString.slice(from: "<span class=\"date\">", to: "</p>") {
                if let range = tT.range(of: "</span> ") {
                    let text = tT[range.upperBound...]
                    tomorrowText = String(text)
                }
                print("#######################")
                print("HTML : \(tomorrowText)")
                print("#######################")
            }
        } catch let error {
            print("Error: \(error)")
        }
        let weekURLString = "https://www.astrology.com/horoscope/weekly-overview/\(zodiacSign.lowercased()).html"
        guard let weekURL = URL(string: weekURLString) else {
            print("Error: \(weekURLString) doesn't seem to be a valid URL")
            return
        }
        do {
            let HTMLString = try String(contentsOf: weekURL, encoding: .ascii)
            if let tT = HTMLString.slice(from: "<span class=\"date\">", to: "</p>") {
                if let range = tT.range(of: "</span> ") {
                    let text = tT[range.upperBound...]
                    weekText = String(text)
                }
                print("#######################")
                print("HTML : \(weekText)")
                print("#######################")
            }
        } catch let error {
            print("Error: \(error)")
        }
        let monthURLString = "https://www.astrology.com/horoscope/monthly-overview/\(zodiacSign.lowercased()).html"
        guard let monthURL = URL(string: monthURLString) else {
            print("Error: \(monthURLString) doesn't seem to be a valid URL")
            return
        }
        do {
            let HTMLString = try String(contentsOf: monthURL, encoding: .ascii)
            if let tT = HTMLString.slice(from: "<span class=\"date\">", to: "</p>") {
                if let range = tT.range(of: "</span> ") {
                    let text = tT[range.upperBound...]
                    monthText = String(text)
                    monthText = monthText.replacingOccurrences(of: "<br>", with: "")
                    monthText = monthText.replacingOccurrences(of: "â", with: "'")
                }
                print("#######################")
                print("HTML : \(monthText)")
                print("#######################")
            }
        } catch let error {
            print("Error: \(error)")
        }
    }
    downloaded = true
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
