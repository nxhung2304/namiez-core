#!/usr/bin/env node

/**
 * Namiez Core CLI Tool
 * Provides command-line interface for Namiez Core Flow setup and management
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Colors for terminal output
const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m'
};

function colorLog(color, message) {
  console.log(`${color}${message}${colors.reset}`);
}

function printSuccess(message) {
  colorLog(colors.green, `✅ ${message}`);
}

function printError(message) {
  colorLog(colors.red, `❌ ${message}`);
}

function printInfo(message) {
  colorLog(colors.blue, `ℹ️  ${message}`);
}

function printWarning(message) {
  colorLog(colors.yellow, `⚠️  ${message}`);
}

function printHeader(message) {
  console.log('');
  colorLog(colors.cyan, '================================');
  colorLog(colors.bright + colors.cyan, message);
  colorLog(colors.cyan, '================================');
  console.log('');
}

function showVersion() {
  const version = fs.readFileSync(path.join(__dirname, '../VERSION'), 'utf8').trim();
  console.log(`Namiez Core v${version}`);
}

function showHelp() {
  console.log('');
  printHeader('Namiez Core CLI - AI Development Workflow');
  
  console.log('Usage:');
  console.log('  namiez-core <command> [options] [project-path]');
  console.log('');
  
  console.log('Commands:');
  console.log('  setup <path>           Set up Namiez Core in a project directory');
  console.log('  init <path>            Initialize new project with Namiez Core');
  console.log('  update <path>          Update existing Namiez Core installation');
  console.log('  flow                   Start Namiez Core Flow (in Claude Code)');
  console.log('  agents                 List available agents');
  console.log('  version                Show version information');
  console.log('  help                   Show this help message');
  console.log('');
  
  console.log('Examples:');
  console.log('  namiez-core setup ./my-project');
  console.log('  namiez-core init ./new-app');
  console.log('  namiez-core update ./existing-project');
  console.log('');
  
  console.log('After setup, use these agents in Claude Code:');
  console.log('  namiez-core-flow           (Complete workflow orchestrator)');
  console.log('  requirements           (Requirements analysis)');
  console.log('  coder                  (Implementation)');
  console.log('  reviewer               (Code review)');
  console.log('  tester                 (Testing)');
  console.log('  refactor               (Code improvement)');
  console.log('  coordinator            (Project overview)');
  console.log('');
  
  console.log('For detailed documentation, visit: https://github.com/your-username/namiez-core');
}

function showAgents() {
  printHeader('Available Namiez Core Agents');
  
  const agents = [
    {
      name: 'namiez-core-flow',
      description: 'Main orchestrator for complete workflow',
      usage: 'namiez-core-flow'
    },
    {
      name: 'requirements',
      description: 'Clarify and document requirements',
      usage: 'requirements'
    },
    {
      name: 'coder',
      description: 'Implement solutions following best practices',
      usage: 'coder'
    },
    {
      name: 'reviewer',
      description: 'Ensure code quality and identify issues',
      usage: 'reviewer'
    },
    {
      name: 'tester',
      description: 'Comprehensive testing and verification',
      usage: 'tester'
    },
    {
      name: 'refactor',
      description: 'Refactor and optimize code',
      usage: 'refactor'
    },
    {
      name: 'coordinator',
      description: 'Project overview and tracking',
      usage: 'coordinator'
    }
  ];
  
  agents.forEach((agent, index) => {
    console.log(`${index + 1}. ${colors.bright}${agent.name}${colors.reset}`);
    console.log(`   ${agent.description}`);
    console.log(`   Usage: ${colors.green}${agent.usage}${colors.reset}`);
    console.log('');
  });
}

function setupProject(projectPath, options = {}) {
  if (!projectPath) {
    printError('Project path is required');
    console.log('Usage: namiez-core setup <project-path>');
    process.exit(1);
  }
  
  const scriptPath = path.join(__dirname, '../scripts/setup.sh');
  
  if (!fs.existsSync(scriptPath)) {
    printError('Setup script not found');
    process.exit(1);
  }
  
  try {
    printHeader('Setting up Namiez Core...');
    
    let command = `bash "${scriptPath}"`;
    
    if (options.update) {
      command += ' --update';
    }
    
    command += ` "${projectPath}"`;
    
    printInfo(`Running: ${command}`);
    execSync(command, { stdio: 'inherit' });
    
  } catch (error) {
    printError(`Setup failed: ${error.message}`);
    process.exit(1);
  }
}

function checkIfInClaudeCode() {
  // Check if we're in a Claude Code environment
  const claudeEnvVars = ['CLAUDE_CODE_SESSION', 'CLAUDE_CODE_PROJECT', 'CLAUDE_CODE_WORKSPACE'];
  const inClaudeCode = claudeEnvVars.some(envVar => process.env[envVar]);
  
  if (!inClaudeCode) {
    printWarning('Namiez Core Flow is designed to be used within Claude Code');
    printInfo('Start Claude Code in your project directory, then type:');
    console.log('');
    console.log('   namiez-core-flow');
    console.log('');
    printInfo('Or use individual agents:');
    console.log('   requirements, coder, reviewer, tester, refactor, coordinator');
    return false;
  }
  return true;
}

function startFlow() {
  printHeader('Namiez Core Flow');
  
  if (!checkIfInClaudeCode()) {
    process.exit(1);
  }
  
  printInfo('Namiez Core Flow orchestrator is ready!');
  printInfo('In Claude Code, simply type:');
  console.log('');
  console.log('   namiez-core-flow');
  console.log('');
  printInfo('This will guide you through the complete development workflow.');
  printInfo('Each agent will maintain context from the previous stage.');
}

function initProject(projectPath) {
  if (!projectPath) {
    printError('Project path is required');
    console.log('Usage: namiez-core init <project-path>');
    process.exit(1);
  }
  
  try {
    printHeader('Initializing new project with Namiez Core...');
    
    // Create project directory
    if (!fs.existsSync(projectPath)) {
      fs.mkdirSync(projectPath, { recursive: true });
      printSuccess(`Created project directory: ${projectPath}`);
    }
    
    // Initialize git repository
    try {
      execSync('git init', { cwd: projectPath, stdio: 'pipe' });
      printSuccess('Initialized Git repository');
    } catch (error) {
      printWarning('Could not initialize Git repository');
    }
    
    // Setup Namiez Core
    setupProject(projectPath);
    
    printSuccess('Project initialized successfully!');
    printInfo(`Next steps:`);
    console.log(`   1. cd ${projectPath}`);
    console.log('   2. Start Claude Code in this directory');
    console.log('   3. Type: namiez-core-flow');
    
  } catch (error) {
    printError(`Initialization failed: ${error.message}`);
    process.exit(1);
  }
}

// Main CLI logic
function main() {
  const args = process.argv.slice(2);
  const command = args[0];
  
  if (!command || command === 'help') {
    showHelp();
    return;
  }
  
  if (command === 'version') {
    showVersion();
    return;
  }
  
  if (command === 'agents') {
    showAgents();
    return;
  }
  
  if (command === 'flow') {
    startFlow();
    return;
  }
  
  if (command === 'setup') {
    setupProject(args[1]);
    return;
  }
  
  if (command === 'init') {
    initProject(args[1]);
    return;
  }
  
  if (command === 'update') {
    setupProject(args[1], { update: true });
    return;
  }
  
  printError(`Unknown command: ${command}`);
  printInfo('Run "namiez-core help" for available commands');
  process.exit(1);
}

// Handle uncaught errors
process.on('uncaughtException', (error) => {
  printError(`Unexpected error: ${error.message}`);
  process.exit(1);
});

// Run the CLI
if (require.main === module) {
  main();
}