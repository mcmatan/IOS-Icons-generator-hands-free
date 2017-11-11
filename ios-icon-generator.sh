#!/usr/bin/env bash

# reference:
# https://developer.apple.com/library/ios/qa/qa1686/_index.html

function create_appiconset {
  targetDestination="$1"
  if [[ -e "$targetDestination" ]]; then
    echo "$targetDestination already exists"
    exit 1
  else
    mkdir "$targetDestination"
  fi
}


function create_contents_json {
  targetDestination="$1"
  cat <<EOT >> "$targetDestination/Contents.json"
{
  "images" : [
   {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-App-20x20@1x.png",
      "scale" : "1x"
    },
    {
      "idiom" : "ipad",
      "size" : "20x20",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "iphone",
      "size" : "29x29",
      "filename" : "Icon-Small@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "iphone",
      "size" : "29x29",
      "filename" : "Icon-Small@3x.png",
      "scale" : "3x"
    },
    {
      "idiom" : "iphone",
      "size" : "40x40",
      "filename" : "Icon-Small-40@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "iphone",
      "size" : "40x40",
      "filename" : "Icon-Small-40@3x.png",
      "scale" : "3x"
    },
    {
      "idiom" : "iphone",
      "size" : "60x60",
      "filename" : "Icon-60@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "iphone",
      "size" : "60x60",
      "filename" : "Icon-60@3x.png",
      "scale" : "3x"
    },
    {
      "idiom" : "ipad",
      "size" : "29x29",
      "filename" : "Icon-Small.png",
      "scale" : "1x"
    },
    {
      "idiom" : "ipad",
      "size" : "29x29",
      "filename" : "Icon-Small@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "ipad",
      "size" : "40x40",
      "filename" : "Icon-Small-40.png",
      "scale" : "1x"
    },
    {
      "idiom" : "ipad",
      "size" : "40x40",
      "filename" : "Icon-Small-40@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "ipad",
      "size" : "76x76",
      "filename" : "Icon-76.png",
      "scale" : "1x"
    },
    {
      "idiom" : "ipad",
      "size" : "76x76",
      "filename" : "Icon-76@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "ipad",
      "size" : "83.5x83.5",
      "filename" : "Icon-83.5@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "ios-marketing",
      "size" : "1024x1024",
      "filename" : "iTunesArtwork.png",
      "scale" : "1x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOT
}


function create_icons {
  targetDestination="$2"
  image="$1"

  # Settings
  create_icon "$image" "20"  "Icon-App-20x20@1x" "$targetDestination"
  create_icon "$image" "20"  "Icon-App-20x20@2x" "$targetDestination"
  create_icon "$image" "20"  "Icon-App-20x20@2x" "$targetDestination"
  create_icon "$image" "20"  "Icon-App-20x20@3x" "$targetDestination"
  create_icon "$image" "29"  "Icon-Small" "$targetDestination"
  create_icon "$image" "58"  "Icon-Small@2x" "$targetDestination"
  create_icon "$image" "87"  "Icon-Small@3x" "$targetDestination"

  # Spotlight
  create_icon "$image" "40"  "Icon-Small-40" "$targetDestination"
  create_icon "$image" "80"  "Icon-Small-40@2x" "$targetDestination"
  create_icon "$image" "120" "Icon-Small-40@3x" "$targetDestination"

  # Home screen (iPhone)
  create_icon "$image" "120" "Icon-60@2x" "$targetDestination"
  create_icon "$image" "180" "Icon-60@3x" "$targetDestination"

  # Home screen (iPad)
  create_icon "$image" "76"  "Icon-76" "$targetDestination"
  create_icon "$image" "152" "Icon-76@2x" "$targetDestination"
  create_icon "$image" "167" "Icon-83.5@2x" "$targetDestination"

  #AppStore
  create_icon "$image" "1024" "iTunesArtwork" "$targetDestination"

}


function create_icon {

  image="$1"
  size="$2"
  name="$3"
  targetDestination="$4"

  sips -s format png -z "$size" "$size" "$image" --out "$targetDestination/${name}.png"
}


function optimize_icons {
  targetDestination="$1"
  if hash imageoptim 2>/dev/null; then
    imageoptim --directory "$targetDestination"
  else
    echo
    echo "imageoptim-cli is not installed. Icons won't be optimized."
    echo "To install, run:"
    echo "  $ npm install -g imageoptim-cli"
  fi
}


function currentDestination {
  pwd
}



function run {
  set -e
  if [ "$#" -lt 3 ] 
    then
    echo "usage: ./ios-icon-generator [IMAGE] [IconsName with no spaces!] [projectName]"
  else
    image="$1"
    iconName="$2"
    projectName="$3"
    targetDestination="${projectName}/Assets.xcassets/AppIcon.${iconName}.appiconset"


    echo "Generating icons!"
    echo "."
    echo "."
    echo "."
    echo "From image: ${image}"
    echo "Icon name: ${iconName}"
    echo "Xcode path: ${projectName}"
    echo "TargetDestination: ${targetDestination}"
    echo "."
    echo "."
    echo "."

  
  create_appiconset "$targetDestination"
  create_contents_json "$targetDestination"
  create_icons "$image" "$targetDestination"
  #optimize_icons "$targetDestination"
  fi
}

(run $@)
