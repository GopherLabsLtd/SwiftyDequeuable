#
#  Be sure to run `pod spec lint SwiftyDequeuable.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SwiftyDequeuable"
  s.version      = "1.0.1"
  s.summary      = "A more simpler way to Dequeue Cells in Swift"

  s.description  = "SwiftyDequeuable uses Generics and Protocol Oriented Programming to simplify reusing cells."

  s.homepage     = "https://github.com/itsAlexNguyen/SwiftyDequeuable"

  s.license      = { :type => "MIT", :file => "License.md" }

  s.author             = { "Alex Nguyen" => "hello@gopher.it" }
  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/GopherLabsLtd/SwiftyDequeuable.git", :tag => "#{s.version}" }

  s.source_files  = "Source/"
  s.exclude_files = "Source/Exclude"

end
