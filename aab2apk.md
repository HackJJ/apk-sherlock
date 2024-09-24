
# Convert AAB to APK

This guide will show you how to convert an **Android App Bundle (AAB)** file into an **APK** using [Bundletool](https://developer.android.com/studio/command-line/bundletool). Follow these simple steps to generate a universal APK.

## Prerequisites
- **Java**: Ensure you have [Java](https://www.java.com/en/download/) installed on your machine.
- **Bundletool**: Download the latest version of [Bundletool](https://github.com/google/bundletool/releases).

## Steps

### 1. **Install Java**:
   Make sure that Java is installed. You can check this by running:
   ```bash
   java -version
   ```
   If Java is not installed, download and install it from [here](https://www.java.com/en/download/).

### 2. **Download Bundletool**:
   Download the latest version of Bundletool from the [GitHub Releases page](https://github.com/google/bundletool/releases).

### 3. **Build the APK from AAB**:
   Run the following command to build the APK from the AAB file using Bundletool:
   ```bash
   bundletool build-apks --bundle=/path/to/your_app.aab --output=/path/to/output.apks --mode=universal
   ```

   If you need a **signed APK**, add your keystore information to the command:
   ```bash
   bundletool build-apks --bundle=/path/to/your_app.aab --output=/path/to/output.apks --mode=universal --ks=/path/to/keystore.jks --ks-key-alias=my-key-alias --ks-pass=pass:my-password
   ```

### 4. **Change .apks to .zip**:
   The command above will generate a `.apks` file. Rename this file to `.zip` so you can extract it:
   ```bash
   mv /path/to/output.apks /path/to/output.zip
   ```

### 5. **Unzip and Extract the APK**:
   Once renamed, unzip the file and look for the `universal.apk` file. This is your APK.
   ```bash
   unzip /path/to/output.zip -d /path/to/extracted-folder
   ```

   The `universal.apk` file will be in the extracted folder.

### Conclusion
Now you have successfully converted your AAB file into a universal APK using Bundletool. You can now install this APK on your Android device or share it as needed.
