#!/usr/bin/env node

/**
 * Namiez Core Install Script
 * Runs during npm install to set up the package
 */

const fs = require('fs');
const path = require('path');

console.log('🚀 Namiez Core installed successfully!');

// Make sure the executable is executable
const binPath = path.join(__dirname, '../bin/namiez-core.js');
if (fs.existsSync(binPath)) {
  try {
    fs.chmodSync(binPath, '755');
    console.log('✅ Executable permissions set');
  } catch (error) {
    console.warn('⚠️  Could not set executable permissions:', error.message);
  }
}

console.log('');
console.log('Next steps:');
console.log('1. Run: namiez-core setup ./your-project');
console.log('2. Or: namiez-core init ./new-project');
console.log('');
console.log('For help: namiez-core help');