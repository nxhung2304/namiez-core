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
  console.log('  test verify [path]     Verify Namiez Core setup in test folder');
  console.log('  flow                   Start Namiez Core Flow (in Claude Code)');
  console.log('  agents                 List available agents');
  console.log('  version                Show version information');
  console.log('  help                   Show this help message');
  console.log('');
  
  console.log('Examples:');
  console.log('  namiez-core setup ./my-project');
  console.log('  namiez-core init ./new-app');
  console.log('  namiez-core update ./existing-project');
  console.log('  namiez-core test verify ./test-project');
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
  
  console.log('For detailed documentation, visit: https://github.com/nxhung2304e/namiez-core');
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

function verifyTestSetup(testPath) {
  printHeader('Namiez Core Test Setup Verification');
  
  const path = require('path');
  const projectPath = path.resolve(testPath);
  
  printInfo(`Verifying Namiez Core setup in: ${projectPath}`);
  
  const verificationResults = {
    passed: 0,
    failed: 0,
    warnings: 0,
    details: []
  };
  
  // Helper functions
  function checkResult(name, passed, message, details = '') {
    if (passed) {
      printSuccess(`✅ ${name}: ${message}`);
      verificationResults.passed++;
    } else {
      printError(`❌ ${name}: ${message}`);
      verificationResults.failed++;
    }
    if (details) {
      verificationResults.details.push({ name, status: passed ? 'PASS' : 'FAIL', message, details });
    }
  }
  
  function checkWarning(name, message, details = '') {
    printWarning(`⚠️  ${name}: ${message}`);
    verificationResults.warnings++;
    if (details) {
      verificationResults.details.push({ name, status: 'WARN', message, details });
    }
  }
  
  // 1. Check if directory exists
  if (!fs.existsSync(projectPath)) {
    printError(`Directory does not exist: ${projectPath}`);
    process.exit(1);
  }
  
  checkResult('Directory', fs.existsSync(projectPath), 'Directory exists', projectPath);
  
  // 2. Check .ai directory structure
  const aiDir = path.join(projectPath, '.ai');
  const aiExists = fs.existsSync(aiDir);
  checkResult('AI Directory', aiExists, '.ai directory exists', aiDir);
  
  if (aiExists) {
    const requiredDirs = ['requirements', 'implementation', 'review', 'testing', 'refactor', 'coordinator', 'flows'];
    requiredDirs.forEach(dir => {
      const dirPath = path.join(aiDir, dir);
      const exists = fs.existsSync(dirPath);
      checkResult(`AI Subdirectory`, exists, `.ai/${dir} exists`, dirPath);
    });
    
    // Check .ai README
    const aiReadme = path.join(aiDir, 'README.md');
    checkResult('AI README', fs.existsSync(aiReadme), '.ai/README.md exists');
  }
  
  // 3. Check .claude/agents directory
  const claudeAgentsDir = path.join(projectPath, '.claude/agents');
  const claudeExists = fs.existsSync(claudeAgentsDir);
  checkResult('Claude Agents Directory', claudeExists, '.claude/agents directory exists', claudeAgentsDir);
  
  if (claudeExists) {
    // Check required agent files
    const requiredAgents = [
      'namiez-core-flow.md',
      'requirements.md',
      'coder.md',
      'reviewer.md',
      'tester.md',
      'refactor.md',
      'coordinator.md'
    ];
    
    requiredAgents.forEach(agent => {
      const agentPath = path.join(claudeAgentsDir, agent);
      const exists = fs.existsSync(agentPath);
      checkResult(`Agent File`, exists, `${agent} exists`, agentPath);
    });
  }
  
  // 4. Check configuration files
  const configFiles = [
    { name: 'AI Config', path: '.ai-config.json', required: true },
    { name: 'Version File', path: '.ai-version', required: true },
    { name: 'Installation Date', path: '.ai-installed', required: true },
    { name: 'Claude Ignore', path: '.claudeignore', required: true },
    { name: 'Project README', path: 'README.md', required: true }
  ];
  
  configFiles.forEach(config => {
    const configPath = path.join(projectPath, config.path);
    const exists = fs.existsSync(configPath);
    checkResult(config.name, exists, `${config.path} exists`, configPath);
    
    if (exists && config.path === '.ai-config.json') {
      try {
        const configContent = JSON.parse(fs.readFileSync(configPath, 'utf8'));
        checkResult('Config JSON', true, 'Valid JSON configuration');
        const projectName = configContent.name;
        const hasAgents = configContent.agents && typeof configContent.agents === 'object' && Object.keys(configContent.agents).length > 0;
        checkResult('Project Name', !!projectName, `Project name configured: ${projectName}`);
        checkResult('Agents Config', hasAgents, `Agents configuration exists (${Object.keys(configContent.agents || {}).length} agents)`);
      } catch (error) {
        checkResult('Config JSON', false, 'Invalid JSON in .ai-config.json');
      }
    }
  });
  
  // 5. Check templates directory
  const templatesDir = path.join(projectPath, '.ai-templates');
  const templatesExist = fs.existsSync(templatesDir);
  if (templatesExist) {
    checkWarning('Templates', 'Templates directory exists', 'Extra .ai-templates directory found');
  } else {
    checkWarning('Templates', 'Templates directory missing', 'Consider adding .ai-templates directory');
  }
  
  // 6. Summary
  console.log('');
  printHeader('Verification Summary');
  
  console.log(`✅ Passed: ${verificationResults.passed}`);
  if (verificationResults.failed > 0) {
    console.log(`❌ Failed: ${verificationResults.failed}`);
  }
  if (verificationResults.warnings > 0) {
    console.log(`⚠️  Warnings: ${verificationResults.warnings}`);
  }
  
  // 7. Final verdict
  console.log('');
  if (verificationResults.failed === 0) {
    if (verificationResults.warnings === 0) {
      printSuccess('🎉 Perfect! Namiez Core setup is complete and correct');
      console.log('');
      printInfo('Ready to use:');
      printInfo('1. cd ' + projectPath);
      printInfo('2. Start Claude Code');
      printInfo('3. Type: namiez-core-flow');
    } else {
      printWarning('⚠️  Namiez Core setup is functional with some warnings');
      console.log('');
      printInfo('Setup works, but consider addressing the warnings above');
    }
    process.exit(0);
  } else {
    printError('❌ Namiez Core setup has critical issues');
    console.log('');
    printInfo('Please fix the failed checks above');
    printInfo('Try running: namiez-core setup ' + projectPath);
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
  
  if (command === 'test') {
    const testCommand = args[1];
    if (testCommand === 'verify') {
      verifyTestSetup(args[2] || '.');
      return;
    } else {
      printError('Unknown test command. Available: verify');
      printInfo('Usage: namiez-core test verify [path]');
      process.exit(1);
    }
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
