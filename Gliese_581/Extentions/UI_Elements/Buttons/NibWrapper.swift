//
//  NibWrapper.swift
//  Gliese_581
//
//  Created by Павел Кузин on 25.12.2020.
//

import UIKit

extension UIView {
    // MARK: - Load From Nib
    /**
     Load the view from a nib file called with the name of the class;
      - note: The first object of the nib file **must** be of the matching class
      - parameters:
        - none
     */
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

/// Property wrapper used to wrapp a view instanciated from a Nib
@propertyWrapper @dynamicMemberLookup public struct NibWrapped<T: UIView> {
    
    /// Initializer
    ///
    /// - Parameter type: Type of the wrapped view
    public init(_ type: T.Type) { }
    
    /// The wrapped value
    public var wrappedValue: UIView!
    
    /// The final view
    public var unwrapped: T { (wrappedValue as! NibWrapperView<T>).contentView }
    
    /// Dynamic member lookup to transfer keypath to the final view
    public subscript<U>(dynamicMember keyPath: KeyPath<T,U>) -> U { unwrapped[keyPath: keyPath] }

    /// Dynamic member lookup to transfer writable keypath to the final view
    public subscript<U>(dynamicMember keyPath: WritableKeyPath<T,U>) -> U {
        get { unwrapped[keyPath: keyPath] }
        set {
            var unwrappedView = unwrapped
            unwrappedView[keyPath: keyPath] = newValue
        }
    }
}

/// Class used to wrap a view automatically loaded form a nib file
class NibWrapperView<T: UIView>: UIView {
    /// The view loaded from the nib
    var contentView: T

    required init?(coder: NSCoder) {
        contentView = T.loadFromNib()
        super.init(coder: coder)
        prepareContentView()
    }
    
    override init(frame: CGRect) {
        contentView = T.loadFromNib()
        super.init(frame: frame)
        prepareContentView()
    }
    
    private func prepareContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)

        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        contentView.prepareForInterfaceBuilder()
    }
}
