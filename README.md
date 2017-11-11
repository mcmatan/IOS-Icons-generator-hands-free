# iOS icon generator

Generate all the app icons needed with a single command.

## Usage

Run from project root

```
./ios-icon-generator [IMAGE] [IconsName with no spaces!] [projectName]
```

The source image should ideally be 1024.


The script will create an `AppIcon.{Your icon name}.appiconset/` directory with all the necessary files and metadata needed by Xcode. (Inside your assets folder!)

Filenames and sizes come from [Apple's documentation](https://developer.apple.com/library/ios/qa/qa1686/_index.html).

```
├── AppIcon.appiconset
    ├── Contents.json
    ├── Icon-60@2x.png
    ├── Icon-60@3x.png
    ├── Icon-76.png
    ├── Icon-76@2x.png
    ├── Icon-Small-40.png
    ├── Icon-Small-40@2x.png
    ├── Icon-Small-40@3x.png
    ├── Icon-Small.png
    ├── Icon-Small@2x.png
    └── Icon-Small@3x.png
```
