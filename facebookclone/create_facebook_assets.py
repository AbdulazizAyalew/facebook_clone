#!/usr/bin/env python3
"""
Facebook Assets Generator
Creates Facebook-style app icon and splash screen assets
"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_facebook_icon(size, output_path):
    """Create a Facebook-style app icon"""
    # Create image with Facebook blue background
    img = Image.new('RGB', (size, size), '#1877F2')
    draw = ImageDraw.Draw(img)
    
    # Calculate dimensions for the 'f' letter
    font_size = int(size * 0.6)
    
    try:
        # Try to use a system font
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Arial.ttf", font_size)
        except:
            # Fallback to default font
            font = ImageFont.load_default()
    
    # Draw the 'f' letter
    text = "f"
    
    # Get text bounding box
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    # Center the text
    x = (size - text_width) // 2
    y = (size - text_height) // 2 - int(size * 0.05)  # Slight adjustment
    
    # Draw white 'f'
    draw.text((x, y), text, fill='white', font=font)
    
    # Save the image
    img.save(output_path, 'PNG')
    print(f"Created Facebook icon: {output_path}")

def create_splash_logo(output_path):
    """Create a Facebook splash screen logo"""
    size = 200
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))  # Transparent background
    draw = ImageDraw.Draw(img)
    
    # Create a rounded rectangle background
    margin = 20
    corner_radius = 30
    
    # Draw rounded rectangle
    draw.rounded_rectangle(
        [margin, margin, size - margin, size - margin],
        radius=corner_radius,
        fill='#1877F2'
    )
    
    # Draw the 'f' letter
    font_size = int(size * 0.4)
    
    try:
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Arial.ttf", font_size)
        except:
            font = ImageFont.load_default()
    
    text = "f"
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    x = (size - text_width) // 2
    y = (size - text_height) // 2 - int(size * 0.02)
    
    draw.text((x, y), text, fill='white', font=font)
    
    img.save(output_path, 'PNG')
    print(f"Created splash logo: {output_path}")

def main():
    # Create directories if they don't exist
    os.makedirs('assets/icons', exist_ok=True)
    os.makedirs('assets/images', exist_ok=True)
    
    # Create app icon (1024x1024 for best quality)
    create_facebook_icon(1024, 'assets/icons/facebook_icon.png')
    
    # Create splash screen logo
    create_splash_logo('assets/images/facebook_splash_logo.png')
    
    print("\n✅ Facebook assets created successfully!")
    print("📱 App icon: assets/icons/facebook_icon.png")
    print("🎨 Splash logo: assets/images/facebook_splash_logo.png")
    print("\nNext steps:")
    print("1. Run: flutter pub get")
    print("2. Run: dart run flutter_launcher_icons")
    print("3. Run: dart run flutter_native_splash:create")

if __name__ == "__main__":
    main()