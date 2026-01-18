// Simple Facebook Assets Creator
// Run with: node create_basic_assets.js

const fs = require('fs');

// Create SVG for app icon
const appIconSVG = `
<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">
  <rect width="1024" height="1024" fill="#1877F2"/>
  <text x="512" y="650" font-family="Arial, sans-serif" font-size="600" font-weight="bold" text-anchor="middle" fill="white">f</text>
</svg>
`;

// Create SVG for splash logo
const splashLogoSVG = `
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect x="20" y="20" width="160" height="160" rx="25" ry="25" fill="#1877F2"/>
  <text x="100" y="130" font-family="Arial, sans-serif" font-size="80" font-weight="bold" text-anchor="middle" fill="white">f</text>
</svg>
`;

// Save SVG files
fs.writeFileSync('facebook_icon.svg', appIconSVG);
fs.writeFileSync('facebook_splash_logo.svg', splashLogoSVG);

console.log('✅ SVG assets created!');
console.log('📝 Next steps:');
console.log('1. Convert SVG to PNG using online converter or image editor');
console.log('2. Save app icon as assets/icons/facebook_icon.png (1024x1024)');
console.log('3. Save splash logo as assets/images/facebook_splash_logo.png (200x200)');
console.log('4. Run: dart run flutter_launcher_icons');
console.log('5. Run: dart run flutter_native_splash:create');