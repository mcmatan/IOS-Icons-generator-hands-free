# iOS icon generator

Generate all the app icons needed with a single command.

## Usage

Run from project root

```
./ios-icon-generator [IMAGE] [IconsName with no spaces!] [projectName]
```

The source image should be exactly 1024.


The script will create an `AppIcon.{Your icon name}.appiconset/` directory with all the necessary files and metadata needed by Xcode. (Inside your assets folder!)

Filenames and sizes come from [Apple's documentation](https://developer.apple.com/library/ios/qa/qa1686/_index.html).

```
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
```
