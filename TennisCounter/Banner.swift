//
//  Banner.swift
//  TennisCounter
//
//  Created by AppleBoy on 2022/04/28.
//

import SwiftUI
import GoogleMobileAds
import UIKit

import AppTrackingTransparency
import AdSupport

final private class BannerVC: UIViewControllerRepresentable  {

    let kGADAdSizeBanner = GADAdSizeFromCGSize(CGSize(width: 320, height: 100))
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
//        view.adUnitID = "ca-app-pub-2051058860164579/8481549070"
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "2204b6921f7229b7943e06afc8db032e" ]
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
          // Tracking authorization completed. Start loading ads here.
            view.load(GADRequest())
        })
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct Banner:View{
    var body: some View{
        HStack{
            Spacer()
            BannerVC().frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}
