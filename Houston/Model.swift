//
//  Model.swift
//  Houston
//
//  Created by Sravani Nagunuri on 9/1/23.
//

import Foundation

struct CardHub {
    var imageName: String = ""
    var cardName: String = ""
    var cardDescription : [String] = [""]
}

extension CardHub {
    public func getAll() -> [CardHub] {
        return [
            CardHub(imageName: "globe", cardName: "UIAlertController", cardDescription: ["✩ configure alerts and action sheets \n ✩ intended to be used as-is \n ✩ does not support subclassing \n ✩ support text fields to the alert interface"]),
            CardHub(
                imageName: "gearshape",
                cardName: "UIKit",
                cardDescription: ["✩ provides required iOS infrastructures \n ✩ window and view architecture \n ✩ event handling for multi-touch and etc \n ✩ manages interaction with system \n ✩ a lot of features incl.resource mgmnt"]),
            CardHub(imageName: "globe", cardName: "View Controller", cardDescription: ["✩ defines the behaviour for common VCs \n ✩ updates the content of the view \n ✩ responding to user interactions \n ✩ resizing views and layout mgmnt \n ✩ coordingating with other objects"])]
    }
}
