#!/bin/bash
set -e

# AI-Core Setup Script
# This script sets up namiez-core with unified flow orchestration

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
REPO_URL="https://github.com/your-username/namiez-core.git"
BRANCH="main"
UPDATE_MODE=false
PROJECT_PATH=""
AI_CORE_VERSION="1.0.0"

# Functions
print_usage() {
    echo "AI-Core Setup Script"
    echo ""
    echo "Usage: $0 [OPTIONS] PROJECT_PATH"
    echo ""
    echo "Options:"
    echo "  -h, --help              Show this help message"
    echo "  -r, --repo URL          Custom namiez-core repository URL"
    echo "  -b, --branch BRANCH     Specific branch to use (default: main)"
    echo "  -u, --update            Update existing namiez-core installation"
    echo ""
    echo "Examples:"
    echo "  $0 /path/to/my-project"
    echo "  $0 --repo https://github.com/my-org/namiez-core.git /path/to/project"
    echo ""
    echo "This script will:"
    echo "  1. Check dependencies"
    echo "  2. Clone or update namiez-core"
    echo "  3. Set up .ai directory structure"
    echo "  4. Install agents in .claude/agents/"
    echo "  5. Create configuration files"
    echo "  6. Generate README"
    echo ""
    echo "After setup, you can use agents directly:"
    echo "  - namiez-core-flow (main orchestrator)"
    echo "  - requirements"
    echo "  - coder"
    echo "  - reviewer"
    echo "  - tester"
    echo "  - refactor"
    echo "  - coordinator"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Check if required dependencies are installed
check_dependencies() {
    print_header "Checking Dependencies"
    
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install git first."
        exit 1
    fi
    print_success "Git is installed"
    
    if [ ! -w "$(dirname "$PROJECT_PATH")" ]; then
        print_error "Cannot write to parent directory of $PROJECT_PATH"
        exit 1
    fi
    print_success "Directory permissions OK"
}

# Set up AI directory structure
setup_ai_structure() {
    print_header "Setting Up AI Directory Structure"
    
    local project_root="$PROJECT_PATH"
    
    # Create main .ai directory
    mkdir -p "$project_root/.ai"
    print_success "Created .ai directory"
    
    # Create subdirectories
    local dirs=("requirements" "implementation" "review" "testing" "refactor" "coordinator" "flows")
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$project_root/.ai/$dir"
        print_success "Created .ai/$dir directory"
    done
    
    # Create .claude/agents directory
    mkdir -p "$project_root/.claude/agents"
    print_success "Created .claude/agents directory"
    
    # Create a README in .ai directory
    cat > "$project_root/.ai/README.md" << 'EOF'
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
EOF
    
    print_success "Created .ai/README.md"
}

# Install agents in .claude/agents/ directory
install_agents() {
    print_header "Installing AI Agents"
    
    local project_root="$PROJECT_PATH"
    local agents_dir="$project_root/.claude/agents"
    
    # List of agent files to copy
    local agents=("namiez-core-flow.md" "requirements.md" "coder.md" "reviewer.md" "tester.md" "refactor.md" "coordinator.md")
    
    for agent in "${agents[@]}"; do
        if [ -f ".claude/agents/$agent" ]; then
            cp ".claude/agents/$agent" "$agents_dir/"
            
            # Get agent name without .md extension for display
            local agent_name=$(basename "$agent" .md)
            print_success "Installed agent: $agent_name"
        else
            print_warning "Agent file not found: $agent"
        fi
    done
    
    # Create a .claudeignore file to exclude certain files
    cat > "$project_root/.claudeignore" << 'EOF'
# AI-Core ignore patterns
node_modules/
.git/
.vscode/
.idea/
*.log
.DS_Store
dist/
build/
coverage/
*.tmp
*.temp
.ai/coordinator/TRACKING-*
.ai/coordinator/SUMMARY-*
.ai/flows/FLOW-STATUS-*
EOF
    
    print_success "Created .claudeignore file"
}

# Create templates
setup_templates() {
    print_header "Setting Up Templates"
    
    local project_root="$PROJECT_PATH"
    
    # Create templates directory
    mkdir -p "$project_root/.ai-templates"
    print_success "Created templates directory"
    
    # Copy all templates if they exist
    if [ -d "templates" ]; then
        cp -r templates/* "$project_root/.ai-templates/"
        print_success "Copied agent templates"
    fi
    
    # Create flow-specific templates
    cat > "$project_root/.ai-templates/flow-status.md" << 'EOF'
# AI Core Flow Status

**Project**: {project-name}
**Started**: {start-time}
**Current Stage**: {current-stage}
**Progress**: {progress}

## Completed Stages
{completed-stages}

## Current Stage: {current-stage}
**Agent**: {current-agent}
**Started**: {stage-start-time}
**Status**: {status}

## Generated Documents
{generated-documents}

## Context Summary
{context-summary}

## Next Steps
{next-steps}

---
*Flow Status Generated: {timestamp}*
EOF
    
    cat > "$project_root/.ai-templates/flow-summary.md" << 'EOF'
# AI Core Flow Summary

**Project**: {project-name}
**Total Duration**: {total-duration}
**Stages Completed**: {stages-completed}
**Success**: {success-status}

## Workflow Used
{workflow-used}

## Stage Details
{stage-details}

## Documents Generated
{documents-list}

## Quality Metrics
{quality-metrics}

## Key Achievements
{achievements}

## Challenges & Solutions
{challenges}

## Lessons Learned
{lessons-learned}

## Recommendations
{recommendations}

---
*Flow Completed: {completion-timestamp}*
EOF
    
    print_success "Created flow-specific templates"
}

# Create README file in project root
create_readme() {
    print_header "Creating Project Documentation"
    
    local project_root="$PROJECT_PATH"
    
    # Check if README already exists
    if [ -f "$project_root/README.md" ] && [ "$UPDATE_MODE" = false ]; then
        print_warning "README.md already exists. Skipping creation."
        return
    fi
    
    cat > "$project_root/README.md" << EOF
# $(basename "$project_root")

AI-assisted development project using AI-Core agents.

## 🚀 Quick Start

### Complete Workflow (Recommended)
Type in Claude Code:
\`\`\`bash
namiez-core-flow
\`\`\`

This will guide you through the complete development workflow from requirements to deployment-ready code.

### Individual Agents
You can also use agents directly:
\`\`\`bash
requirements          # Start with requirements analysis
coder                 # Implement code
reviewer              # Review code quality
tester                # Test functionality
refactor              # Improve code quality
coordinator           # Project overview
\`\`\`

## 📋 Available Agents

1. **namiez-core-flow** - Main orchestrator for complete workflow
2. **requirements** - Clarify and document requirements
3. **coder** - Implement solutions following best practices  
4. **reviewer** - Ensure code quality and identify issues
5. **tester** - Comprehensive testing and verification
6. **refactor** - Refactor and optimize code
7. **coordinator** - Project overview and tracking

## 🎯 Workflow Example

### Start Complete Flow
\`\`\`bash
namiez-core-flow
\`\`\`

### Choose Your Project Type
\`\`\`
What would you like to work on today?
1. New Feature
2. Bug Fix
3. Code Review
4. Refactoring

Choose option (1-5):
\`\`\`

### Follow Guided Process
The flow will guide you through each stage, maintaining context throughout:
1. **Requirements** - Describe what you want to build
2. **Implementation** - AI helps you code it
3. **Review** - Quality check and improvements
4. **Testing** - Verify it works correctly
5. **Refactor** - Polish and optimize

### Navigate the Flow
During the flow, use these commands:
- \`continue\` or \`next\` - Move to next agent
- \`previous\` or \`back\` - Go back one stage
- \`jump to [agent]\` - Jump to specific agent
- \`show progress\` - See current status
- \`view outputs\` - See all generated documentation
- \`end flow\` - Complete and generate summary

## 📁 Generated Documentation

All outputs are stored in the \`.ai/\` directory:

- \`.ai/requirements/\` - Requirements analysis
- \`.ai/implementation/\` - Implementation details
- \`.ai/review/\` - Code review reports  
- \`.ai/testing/\` - Test results
- \`.ai/refactor/\` - Refactoring documentation
- \`.ai/coordinator/\` - Project tracking
- \`.ai/flows/\` - Flow state and session management

## ⚙️ Configuration

AI-Core is configured via \`.ai-config.json\` in the project root.

## 🔄 Quick Workflows

### Bug Fix
\`\`\`bash
namiez-core-flow → (choose Bug Fix) → coder → tester
\`\`\`

### Code Review Only
\`\`\`bash
reviewer
\`\`\`

### Enhancement
\`\`\`bash
namiez-core-flow → (choose Enhancement) → requirements → coder → tester
\`\`\`

## 💡 Tips

- **Use namiez-core-flow** for complete projects - it maintains context across all stages
- **Stay in control** - you decide when to move to the next agent
- **Jump around** - go back to previous agents or skip ahead as needed
- **Auto-documentation** - everything is documented automatically

For detailed documentation, see the [AI-Core repository](https://github.com/your-username/namiez-core).

---

*Generated by AI-Core v$AI_CORE_VERSION*
EOF
    
    print_success "Created README.md"
}

# Create configuration file
create_config() {
    local project_root="$PROJECT_PATH"
    
    cat > "$project_root/.ai-config.json" << EOF
{
  "version": "$AI_CORE_VERSION",
  "name": "$(basename "$project_root")",
  "description": "AI-assisted development project",
  "flow_mode": "unified",
  "agents": {
    "namiez-core-flow": {
      "enabled": true,
      "file": ".claude/agents/namiez-core-flow.md",
      "role": "orchestrator",
      "manages_workflow": true
    },
    "requirements": {
      "enabled": true,
      "file": ".claude/agents/requirements.md",
      "output_dir": ".ai/requirements",
      "template": ".ai-templates/requirements_template.md"
    },
    "coder": {
      "enabled": true,
      "file": ".claude/agents/coder.md",
      "output_dir": ".ai/implementation",
      "template": ".ai-templates/implementation_template.md"
    },
    "reviewer": {
      "enabled": true,
      "file": ".claude/agents/reviewer.md",
      "output_dir": ".ai/review",
      "template": ".ai-templates/review_template.md"
    },
    "tester": {
      "enabled": true,
      "file": ".claude/agents/tester.md",
      "output_dir": ".ai/testing",
      "template": ".ai-templates/testing_template.md"
    },
    "refactor": {
      "enabled": true,
      "file": ".claude/agents/refactor.md",
      "output_dir": ".ai/refactor",
      "template": ".ai-templates/refactor_template.md"
    },
    "coordinator": {
      "enabled": true,
      "file": ".claude/agents/coordinator.md",
      "output_dir": ".ai/coordinator"
    }
  },
  "workflows": {
    "standard": ["requirements", "coder", "reviewer", "tester", "refactor"],
    "quick": ["coder", "tester"],
    "review_only": ["reviewer"],
    "bug_fix": ["coder", "tester"],
    "enhancement": ["requirements", "coder", "tester"],
    "full": ["coordinator", "requirements", "coder", "reviewer", "tester", "refactor"]
  },
  "flow_settings": {
    "auto_progress": false,
    "show_summaries": true,
    "save_intermediate": true,
    "allow_skipping": true,
    "require_confirmation": true,
    "maintain_context": true,
    "generate_docs": true
  },
  "output": {
    "flow_state_dir": ".ai/flows",
    "status_template": ".ai-templates/flow-status.md",
    "summary_template": ".ai-templates/flow-summary.md",
    "auto_save": true,
    "timestamp_format": "YYYY-MM-DD HH:mm:ss"
  },
  "git": {
    "track_ai_docs": true,
    "ignore_patterns": [
      ".ai/flows/FLOW-STATUS-*",
      "*.tmp",
      "*.log"
    ]
  }
}
EOF
    
    print_success "Created .ai-config.json"
}

# Save version information
save_version() {
    print_header "Saving Version Information"
    
    local project_root="$PROJECT_PATH"
    
    echo "$AI_CORE_VERSION" > "$project_root/.ai-version"
    print_success "Created .ai-version file"
    
    echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$project_root/.ai-installed"
    print_success "Recorded installation date"
}

# Update existing installation
update_installation() {
    local ai_core_source="$1"
    local project_root="$PROJECT_PATH"
    
    print_info "Updating existing AI-Core installation..."
    
    # Backup existing configuration if it exists
    if [ -f "$project_root/.ai-config.json" ]; then
        cp "$project_root/.ai-config.json" "$project_root/.ai-config.json.backup"
        print_success "Backed up existing configuration"
    fi
    
    # Update agents
    print_info "Updating agents..."
    for agent_file in "$ai_core_source/.claude/agents"/*.md; do
        if [ -f "$agent_file" ]; then
            local agent_name=$(basename "$agent_file")
            cp "$agent_file" "$project_root/.claude/agents/"
            print_success "Updated $agent_name"
        fi
    done
    
    # Update templates if directory exists
    if [ -d "$project_root/.ai-templates" ]; then
        print_info "Updating templates..."
        cp -r "$ai_core_source/templates/"* "$project_root/.ai-templates/" 2>/dev/null || true
        print_success "Updated templates"
    fi
    
    # Restore configuration from backup if the new one doesn't exist
    if [ ! -f "$project_root/.ai-config.json" ] && [ -f "$project_root/.ai-config.json.backup" ]; then
        mv "$project_root/.ai-config.json.backup" "$project_root/.ai-config.json"
        print_info "Restored custom configuration"
    fi
    
    save_version
    print_success "Update completed successfully"
}

# New installation
install_ai_core() {
    local ai_core_source="$1"
    
    print_info "Installing AI-Core..."
    
    # Set up directory structure
    setup_ai_structure
    
    # Install agents
    cd "$ai_core_source"
    install_agents
    
    # Copy templates
    setup_templates
    
    # Create configuration
    create_config
    
    # Create documentation
    create_readme
    
    # Save version
    save_version
}

# Clone namiez-core repository
clone_ai_core() {
    print_header "Installing AI-Core"
    
    local temp_dir=$(mktemp -d)
    print_info "Using temporary directory: $temp_dir"
    
    # For now, we'll install from the current directory since we're already in the repo
    local ai_core_source="."
    
    if [ "$UPDATE_MODE" = true ]; then
        update_installation "$ai_core_source"
    else
        install_ai_core "$ai_core_source"
    fi
    
    # Clean up
    rm -rf "$temp_dir"
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                print_usage
                exit 0
                ;;
            -r|--repo)
                REPO_URL="$2"
                shift 2
                ;;
            -b|--branch)
                BRANCH="$2"
                shift 2
                ;;
            -u|--update)
                UPDATE_MODE=true
                shift
                ;;
            -*)
                print_error "Unknown option: $1"
                print_usage
                exit 1
                ;;
            *)
                if [ -z "$PROJECT_PATH" ]; then
                    PROJECT_PATH="$1"
                else
                    print_error "Multiple project paths provided"
                    print_usage
                    exit 1
                fi
                shift
                ;;
        esac
    done
}

# Validate arguments
validate_args() {
    if [ -z "$PROJECT_PATH" ]; then
        print_error "PROJECT_PATH is required"
        print_usage
        exit 1
    fi
    
    # Convert to absolute path
    if [[ "$PROJECT_PATH" != /* ]]; then
        PROJECT_PATH="$(pwd)/$PROJECT_PATH"
    fi
    
    # Check if project directory exists
    if [ "$UPDATE_MODE" = false ] && [ -d "$PROJECT_PATH" ]; then
        print_error "Directory already exists: $PROJECT_PATH"
        print_info "Use --update flag to update existing installation"
        exit 1
    fi
    
    if [ "$UPDATE_MODE" = true ] && [ ! -d "$PROJECT_PATH" ]; then
        print_error "Directory does not exist for update: $PROJECT_PATH"
        exit 1
    fi
    
    # Create project directory if it doesn't exist (for new installations)
    if [ "$UPDATE_MODE" = false ]; then
        mkdir -p "$PROJECT_PATH"
    fi
}

# Main execution
main() {
    print_header "AI-Core Setup Script v$AI_CORE_VERSION"
    
    parse_args "$@"
    validate_args
    
    print_info "Project path: $PROJECT_PATH"
    print_info "Repository: $REPO_URL"
    print_info "Branch: $BRANCH"
    print_info "Update mode: $UPDATE_MODE"
    
    check_dependencies
    clone_ai_core
    
    print_header "Setup Complete! 🎉"
    print_success "AI-Core has been installed successfully!"
    print_info "Project directory: $PROJECT_PATH"
    
    if [ "$UPDATE_MODE" = true ]; then
        print_info "Your existing configuration has been preserved."
    fi
    
    echo ""
    print_info "🚀 Quick Start:"
    print_info "1. cd $PROJECT_PATH"
    print_info "2. Type 'namiez-core-flow' in Claude Code to start the complete workflow"
    print_info "3. Or use individual agents: requirements, coder, reviewer, tester, refactor"
    
    echo ""
    print_info "📚 Available Agents:"
    print_info "- namiez-core-flow    (Complete workflow orchestrator)"
    print_info "- requirements    (Requirements analysis)"
    print_info "- coder           (Implementation)"
    print_info "- reviewer        (Code review)"
    print_info "- tester          (Testing)"
    print_info "- refactor        (Code improvement)"
    print_info "- coordinator     (Project overview)"
    
    print_success "Happy building with AI-Core! 🚀"
}

# Run main function with all arguments
main "$@"