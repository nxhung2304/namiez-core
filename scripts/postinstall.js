#!/usr/bin/env node

/**
 * Namiez Core Post-install Script
 * Runs after installation is complete
 */

const fs = require('fs');
const path = require('path');

console.log('');
console.log('🎉 Namiez Core is ready!');
console.log('');

// Check if executable exists
const binPath = path.join(__dirname, '../bin/namiez-core.js');
if (fs.existsSync(binPath)) {
  console.log('✅ CLI tool installed at:', binPath);
  console.log('');
  console.log('Usage examples:');
  console.log('  namiez-core setup ./my-project');
  console.log('  namiez-core init ./new-app');
  console.log('  namiez-core help');
  console.log('');
  console.log('After setup, use these agents in Claude Code:');
  console.log('  namiez-core-flow       (Complete workflow)');
  console.log('  requirements           (Requirements analysis)');
  console.log('  coder                  (Implementation)');
  console.log('  reviewer               (Code review)');
  console.log('  tester                 (Testing)');
  console.log('  refactor               (Code improvement)');
  console.log('  coordinator            (Project overview)');
} else {
  console.error('❌ CLI tool not found at expected location:', binPath);
}

console.log('');
console.log('📚 Documentation: https://github.com/nxhung2304/namiez-core');
console.log('🐛 Issues: https://github.com/nxhung2304/namiez-core/issues');