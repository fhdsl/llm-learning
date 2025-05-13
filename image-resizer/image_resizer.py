from PIL import Image
import os

def resize_image_to_100x100(image_path):
    """
    Resizes an image to 100x100 pixels and saves it as a PNG file
    with '_small' appended to the original file name.

    Args:
        image_path (str): The file path of the image to resize.
    """
    try:
        # Open the image
        with Image.open(image_path) as img:
            # Resize the image
            img_resized = img.resize((100, 100))

            # Get the file name and directory
            base, ext = os.path.splitext(image_path)
            output_path = f"{base}_small.png"

            # Save the resized image as PNG
            img_resized.save(output_path, format="PNG")
            print(f"Resized image saved to: {output_path}")

    except Exception as e:
        print(f"An error occurred: {e}")



## Test the function:
## python resize_image.py <image_path>

def resize_image_to_100_width(image_path):
    """
    Resizes an image to a width of 100 pixels while preserving the aspect ratio
    and saves it as a PNG file with '_small' appended to the original file name.

    Args:
        image_path (str): The file path of the image to resize.
    """
    try:
        # Open the image
        with Image.open(image_path) as img:
            # Calculate the new height to preserve the aspect ratio
            width, height = img.size
            new_width = 100
            new_height = int((new_width / width) * height)

            # Resize the image
            img_resized = img.resize((new_width, new_height))

            # Get the file name and directory
            base, ext = os.path.splitext(image_path)
            output_path = f"{base}_small.png"

            # Save the resized image as PNG
            img_resized.save(output_path, format="PNG")
            print(f"Resized image saved to: {output_path}")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Usage: python image_resizer.py <image_path>")
    else:
        image_path = sys.argv[1]
        resize_image_to_100_width(image_path)