#!/bin/bash
# Oh shit. Using bash

echo ""
echo "Building..."

echo ""
echo "Checking for Cocoapods"
echo ""
if [[ -z `gem list | grep cocoapods` ]]; then
  gem install cocoapods
else
  echo "Cocoapods already installed"
fi

echo ""
echo "Checking for xcpretty"
echo ""
if [[ -z `gem list | grep xcpretty` ]]; then
  gem install xcpretty
fi

echo "Making sure pods are up to date"
if [[ ! -d Pods/ ]]; then
  pod install
else
  pod update
fi

xcodebuild -workspace Market\ Madness.xcworkspace -scheme Market\ Madness -sdk iphonesimulator clean analyze build test | xcpretty -c
