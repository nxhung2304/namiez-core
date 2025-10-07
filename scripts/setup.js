#!/usr/bin/env node

/**
 * Namiez Core Setup Script
 * Interactive setup for new projects
 */

const { spawn } = require('child_process');
const path = require('path');

console.log('🔧 Namiez Core Setup');
console.log('');

// Run the main setup script
const setupScript = path.join(__dirname, 'setup.sh');
const child = spawn('bash', [setupScript, ...process.argv.slice(2)], {
  stdio: 'inherit'
});

child.on('exit', (code) => {
  process.exit(code);
});