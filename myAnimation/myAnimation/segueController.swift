//
//  segueController.swift
//  myAnimation
//
//  Created by Abylbek Khassenov on 11/19/20.
//

import UIKit

class segueController: UIStoryboardSegue {
    
    override func perform() {
        let destination_view = self.destination.view
        let source_view = self.source.view
        UIView.animate(withDuration: 1, animations: {source_view?.alpha = 0})
            {(Bool ) in destination_view?.alpha = 0
            self.source.present(self.destination, animated: false){
                UIView.animate(withDuration: 1){
                    destination_view?.alpha = 1
                }
            }
        }
    }
}
