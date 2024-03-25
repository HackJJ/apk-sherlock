
# APK-Sherlock

Welcome to **APK-Sherlock**! 🔍📱 

This nifty tool is your personal detective for investigating Android APK files. With APK-Sherlock, you can decompile APKs using `apktool`, inspect the Java source code with `jadx`, and even peek inside the APK files with `unzip`. 

## Features

- Decompile APKs to view their contents and structure.
- Convert DEX files to Java source code.
- Extract all the resources and manifest from an APK.

## Getting Started

### Prerequisites

- Docker
- APK file for analysis

### Setup

1. **Build the Docker Image**

   Run the following command to build the APK-Sherlock Docker image:

   ```bash
   docker build -t apktool-jadx-image .
   ```

2. **Run APK-Sherlock**

   To analyze an APK file, use the command:

   ```bash
   docker run -it --rm -e APK_FILE=/data/your_apk_file.apk -v /path/to/your/apk/files:/data -v /host/output/path:/workspace apktool-jadx-image
   ```

   Replace `/path/to/your/apk/files` with the directory containing your APK file, and `/host/output/path` with the directory where you want to store the output.

### Example

Analyze `example.apk` and save output to `/Users/johnDoe/APK_Analysis`:

```bash
docker run -it --rm -e APK_FILE=/data/example.apk -v /Users/johnDoe/Downloads:/data -v /Users/johnDoe/APK_Analysis:/workspace apktool-jadx-image
```

After running the command, you'll find the decompiled APK, Java source code, and unzipped contents in `/Users/johnDoe/APK_Analysis/chcmob`.

## Output Structure

- `/workspace/chcmob/decompiled`: Decompiled resources and smali files from the APK.
- `/workspace/chcmob/java-code`: Java source code obtained from DEX files.
- `/workspace/chcmob/unzipped`: All files extracted directly from the APK.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Acknowledgments

- [iBotPeaches](https://github.com/iBotPeaches) for Apktool
- [Skylot](https://github.com/skylot) for jadx
