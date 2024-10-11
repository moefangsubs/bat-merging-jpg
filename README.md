# Batch Image Merger (JPG)

This batch script allows you to merge a set of `.jpg` images in numerical order (e.g., 001.jpg, 002.jpg, etc.) into a single image. It merges every 50 images vertically (from top to bottom) and produces a new merged file named `x1.jpg`, `x2.jpg`, and so on.

## Features

- Merges `.jpg` images in numerical order.
- Merges up to 50 images at a time vertically.
- Automatically removes the merged images (optional).
- Uses ImageMagick for image processing.

## Prerequisites

### 1. **ImageMagick**
- You need to have ImageMagick installed on your system for the batch script to work. It is a powerful image manipulation tool.
- [Download ImageMagick here](https://imagemagick.org/script/download.php).

### 2. **Windows OS**
- This script is designed to work on Windows-based systems using batch commands (`.bat`).

## Installation

1. **Download and Install ImageMagick**
   - Visit the official [ImageMagick download page](https://imagemagick.org/script/download.php).
   - Download and install the version suitable for your operating system.
   - During installation, make sure the option "Add application directory to your system path" is checked. This will allow you to use ImageMagick commands directly from the command line.

2. **Download the Batch Script**
   - Download or create the batch script (`MERGEnew.bat`) and place it in the directory containing your `.jpg` images.
   - Ensure that your `.jpg` images are named numerically (e.g., 001.jpg, 002.jpg, 003.jpg, etc.).

## Usage

### Step 1: Place Your Images in the Same Directory
- Ensure that your `.jpg` images are in the same folder as the `MERGEnew.bat` file.
- The script assumes the images are named numerically (e.g., `001.jpg`, `002.jpg`, `003.jpg`, etc.).

### Step 2: Run the Batch Script
1. Double-click the `MERGEnew.bat` file to start the merging process.
2. The script will automatically:
   - Merge every 50 `.jpg` images into a single file.
   - Name the merged result as `x1.jpg`, `x2.jpg`, etc.
   - Delete the original images (optional, can be modified in the script).

### Step 3: Check the Results
- Once the process is complete, check the output files (`x1.jpg`, `x2.jpg`, etc.) in the same directory. These are the merged images.

### Step 4 (Optional): Adjust Maximum Images per Merge
- If you want to change the number of images that are merged in a single batch (default is 50), edit the line `set max_images=50` in the batch file and change `50` to the desired number.

## Advanced Options

- **Modify Image Count**: You can change the number of images merged per batch by modifying the `max_images` variable in the script.
- **Merge Order**: The script sorts images numerically to ensure the proper merge sequence. If your image names are not sequential (e.g., 001.jpg, 002.jpg, etc.), rename them appropriately.

## Troubleshooting

- **ImageMagick Error**: Ensure that ImageMagick is properly installed and that its path is added to the system environment variables.
- **Image Naming**: Ensure the images are named properly in numerical order, or the script may not process them correctly.
- **Batch Script Not Running**: Ensure you have proper permissions to run the script and that the script and images are in the same directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Example Usage Tutorial

### Scenario: Merging 100 Images into 2 Merged Files

Let’s say you have 100 images named from `001.jpg` to `100.jpg`, and you want to merge them into 2 files (`x1.jpg` and `x2.jpg`), where each file contains 50 vertically stacked images.

1. **Step 1: Prepare the Images**
   - Place all 100 images in a folder.
   - Make sure the images are named in a numeric sequence (e.g., `001.jpg`, `002.jpg`, ..., `100.jpg`).

2. **Step 2: Place the Batch Script**
   - Place the `MERGEnew.bat` file in the same folder where your images are located.

3. **Step 3: Run the Script**
   - Double-click the `MERGEnew.bat` file.
   - The script will merge every 50 images and create two files: `x1.jpg` (containing images 001-050) and `x2.jpg` (containing images 051-100).

4. **Step 4: Check the Output**
   - After the process is complete, check the folder for the merged files `x1.jpg` and `x2.jpg`.

5. **Step 5: Clean-Up**
   - The script will delete the original images after merging. If you want to keep the original images, remove or comment out the `del` commands in the script.

---

This guide should cover everything necessary to install, run, and modify the batch script for merging `.jpg` images. Let me know if you need any further assistance or clarification!
