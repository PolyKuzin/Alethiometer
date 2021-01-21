//
//  BaseViewController.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import StoreKit
import MessageUI
import SafariServices
import FloatingPanel

struct MailMessage {
    let to   : String
    let title: String
    let body : String
}

class BaseVC : UIViewController, MFMailComposeViewControllerDelegate {
    
    public func openMailController(_ message: MailMessage) {

        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([message.to])
            mail.setSubject(message.title)
            mail.setMessageBody(message.body, isHTML: false)
            
            present(mail, animated: true)
            
            // Show third party email composer if default Mail app is not present
        } else if let emailUrl = createEmailUrl(to: message.to, subject: message.title, body: message.body) {
            UIApplication.shared.open(emailUrl)
        }
    }
    
    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

        let gmailUrl   = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail  = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl   = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        return defaultUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        view.backgroundColor = UIColor.background
        self.navigationController?.navigationBar.isHidden = true
    }
    
    public func openWeb(link: String) {
        if let sc = BaseVC.safariController(link) { present(sc, animated: true, completion: nil) }
    }
    
    class func safariController(_ link: String) -> SFSafariViewController? {
        guard let url = URL(string: link) else { return nil }
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .background
        safariVC.preferredControlTintColor = .main
        return safariVC
    }
}

extension BaseVC : FloatingPanelControllerDelegate { }
