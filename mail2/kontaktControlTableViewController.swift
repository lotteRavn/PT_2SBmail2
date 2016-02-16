//
//  kontaktControlTableViewController.swift
//  mail2
//
//  Created by Lotte Ravn on 15/02/16.
//  Copyright © 2016 Lotte Ravn. All rights reserved.
//

import UIKit
import MessageUI

class kontaktControlTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected row = \(indexPath.description)")
        
        if indexPath.section == 0 && indexPath.row == 0 {
        
        print("Rate us Tapped")
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            print("Kontakt tapped")
            
            let mailComposeViewController = configureMailComposeViewController()
            
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }else{
            self.showSendMailAlert()
            }
            

        }

        
    }
    func configureMailComposeViewController() ->MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["lotteravn@live.dk"])
        mailComposerVC.setSubject("Kontakt Bournonvilles")
        mailComposerVC.setMessageBody("Howdy Bournonville's!\n\nJeg kontakter jer fordi...\n", isHTML: false)
        
        return mailComposerVC
    }
    func showSendMailAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Kunne desværre ikke sende mailen", message: "Tjek opsætning på din telefon", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Send", style: .Default, handler: nil)
       sendMailErrorAlert.addAction(defaultAction)
        
        presentViewController(sendMailErrorAlert, animated: true, completion: nil)
        
        
            }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        
        case MFMailComposeResultCancelled.rawValue:
            print("mail annulleret")
        case MFMailComposeResultSent.rawValue:
            print("mail sendt")
        default:
            break
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
