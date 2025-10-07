# AI Development Workflow

This directory contains AI-assisted development documentation and outputs.

## Directory Structure

- `requirements/`     - Requirements analysis documents
- `implementation/`  - Implementation documentation
- `review/`          - Code review reports
- `testing/`         - Test reports and results
- `refactor/`        - Refactoring documentation
- `coordinator/`     - Project coordination and tracking
- `flows/`           - Flow state and session management

## Available Agents

Use these agents directly in Claude Code:

1. **namiez-core-flow** - Main orchestrator for complete workflow
2. **requirements** - Clarify and document requirements
3. **coder** - Implement solutions following best practices
4. **reviewer** - Ensure code quality and identify issues
5. **tester** - Comprehensive testing and verification
6. **refactor** - Refactor and optimize code
7. **coordinator** - Project overview and tracking

## Usage

### Start Complete Workflow
```
namiez-core-flow
```

### Use Individual Agents
```
requirements          # Start with requirements analysis
coder                 # Implement code
reviewer              # Review code quality
tester                # Test functionality
refactor              # Improve code quality
coordinator           # Project overview
```

### Flow Navigation (when using namiez-core-flow)
- `continue` or `next` - Move to next agent
- `previous` or `back` - Go back to previous agent
- `jump to [agent]` - Jump to specific agent
- `show progress` - Display current flow status
- `view outputs` - Show all generated documentation
- `end flow` - Complete and save flow

## Generated Files

Each agent creates documentation files in their respective directories:
- `.ai/requirements/{feature-name}.md`
- `.ai/implementation/{feature-name}.md`
- `.ai/review/{feature-name}.md`
- `.ai/testing/{feature-name}.md`
- `.ai/refactor/{feature-name}.md`
- `.ai/coordinator/SUMMARY-{feature-name}.md`

For more information, see the main project documentation.
